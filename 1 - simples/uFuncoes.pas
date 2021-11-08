unit uFuncoes;

interface

function AdicionarStringNew(str: String; indices: array of integer; TamanhoNovo: integer; NewString: String): String;

function Copiar(str: String; indice, qtdcaracteres: Integer): String;

function RemoverStringsOld(str: String; var indices: array of integer; qtd: integer): String;

function Tamanho(Str: String): Integer;

function TamanhoArray(Vetor: array of integer): integer;

implementation

function AdicionarStringNew(str: String; indices: array of integer; TamanhoNovo: integer; NewString: String): String;
var
  LocContador, LocConAuxiliar, LocContadorNewString: Integer;
  LocAuxiliar: String;
begin
  LocContador := 1;   //percorrer a string
  LocConAuxiliar := 0;  //percorres o array
  while LocContador <= Tamanho(str) do
  begin
    if LocContador = indices[LocConAuxiliar] then //Ponto de inserção
    begin
      LocContadorNewString := 1; //percorrer a string New
      while LocContadorNewString <= TamanhoNovo do //Inserindo Nova String
      begin
        LocAuxiliar := LocAuxiliar + NewString[LocContadorNewString];

        LocContadorNewString := LocContadorNewString + 1;
      end;

      LocConAuxiliar := LocConAuxiliar + 1;       //Indice proxima Inserção
      //indices[LocConAuxiliar]:= indices[LocConAuxiliar] + TamanhoNovo; //Atualizando porximo indice de inserção
    end
    else
    begin
      LocAuxiliar := LocAuxiliar + str[LocContador];
      LocContador := LocContador + 1;
    end;
  end;
  Result := LocAuxiliar;
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

function TamanhoArray(Vetor: array of integer): integer;
begin
  Result := length(Vetor);
end;

function RemoverStringsOld(str: String; var indices: array of integer; qtd: integer): String;
var
  LocContador, LocConAuxiliar: Integer;
  LocAuxiliar: String;
begin
  LocContador := 1;   //percorrer a string
  LocConAuxiliar := 0;  //percorres o array
  while LocContador <= Tamanho(str) do
  begin
    if LocContador = indices[LocConAuxiliar] then
    begin
      LocContador := LocContador + qtd;

      if LocConAuxiliar > 0 then
        indices[LocConAuxiliar]:= indices[LocConAuxiliar] - LocConAuxiliar*qtd;

      LocConAuxiliar := LocConAuxiliar + 1;
    end;

    LocAuxiliar := LocAuxiliar + str[LocContador];
    LocContador := LocContador + 1;
  end;
  Result := LocAuxiliar;
end;

end.
