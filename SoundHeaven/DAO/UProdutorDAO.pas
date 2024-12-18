unit UProdutorDAO;

interface

uses UCOnexao, UProdutor, Data.Win.ADODB, System.SysUtils, System.Generics.Collections;

type
  TProdutorDAO = class
  private
    FConn: TConexaoDB;
  public
    constructor Create;
    destructor Destroy; override;
    function Excluir(const Produtor: TProdutor): Boolean;
    function Inserir(const Produtor: TProdutor): Boolean;
    function Atualizar(const Produtor: TProdutor): Boolean;
    function Localizar(const ID: Integer): TProdutor; overload;
    function Localizar(const Nome: string): TProdutor; overload;
    function ListarProdutores: TList<TProdutor>;
  end;

implementation

{ TProdutorDAO }

constructor TProdutorDAO.Create;
begin
  FConn := TConexaoDB.Create;
end;

destructor TProdutorDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TProdutorDAO.Excluir(const Produtor: TProdutor): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ProdutorExcluir';
        Parameters.Refresh;
        Parameters.ParamByName('@Produtor_ID').Value := Produtor.ID;
        ExecProc;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao excluir registro: ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TProdutorDAO.Inserir(const Produtor: TProdutor): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ProdutorInserir';
        Parameters.Refresh;
        Parameters.ParamByName('@Produtor_Nome').Value := Produtor.Nome;
        ExecProc;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao inserir registro ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TProdutorDAO.Atualizar(const Produtor: TProdutor): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ProdutorAtualizar';
        with Parameters do
        begin
          Refresh;
          ParamByName('@Produtor_ID').Value := Produtor.ID;
          ParamByName('@Produtor_Nome').Value := Produtor.Nome;
        end;
        ExecProc;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar registro ' + E.Message);
        Result := False;
      end;
    end;
  finally

  end;
end;

function TProdutorDAO.Localizar(const ID: Integer): TProdutor;
var
  StoredProc: TADOStoredProc;
begin
  try
    try
      StoredProc := TADOStoredProc.Create(nil);
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ProdutorLocalizarPorId';
        Parameters.Refresh;
        Parameters.ParamByName('@Produtor_ID').Value := ID;
        Open;

        if not IsEmpty then
          Result := TProdutor.Create(
            FieldByName('Produtor_ID').AsInteger,
            FieldByName('Produtor_Nome').AsString)
        else
          Result := nil;
      end;
    except
      on E: Exception do
        raise Exception.Create('Produtor n�o encontrado.');
    end;
  finally
    StoredProc.Free;
  end;
end;

function TProdutorDAO.Localizar(const Nome: string): TProdutor;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ProdutorLocalizarPorNome';
        Parameters.Refresh;
        Parameters.ParamByName('@Produtor_Nome').Value := Nome;
        Open;

        if not IsEmpty then
          Result := TProdutor.Create(
            FieldByName('Produtor_ID').AsInteger,
            FieldByName('Produtor_Nome').AsString)
        else
          Result := nil;
      end;
    except
      on E: Exception do
        raise Exception.Create('Produtos n�o encontrado.');
    end;
  finally
    StoredProc.Free;
  end;
end;

function TProdutorDAO.ListarProdutores: TList<TProdutor>;
var
  StoredProc: TADOStoredProc;
  Produtor: TProdutor;
begin
  Result := TList<TProdutor>.Create;
  StoredProc := TADOStoredProc.Create(nil);
  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_ProdutorListarAtivos';
      Parameters.Refresh;
      Open;
      First;

      if not IsEmpty then
        while not Eof do
        begin
          Produtor := TProdutor.Create(
            FieldByName('Produtor_ID').AsInteger,
            FieldByName('Produtor_Nome').AsString);

          Result.Add(Produtor);
          Next;
        end
      else
        Result := nil;
    end;
  finally
    StoredProc.Free;
  end;
end;

end.
