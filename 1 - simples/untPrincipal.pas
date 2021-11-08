unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edStr: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edOdl: TEdit;
    Label3: TLabel;
    edtNew: TEdit;
    Button1: TButton;
    edResultado: TEdit;
    Label4: TLabel;
    btLimpar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uSubstitui;

procedure TfrmPrincipal.btLimparClick(Sender: TObject);
begin
  edStr.Clear;
  edOdl.Clear;
  edtNew.Clear;
  edResultado.Clear;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  LocSubst: ClassSubstituirString;
begin
  edResultado.Text := LocSubst.Substituir(edStr.Text, edOdl.Text, edtNew.Text);
end;

end.
