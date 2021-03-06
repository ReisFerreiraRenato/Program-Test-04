unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edValor: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uMaquina, uTroco;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
const
      nota: array[1..12] of String = ('100', '50', '20', '10', '5', '2', '1','0.50', '0.25', '0.10', '0.05', '0.01');
var
  Troco: TMaquina;
  Lista : TList;
  Item: TTroco;
  Int: Integer;
begin
  Lista := TList.Create;
  Item := TTroco.Create(ceNota100, 0);
  Lista := Troco.MontarTroco(StrToFloat(edValor.Text));
  {
  if Troco.MontarTroco(StrToFloat(edValor.Text)) <> nil then
  begin
    ShowMessage('Processado com sucesso');
  end;
  }
  Memo1.Lines.Add('CEDULAS/NOTAS - QTD');
  for Int := 0 to Lista.Count-1 do
  begin
    Item := Lista[Int];
    Memo1.Lines.Add(nota[Int+1]+' - QTD: '+IntToStr(Item.GetQuantidade));
  end;



  Lista.Free;
  Lista:=nil;
end;

end.
