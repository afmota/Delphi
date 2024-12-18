unit UProdutorController;

interface

uses UProdutorDAO, UPRodutor, Dialogs, System.SysUtils, System.Generics.Collections;

type
  TProdutorController = class
  private
    FDAO: TProdutorDAO;
  public
    constructor Create;
    destructor Destroy; override;
    function ExcluirProdutor(const Produtor: TProdutor): Boolean;
    function InserirProdutor(const Produtor: TProdutor): Boolean;
    function AtualizarProdutor(const Produtor: TProdutor): Boolean;
    function LocalizarProdutor(const ID: Integer): TProdutor; overload;
    function LocalizarProdutor(const Nome: string): TProdutor; overload;
    function ListarProdutores: TList<TProdutor>;
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

function TProdutorController.ExcluirProdutor(const Produtor: TProdutor): Boolean;
begin
  Result := FDAO.Excluir(Produtor);
end;

function TProdutorController.InserirProdutor(const Produtor: TProdutor): Boolean;
begin
  if Produtor.Nome = '' then
    raise Exception.Create('O campo NOME deve ser preenchido.')
  else
    Result := FDAO.Inserir(Produtor);
end;

function TProdutorController.AtualizarProdutor(
  const Produtor: TProdutor): Boolean;
begin
  if Produtor.Nome = '' then
    raise Exception.Create('O campo NOME deve ser preenchido.')
  else
    Result := FDAO.Atualizar(Produtor);
end;

function TProdutorController.LocalizarProdutor(const ID: Integer): TProdutor;
begin
  Result := FDAO.Localizar(ID);
end;

function TProdutorController.LocalizarProdutor(const Nome: string): TProdutor;
begin
  Result := FDAO.Localizar(Nome);
end;

function TProdutorController.ListarProdutores: TList<TProdutor>;
begin
  Result := FDAO.ListarProdutores;
end;

end.
