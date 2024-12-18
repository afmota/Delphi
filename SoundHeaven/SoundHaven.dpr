program SoundHaven;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  ComponentHelper in 'Functions\ComponentHelper.pas',
  Model in 'Model\Model.pas' {frmModel},
  FuncoesDivs in 'Functions\FuncoesDivs.pas',
  Estilos in 'View\Estilos.pas' {frmEstilos},
  UEstilo in 'Model\UEstilo.pas',
  UEstiloController in 'Controller\UEstiloController.pas',
  UEstiloDAO in 'DAO\UEstiloDAO.pas',
  UConexao in 'DAO\UConexao.pas',
  Artistas in 'View\Artistas.pas' {frmArtistas},
  UArtista in 'Model\UArtista.pas',
  UArtistaController in 'Controller\UArtistaController.pas',
  UArtistaDAO in 'DAO\UArtistaDAO.pas',
  Produtores in 'View\Produtores.pas' {frmProdutores},
  UProdutor in 'Model\UProdutor.pas',
  UProdutorController in 'Controller\UProdutorController.pas',
  UProdutorDAO in 'DAO\UProdutorDAO.pas',
  Gravadoras in 'View\Gravadoras.pas' {frmGravadoras},
  UGravadora in 'Model\UGravadora.pas',
  UGravadoraController in 'Controller\UGravadoraController.pas',
  UGravadoraDAO in 'DAO\UGravadoraDAO.pas',
  Albuns in 'View\Albuns.pas' {frmAlbuns},
  UAlbum in 'Model\UAlbum.pas',
  UAlbumController in 'Controller\UAlbumController.pas',
  UAlbumDAO in 'DAO\UAlbumDAO.pas',
  Vcl.Themes,
  Vcl.Styles,
  UStore in 'Model\UStore.pas',
  Store in 'View\Store.pas' {frmStore},
  UStoreController in 'Controller\UStoreController.pas',
  UStoreDAO in 'DAO\UStoreDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
