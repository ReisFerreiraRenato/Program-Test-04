unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, untClasses;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edElemento: TEdit;
    Label1: TLabel;
    Button1: TButton;
    MemoElementos: TMemo;
    btDeleteElementos: TBitBtn;
    MemoConexoes: TMemo;
    edAdicionarElemento1: TEdit;
    edAdicionarElemento2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edProcurarElemento1: TEdit;
    edProcurarElemento2: TEdit;
    Label7: TLabel;
    btVerificarConexao: TBitBtn;
    MemoConsultaConexoes: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btDeleteElementosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btVerificarConexaoClick(Sender: TObject);
    procedure edProcurarElemento1Exit(Sender: TObject);
  private
    { Private declarations }
    pvtNetwork: TNetwork;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untClassConexao;


procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var
  LocConexao: TConexoes;
  LocCont: Integer;
  LocString: String;
  LocConexoes: array of TConexoes;
begin
  if edAdicionarElemento1.Text = edAdicionarElemento2.Text then
  begin
    ShowMessage('Os elementos n?o podem ser iguais');
    edAdicionarElemento1.SetFocus;
    Exit;
  end;

  LocConexao := TConexoes.Create(0,0);
  LocString := '';
  if edAdicionarElemento1.Text = '' then
  begin
    ShowMessage('Favor Digigitar o 1? Elemento');
    edAdicionarElemento1.SetFocus;
    Exit;
  end;

  if edAdicionarElemento2.Text = '' then
  begin
    ShowMessage('Favor Digigitar o 2? Elemento');
    edAdicionarElemento2.SetFocus;
    Exit;
  end;

  if pvtNetwork.QtdElementos = 0 then
  begin
    ShowMessage('Lista Vazia');
    edAdicionarElemento1.SetFocus;
    Exit;
  end;

  if not pvtNetwork.Conectar(StrToInt(edAdicionarElemento1.Text),StrToInt(edAdicionarElemento2.Text), LocConexao) then
    raise Exception.Create('O(s) elemento(s) n?o est?o na lista!');

  pvtNetwork.AdicionarConexao(LocConexao);

  for LocCont := 0 to pvtNetwork.CountNetWorks-1 do
  begin
    LocConexao := pvtNetwork.Conexoes[LocCont];
    LocString := LocString + '('+IntToStr(LocConexao.GetElemento1)+' - '+IntToStr(LocConexao.GetElemento2)+') ';
  end;

  MemoConexoes.Lines.Clear;
  MemoConexoes.Lines.Add(LocString);
  edAdicionarElemento1.SetFocus;

end;

procedure TfrmPrincipal.btVerificarConexaoClick(Sender: TObject);
begin
  MemoConsultaConexoes.Lines.Clear;
  if edProcurarElemento1.Text = edProcurarElemento2.Text then
  begin
    ShowMessage('Os elementos n?o podem ser iguais');
    edProcurarElemento1.SetFocus;
    Exit;
  end;
  if pvtNetwork.Consulta(StrToInt(edProcurarElemento1.Text),StrToInt(edProcurarElemento2.Text)) then
    MemoConsultaConexoes.Lines.Add('Existe conex?o!!!')
  else
    MemoConsultaConexoes.Lines.Add('N?o existe conex?o!!!');
  edProcurarElemento1.SetFocus;
end;

procedure TfrmPrincipal.btDeleteElementosClick(Sender: TObject);
begin
  pvtNetwork.Clear;
  MemoElementos.Lines.Clear;
  MemoConexoes.Lines.Clear;
  MemoConsultaConexoes.Lines.Clear;
  edElemento.Clear;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var LocString: String;
    LocCont: Integer;
begin

  if edElemento.Text <> '' then
  begin
    pvtNetwork.InsertElemento(StrToInt(edElemento.Text));
    for LocCont := 0 to pvtNetwork.QtdElementos-1 do
    begin
      if (LocCont <> pvtNetwork.QtdElementos-1) then
        LocString := LocString + inttostr(pvtNetwork.Elemento[LocCont]) + ' - '
      else
        LocString := LocString + inttostr(pvtNetwork.Elemento[LocCont]) ;
    end;
    MemoElementos.Lines.Clear;
    MemoElementos.Lines.Add(LocString);
  end
  else
  begin
    ShowMessage('Favor digitar o valor do elemento!');
  end;
  edElemento.SetFocus;
end;

procedure TfrmPrincipal.edProcurarElemento1Exit(Sender: TObject);
begin
  if edProcurarElemento1.Text <> '' then
    MemoConsultaConexoes.Lines.Clear;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  pvtNetwork := TNetWork.Create(0);
end;

end.
