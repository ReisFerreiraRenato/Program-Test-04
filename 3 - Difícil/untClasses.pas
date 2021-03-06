unit untClasses;

interface

uses uINetwork, untClassConexao;

  type


    TNetWork = class (TInterfacedObject, INetWork)
      private
      FQtdElementos: Integer;
      FElementos: array of integer;
      FConexoes: array of TConexoes;
        function GetElemento(indice: Integer): Integer;
        function GetConexao(indice: Integer): TConexoes;
        function ListaConexoes(Valor: integer): String;
        function TemConexoesDiretas(Valor1: Integer): Boolean;
      public
        property QtdElementos: Integer read FQtdElementos write FQtdElementos;
        property Elemento[indice: Integer]: integer read GetElemento;
        property Conexoes[indice: Integer]: TConexoes read GetConexao;
        Constructor Create(Quantidade: Integer);
        procedure InsertElemento(prmElemento: Integer);
        procedure Clear();
        function AdicionarConexao(Conexao: TConexoes): Boolean;
        function Conectar(Valor1, Valor2: integer; var Conexao: TConexoes): Boolean;
        function Consulta(Valor1, Valor2: Integer; ValorAnterior: integer = 0): boolean;
        function CountElementos(): Integer;
        function CountNetWorks(): Integer;
    end;

implementation

uses StrUtils, untFuncoes, SysUtils;
{ TNetWork }

function TNetWork.AdicionarConexao(Conexao: TConexoes): Boolean;
Var
  LocQTD: Integer;
begin
  Result := False;
  LocQTD := Length(FConexoes);
  SetLength(FConexoes, LocQTD+1);
  FConexoes[LocQTD] := Conexao;
  Result := True;
end;

procedure TNetWork.Clear;
begin
  FQtdElementos := 0;
  SetLength(FElementos, 0);
  SetLength(FConexoes, 0);
end;

function TNetWork.Conectar(Valor1, Valor2: integer; var Conexao: TConexoes): Boolean;
var
  LocConexoes: TConexoes;
begin
  Result := False;
  if not EstarnoVetor(Valor1, Valor2, FElementos) then
  begin
    Exit;
  end;

  LocConexoes := TConexoes.Create(Valor1, Valor2);
  Conexao := LocConexoes;
  Result:= True;
end;

constructor TNetWork.Create(Quantidade: Integer);
begin
  QtdElementos := Quantidade;
end;

function TNetWork.GetConexao(indice: Integer): TConexoes;
begin
  Result:= FConexoes[indice];
end;

function TNetWork.GetElemento(indice: Integer): Integer;
begin
  result:= FElementos[indice];
end;

procedure TNetWork.InsertElemento(prmElemento: Integer);
begin
  SetLength(FElementos, FQtdElementos+1);
  FElementos[FQtdElementos] := prmElemento;
  Inc(FQtdElementos);
end;

function TNetWork.ListaConexoes(Valor: integer): String;
var
  LocCont, LocQtd: Integer;
  LocArray: String;
begin
  Result:= '';
  for LocCont := 0 to Length(FConexoes)-1 do
  begin
    if (FConexoes[LocCont].GetElemento1 = Valor) or (FConexoes[LocCont].GetElemento2 = Valor) then
    begin
      LocQtd := Length(LocArray); 
      LocArray := LocArray + IntToStr(LocCont)+',';
    end;
  end;
  Result := LocArray;
end;

function TNetWork.TemConexoesDiretas(Valor1: Integer): Boolean;
var LocContador: Integer;
begin
  Result:= False;
  for LocContador := 0 to Length(FConexoes)-1 do
  begin
    if (FConexoes[LocContador].GetElemento1 = Valor1) or 
          (FConexoes[LocContador].GetElemento2 = Valor1) then
    begin
      Result:= True;
      Exit;
    end;
  end;
end;

function TNetWork.Consulta(Valor1, Valor2: Integer; ValorAnterior: integer = 0): boolean;
var
  LocCont, ValAux: Integer;
  LocStrAux, LocElementosAux: String;
begin
  Result := False;
  //Verificando se os dois elementos tem conexoes
  if TemConexoesDiretas(Valor1) and  TemConexoesDiretas(Valor2) then
  begin
    //Consulta direta
    for LocCont := 0 to Length(FConexoes)-1 do
    begin
      if (FConexoes[LocCont].GetElemento1 = Valor1) and (FConexoes[LocCont].GetElemento2 = Valor2)  then
      begin
        Result:= True;
        Exit;
      end;
    end;

    //Consulta direta Valores Invertidos
    for LocCont := 0 to Length(FConexoes)-1 do
    begin
      if (FConexoes[LocCont].GetElemento1 = Valor2) and (FConexoes[LocCont].GetElemento2 = Valor1)  then
      begin
        Result:= True;
        Exit;
      end;
    end;

    //Consulta Indireta pelo Elemento 1
    LocStrAux:= ListaConexoes(Valor1);

    while LocStrAux.Length > 0 do
    begin
      ValAux:= StrToInt(Copy(LocStrAux,0, Pos(',', LocStrAux)-1));
      if (FConexoes[ValAux].GetElemento1 <> ValorAnterior)
        and (FConexoes[ValAux].GetElemento2 <> ValorAnterior) then
      begin
        if Consulta(FConexoes[ValAux].GetElemento2, Valor2, Valor1) then
        begin
          Result:= True;
          Exit;
        end
      end
      else
        LocStrAux := Copy(LocStrAux, Pos(',', LocStrAux)+1, Length(LocStrAux) - Pos(',', LocStrAux)+1);
    end;

    //Consulta Indireta pelo Elemento 2
    LocStrAux:= ListaConexoes(Valor2);

    while LocStrAux.Length > 0 do
    begin
      ValAux:= StrToInt(Copy(LocStrAux,0, Pos(',', LocStrAux)-1));
      if (FConexoes[ValAux].GetElemento1 <> ValorAnterior)
        and (FConexoes[ValAux].GetElemento2 <> ValorAnterior) then
      begin
        if Consulta(FConexoes[ValAux].GetElemento1, Valor1, Valor2) then
        begin
          Result:= True;
          Exit;
        end
      end
      else
        LocStrAux := Copy(LocStrAux, Pos(',', LocStrAux)+1, Length(LocStrAux) - Pos(',', LocStrAux)+1);
    end;
  end;
end;

function TNetWork.CountElementos: Integer;
begin
  Result:= Length(FElementos);
end;

function TNetWork.CountNetWorks: Integer;
begin
  Result:= Length(FConexoes);
end;



end.
