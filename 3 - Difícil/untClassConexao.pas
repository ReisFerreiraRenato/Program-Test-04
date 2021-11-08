unit untClassConexao;

interface
  type
    TConexoes = class
    private
      FElemento1: Integer;
      FElemento2: Integer;
    public
      Constructor Create(Valor1, Valor2: Integer);

      function GetElemento1(): Integer;
      function GetElemento2(): Integer;
      function Conexao(Val1, Val2: integer):Boolean;
    end;

implementation

{ TConeccoes }

function TConexoes.Conexao(Val1, Val2: integer): Boolean;
var
  LocTem: Boolean;
begin
  Result := False;
  if ((Val1 = FElemento1) and (Val2 = FElemento2)) or ((Val2=FElemento1) and (Val1 =FElemento2)) then
    Result := True;
end;

constructor TConexoes.Create(Valor1, Valor2: Integer);
begin
  FElemento1 := Valor1;
  FElemento2 := Valor2;
end;

function TConexoes.GetElemento1: Integer;
begin
  result:= FElemento1;
end;

function TConexoes.GetElemento2: Integer;
begin
  Result := FElemento2;
end;
end.
