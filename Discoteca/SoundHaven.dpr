program SoundHaven;

uses
  Vcl.Forms,
  principal in 'principal.pas' {FrmPrincipal},
  FuncoesRede in 'FuncoesRede.pas',
  FuncoesDivs in 'FuncoesDivs.pas',
  Login in 'Login.pas' {FrmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SoundHaven';
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
