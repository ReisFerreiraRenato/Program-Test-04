program TesteDificil;





uses
  uINetwork in 'uINetwork.pas',
  untClasses in 'untClasses.pas',
  untFuncoes in 'untFuncoes.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  untClassConexao in 'untClassConexao.pas';

begin
  frmPrincipal:= TfrmPrincipal.Create(nil);
  frmPrincipal.ShowModal;

  frmPrincipal := nil;
  frmPrincipal.Free;
end.

