program SoundHaven;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  Model in 'Model.pas' {frmModel},
  Artistas in 'View\Artistas.pas' {frmArtistas},
  ComponentHelper in 'Functions\ComponentHelper.pas',
  FuncoesDivs in 'Functions\FuncoesDivs.pas',
  UArtistaController in 'Controller\UArtistaController.pas',
  UArtistas in 'Model\UArtistas.pas',
  UArtistaDAO in 'DAO\UArtistaDAO.pas',
  Albuns in 'View\Albuns.pas' {frmAlbuns},
  UAlbuns in 'Model\UAlbuns.pas',
  Gravadoras in 'View\Gravadoras.pas' {frmGravadoras},
  UGravadoraController in 'Controller\UGravadoraController.pas',
  UGravadoraDAO in 'DAO\UGravadoraDAO.pas',
  UGravadora in 'Model\UGravadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAlbuns, frmAlbuns);
  Application.CreateForm(TfrmGravadoras, frmGravadoras);
  Application.Run;
end.
