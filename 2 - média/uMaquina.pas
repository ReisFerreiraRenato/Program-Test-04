unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, System.SysUtils, untFuncoes;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(Troco: Double): TList;
  end;

implementation

uses math;

function TMaquina.MontarTroco(Troco: Double): TList;
const
      nota: array[1..7] of integer = (100, 50, 20, 10, 5, 2, 1);
       centavos: array[1..5] of integer = (50, 25, 10, 5, 1);
var LocContador, LocDecimal, LocQtd, LocResto: Integer;
    LocDouble: Double;
    StrAux: String;
    LocLista: TList;
    LocCedula: TTroco;
    LocTipo: TCedula;
begin
  LocLista := TList.Create;
  LocQtd := 0;
  LocDouble := StrToFloat(StringReplace(FloatToStr(Troco),'.','', [rfReplaceAll, rfIgnoreCase]));
  StrAux := FloatToStr(LocDouble);
  LocDecimal := StrToInt(Copiar(StrAux,Tamanho(StrAux)-1,2));
  LocResto := Trunc(LocDouble);

  //Calculando a parte Inteira
  for LocContador := 1 to 7 do
  begin
    LocQtd := CalcularResto(LocResto, LocResto, nota[LocContador]);
    LocTipo := TCedula(LocContador-1);
    LocCedula := TTroco.Create(LocTipo, LocQtd);
    LocLista.Add(LocCedula);
  end;

  LocResto := LocDecimal;

  //Calculando a parte Decimal
  for LocContador := 1 to 5 do
  begin
    LocQtd := CalcularResto(LocResto, LocResto, centavos[LocContador]);
    LocTipo := TCedula(LocContador+6);
    LocCedula := TTroco.Create(LocTipo, LocQtd);
    LocLista.Add(LocCedula);
  end;

  Result := LocLista;

end;

end.

