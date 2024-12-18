unit UEstiloDAO;

interface

uses UEstilo, UConexao, Data.Win.ADODB, System.SysUtils, System.Generics.Collections;

type
  TEstiloDAO = class
  private
    FConn: TConexaoDB;
  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(const Estilo: TEstilo): Boolean;
    function Atualizar(const Estilo: TEstilo): Boolean;
    function Excluir(const Estilo: TEstilo): Boolean;
    function Localizar(const ID: Integer): TEstilo; overload;
    function Localizar(const Nome: string): TEstilo; overload;
    function ListarEstilos: TList<TEstilo>;
  end;

implementation

constructor TEstiloDAO.Create;
begin
  FConn := TConexaoDB.Create; // Abre conex�o com o banco de dados
end;

destructor TEstiloDAO.Destroy;
begin
  FConn.Free;  // Libera a conex�o com o banco
  inherited;
end;

function TEstiloDAO.Inserir(const Estilo: TEstilo): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  StoredProc := TADOStoredProc.Create(nil);
  try
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;  // Conectar ao banco de dados
        ProcedureName := 'sp_EstiloInserir';  // Nome da stored procedure
        Parameters.Refresh;
        Parameters. ParamByName('@Nome').Value := Estilo.Nome;
        ExecProc;
      end;

      Result := True;  // Se tudo der certo, retorna True
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao incluir estilo: ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TEstiloDAO.Atualizar(const Estilo: TEstilo): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_EstiloAtualizar';
        Parameters.Refresh;

        with Parameters do
        begin
          ParamByName('@Estilo_ID').Value := Estilo.ID;
          ParamByName('@Nome').Value := Estilo.Nome;
        end;

        // Executar a stored procedure
        ExecProc;

        Result := True;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar estilo: ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TEstiloDAO.Excluir(const Estilo: TEstilo): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection :=  FConn.GetConnection;
        ProcedureName := 'sp_EstiloExcluir';
        Parameters.Refresh;
        Parameters.ParamByName('@Estilo_ID').Value := Estilo.ID;
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

function TEstiloDAO.Localizar(const ID: Integer): TEstilo;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_EstiloLocalizarPorID';
        Parameters.Refresh;

        Parameters.ParamByName('@Estilo_ID').Value := ID;
        Open;

        if not IsEmpty then
        begin
          Result := TEstilo.Create(
            FieldByName('Estilo_ID').AsInteger,
            FieldByName('Estilo_Nome').AsString)
        end
        else
          Result := nil;
      end;
    except
      on E: Exception do
        raise Exception.Create('Estilo n�o encontrado');
    end;
  finally
    StoredProc.Free;
  end;
end;

function TEstiloDAO.Localizar(const Nome: string): TEstilo;
var
  StoredProc: TADOStoredProc;
begin
  try
    try
      StoredProc := TADOStoredProc.Create(nil);
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_EstiloLocalizarPorNome';
        Parameters.Refresh;

        Parameters.ParamByName('@Nome').Value := Nome;
        Open;

        if not IsEmpty then
        begin
          Result := TEstilo.Create(
            FieldByName('Estilo_ID').AsInteger,
            FieldByName('Estilo_Nome').AsString);
        end
        else
          Result := nil;
      end;
    except
      on E: Exception do
        raise Exception.Create('Estilo n�o encontrado.');
    end;
  finally
    StoredProc.Free;
  end;
end;

function TEstiloDAO.ListarEstilos: TList<TEstilo>;
var
  StoredProc: TADOStoredProc;
  Estilo: TEstilo;
begin
  Result := TList<TEstilo>.Create;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_EstiloListarAtivos';
      Parameters.Refresh;
      Open;
      First;

      if not IsEmpty then
        while not Eof do
        begin
          Estilo := TEstilo.Create(
            FieldByName('Estilo_ID').AsInteger,
            FieldByName('Estilo_Nome').AsString);
          Result.Add(Estilo);
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
