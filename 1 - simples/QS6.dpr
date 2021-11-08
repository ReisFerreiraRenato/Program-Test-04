program QS6;

uses
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas',
  uFuncoes in 'uFuncoes.pas',
  untPrincipal in 'untPrincipal.pas' {frmPrincipal};

{$R *.RES}

begin
  frmPrincipal:= TfrmPrincipal.Create(nil);
  frmPrincipal.ShowModal;

  frmPrincipal.Free;
end.

