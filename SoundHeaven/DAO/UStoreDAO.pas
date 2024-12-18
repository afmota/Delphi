unit UStoreDAO;

interface

uses UConexao, UStore, Data.Win.ADODB, System.Generics.Collections, SysUtils;

type
  TStoreDAO = class
  private
    FConn: TConexaoDB;
  public
    constructor Create;
    destructor Destroy; override;
    function InserirEntrada(Store: TStore): Boolean;
    function AtualizarEntrada(Store: TStore): Boolean;
    function LocalizarEntrada(StoreID: Integer): TStore; overload;
    function LocalizarEntrada(Nome: string): TStore; overload;
    function ExcluirEntrada(ID: Integer): Boolean;
    function ListarStore: TList<TStore>;
  end;

implementation

{ TStoreDAO }

constructor TStoreDAO.Create;
begin
  FConn := TConexaoDB.Create;
end;

destructor TStoreDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TStoreDAO.InserirEntrada(Store: TStore): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  Result := False;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_StoreInserirEntrada';

      with Parameters do
      begin
        Refresh;
        ParamByName('@Store_Titulo').Value := Store.Titulo;
        ParamByName('@Store_Artista').Value := Store.Artista;
        ParamByName('@Store_DataLancamento').Value := Store.DataLancamento;
      end;
      ExecProc;
      Result := True;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TStoreDAO.AtualizarEntrada(Store: TStore): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  Result := False;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_StoreAtualizarEntrada';

      with Parameters do
      begin
        ParamByName('@Store_ID').Value := Store.ID;
        ParamByName('@Store_Titulo').Value := Store.Titulo;
        ParamByName('@Store_Artista').Value := Store.Artista;
      end;
      ExecProc;
      Result := True;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TStoreDAO.LocalizarEntrada(StoreID: Integer): TStore;
var
  StoredProc: TADOStoredProc;
begin
  Result := nil;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_StoreLocalizarPorID';

      with Parameters do
      begin
        Refresh;
        ParamByName('@Store_ID').Value := StoreID;
      end;
      Open;
      if not IsEmpty then
        Result := TStore.Create(
          FieldByName('Store_Titulo').AsString,
          FieldByName('Store_Artista').AsString,
          FieldByName('Store_DataLancamento').AsDateTime);
    end;
  finally
    StoredProc.Free;
  end;
end;

function TStoreDAO.LocalizarEntrada(Nome: string): TStore;
var
  StoredProc: TADOStoredProc;
begin
  Result := nil;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_StoreLocalizarPorNome';

      with Parameters do
      begin
        Refresh;
        ParamByName('@Store_Titulo').Value := Nome;
      end;
      Open;
      if not IsEmpty then
        Result := TStore.Create(
          FieldByName('Store_ID').AsInteger,
          FieldByName('Store_Titulo').AsString,
          FieldByName('Store_Artista').AsString,
          FieldByName('Store_DataLancamento').AsDateTime);
    end;
  finally
    StoredProc.Free;
  end;
end;

function TStoreDAO.ExcluirEntrada(ID: Integer): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  Result := False;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_StoreExcluirEntrada';

      with Parameters do
      begin
        Refresh;
        ParamByName('@Store_ID').Value := ID;
      end;
      ExecProc;
      Result := True;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TStoreDAO.ListarStore: TList<TStore>;
var
  StoredProc: TADOStoredProc;
  Store: TStore;
begin
  try
    Result := TList<TStore>.Create;;
    StoredProc := TADOStoredProc.Create(nil);

    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_StoreListarAtivos';
        Open;

        while not Eof do
        begin
          Store := TStore.Create(
            FieldByName('Store_ID').AsInteger,
            FieldByName('Store_Titulo').AsString,
            FieldByName('Store_Artista').AsString,
            FieldByName('Store_DataLancamento').AsDateTime);
          Result.Add(Store);
          Next;
        end;
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('N�o foram encontrados registros :' + E.Message);
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

end.
