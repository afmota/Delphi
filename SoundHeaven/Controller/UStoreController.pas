unit UStoreController;

interface

uses UStore, SysUtils, UStoreDAO, System.Generics.Collections;

type
  TStoreController = class
  private
    FDAO: TStoreDAO;
  public
    constructor Create;
    destructor Destroy; override;
    function ExcluirEntradaStore(const StoreID: Integer): Boolean;
    function InserirEntradaStore(const Store: TStore): Boolean;
    function AtualizarEntradaStore(const Store: TStore): Boolean;
    function LocalizarEntradaStorePorId(const StoreID: Integer): TStore;
    function LocalizarEntradaStorePorNome(const Nome: string): TStore;
    function StoreListarEntradas: TList<TStore>;
  end;

implementation

{ TStoreController }

constructor TStoreController.Create;
begin
  FDAO := TStoreDAO.Create;
end;

destructor TStoreController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TStoreController.ExcluirEntradaStore(const StoreID: Integer): Boolean;
begin
  Result := FDAO.ExcluirEntrada(StoreID);
end;

function TStoreController.InserirEntradaStore(const Store: TStore): Boolean;
begin
  Result := False;

  if Store.Titulo <> '' then
    if Store.Artista <> '' then
      Result := FDAO.InserirEntrada(Store)
    else
      raise Exception.Create('O campo ARTISTA deve ser preenchido.')
  else
    raise Exception.Create('O campo T�TULO deve ser preenchido');
end;

function TStoreController.AtualizarEntradaStore(const Store: TStore): Boolean;
begin
  Result := False;
  if Store.Titulo <> '' then
    if Store.Artista <> '' then
      Result := FDAO.AtualizarEntrada(Store)
    else
      raise Exception.Create('O campo ARTISTA deve ser preenchido.')
  else
    raise Exception.Create('O campo T�tulo deve ser preenchido.');
end;

function TStoreController.LocalizarEntradaStorePorId(
  const StoreID: Integer): TStore;
begin
  Result := FDAO.LocalizarEntrada(StoreID);
end;

function TStoreController.LocalizarEntradaStorePorNome(
  const Nome: string): TStore;
begin
  Result := FDAO.LocalizarEntrada(Nome);
end;

function TStoreController.StoreListarEntradas: TList<TStore>;
begin
  Result := FDAO.ListarStore;
end;

end.
