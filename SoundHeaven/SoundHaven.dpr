program SoundHaven;

uses
  Vcl.Forms,
  Artistas in 'Artistas.pas' {frmArtistas},
  UArtistas in 'UArtistas.pas',
  UArtistasDAO in 'UArtistasDAO.pas',
  UArtistasController in 'UArtistasController.pas',
  UConexao in 'UConexao.pas',
  Principal in 'Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
