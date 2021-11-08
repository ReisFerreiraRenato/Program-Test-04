program QS7;

uses
  uTroco in 'uTroco.pas',
  uIMaquina in 'uIMaquina.pas',
  uMaquina in 'uMaquina.pas' {$R *.RES},
  untFuncoes in 'untFuncoes.pas',
  untPrincipal in 'untPrincipal.pas' {frmPrincipal};

{$R *.RES}

begin

  frmPrincipal:= TfrmPrincipal.Create(nil);
  frmPrincipal.showModal;

  frmPrincipal.Free;
end.

