unit uSubstitui;

interface

uses
  uISubstitui, System.SysUtils;

type
   ClassSubstituirString = class (TInterfacedObject, ISubstitui)
     function Substituir(Str, Velho, Novo: String): String;
   End;

implementation


{ ClassSubstituirString }

uses untFuncoes;

function ClassSubstituirString.Substituir(Str, Velho, Novo: String): String;
var
  LocStringAux: string;
  LocTamanhoVelho, LocTamanhoNovo, LocTamanhoStr: Integer;
  LocContador, LocOld, LocContPosicoes: Integer;
  LocArrayPosicoes: array of integer;
  LocC: char;
begin
  LocC := Velho[1];
  LocStringAux := '';
  LocOld := 1;
  LocTamanhoVelho := Length(Velho);
  LocTamanhoNovo  := Length(Novo);
  LocTamanhoStr   := Length(Str);

  if (LocTamanhoVelho=0) or (LocTamanhoNovo=0) or (LocTamanhoStr=0) then
    Exit;

  LocContPosicoes := 0;
  //Procurara ocorrencias da string velha na Str principal
  for LocContador:=1 to Tamanho(str) do     //Testada
  begin
    if Uppercase(Str[LocContador]) = Uppercase(LocC) then
    begin
      if Copiar(Str,LocContador,LocTamanhoVelho) = Velho then
      begin
        SetLength(LocArrayPosicoes, LocContPosicoes+1);
        LocArrayPosicoes[LocContPosicoes] := LocContador;
        LocContPosicoes := LocContPosicoes + 1;
      end;
    end;
  end;


  //Remover as ocorrencias da string velha na Str principal
  LocStringAux := RemoverStringsOld(Str, LocArrayPosicoes, LocTamanhoVelho);   //Testada


  //Adicionar as ocorrencias da string nova
  LocStringAux := AdicionarStringNew(LocStringAux,LocArrayPosicoes,LocTamanhoNovo, Novo);

  result := LocStringAux;
end;

end.

