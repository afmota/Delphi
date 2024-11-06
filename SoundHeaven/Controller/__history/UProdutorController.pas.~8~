unit UProdutorController;

interface

uses UProdutorDAO, UPRodutor, Dialogs;

type
  TProdutorController = class
  private
    FDAO: TProdutorDAO;
  public
    constructor Create;
    destructor Destroy; override;
    function ExcluirProdutor(Produtor: TProdutor): Boolean;
  end;

implementation

{ TProdutorController }

constructor TProdutorController.Create;
begin
  FDAO := TProdutorDAO.Create;
end;

destructor TProdutorController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TProdutorController.ExcluirProdutor(Produtor: TProdutor): Boolean;
begin
  if AtualizarProdutor(Produtor) then
    MessageDlg('Registro excluído com sucesso', mtInformation, [mbOk], 0);
end;

end.
