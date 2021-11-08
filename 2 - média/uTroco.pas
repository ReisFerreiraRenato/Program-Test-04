unit uTroco;

interface

type

  TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2, ceMoeda100,
    ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1);

  TTroco = class
  private
    FTipo: TCedula;
    FQuantidade: Integer;
  public
    constructor Create(Tipo: TCedula; Quantidade: Integer); reintroduce;
    function GetTipo: TCedula;
    function GetQuantidade: Integer;
    procedure SetQuantidade(Quantidade: Integer);
  end;

implementation

  constructor TTroco.Create(Tipo: TCedula; Quantidade: Integer);
  begin
    inherited Create;
    FTipo := Tipo;
    FQuantidade := Quantidade;
  end;
  
  function TTroco.GetTipo: TCedula;
  begin
    Result := FTipo;
  end;

  function TTroco.GetQuantidade: Integer;
  begin
    Result := FQuantidade;
  end;
  
  procedure TTroco.SetQuantidade(Quantidade: Integer);
  begin
    FQuantidade := Quantidade;
  end;
end.

