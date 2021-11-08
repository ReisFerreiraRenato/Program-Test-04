unit untFuncoes;

interface

function CalcularResto(prmValor: Integer; var prmResto: Integer; prmDivisor: Integer): Integer;
function Copiar(str: String; indice, qtdcaracteres: Integer): String;
function Tamanho(Str: String): Integer;

implementation

function CalcularResto(prmValor: Integer; var prmResto: Integer; prmDivisor: Integer): Integer;
var LocDouble: Double;
begin
  LocDouble := prmValor / prmDivisor;
  prmResto  := prmValor - (prmDivisor*trunc(LocDouble));
  result    := Trunc(LocDouble);
end;

function Copiar(str: String; indice, qtdcaracteres: Integer): String;
var
  LocStrAux: String;
  LocCont, LocContAux: Integer;
begin
  LocContAux := 1;
  LocStrAux := '';
  for LocCont := indice to (indice+qtdcaracteres)-1 do
  begin
    LocStrAux:= LocStrAux + str[LocCont];
    LocContAux := LocContAux +1;
  end;

  Result := LocStrAux;
end;

function Tamanho(Str: String): Integer;
begin
  Result := length(str);
end;


end.
