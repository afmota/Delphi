program SoundHaven;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  ComponentHelper in 'Functions\ComponentHelper.pas',
  UEstilo in 'Model\UEstilo.pas',
  UEstiloController in 'Controller\UEstiloController.pas',
  UEstiloDAO in 'DAO\UEstiloDAO.pas',
  UConexao in 'DAO\UConexao.pas',
  Model in 'Model\Model.pas' {frmModel},
  Estilos in 'View\Estilos.pas' {frmEstilos},
  Artistas in 'View\Artistas.pas' {frmArtistas},
  FuncoesDivs in 'Functions\FuncoesDivs.pas',
  UArtista in 'Model\UArtista.pas',
  UArtistaController in 'Controller\UArtistaController.pas',
  UArtistaDAO in 'DAO\UArtistaDAO.pas',
  Gravadoras in 'View\Gravadoras.pas' {frmGravadoras},
  UGravadora in 'Model\UGravadora.pas',
  UGravadoraController in 'Controller\UGravadoraController.pas',
  UGravadoraDAO in 'DAO\UGravadoraDAO.pas',
  UProdutor in 'Model\UProdutor.pas',
  UProdutorController in 'Controller\UProdutorController.pas',
  UProdutorDAO in 'DAO\UProdutorDAO.pas',
  Produtores in 'View\Produtores.pas' {frmProdutor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmGravadoras, frmGravadoras);
  Application.CreateForm(TfrmProdutor, frmProdutor);
  Application.Run;
end.
