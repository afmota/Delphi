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
        ProcedureName := 'sp_InserirEstilo';  // Nome da stored procedure
        Parameters.Refresh;

        // Definir os par�metros da stored procedure
        with Parameters do
        begin
          ParamByName('@Nome').Value := Estilo.Nome;
          ParamByName('@Ativo').Value := Estilo.Ativo;
          ParamByName('@DataInclusao').Value := Estilo.DataInclusao;
        end;

        // Executar a stored procedure
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
    try
      StoredProc := TADOStoredProc.Create(nil);

      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_AtualizarEstilo';
        Parameters.Refresh;

        with Parameters do
        begin
          ParamByName('@Estilo_ID').Value := Estilo.ID;
          ParamByName('@Nome').Value := Estilo.Nome;
          ParamByName('@Ativo').Value := Estilo.Ativo;
          ParamByName('@DataAlteracao').Value := Estilo.DataAlteracao;
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
        ProcedureName := 'sp_ObterEstiloAtivoPorID';
        Parameters.Refresh;

        Parameters.ParamByName('@Estilo_ID').Value := ID;
        Open;

        if not IsEmpty then
        begin
          Result := TEstilo.Create(
            FieldByName('Estilo_Nome').AsString,
            FieldByName('Estilo_Ativo').AsString[1],
            FieldByName('Data_Inclusao').AsDateTime,
            FieldByName('Data_Alteracao').AsDateTime);
          Result.ID := FieldByName('Estilo_ID').AsInteger;
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
        ProcedureName := 'sp_ObterEstiloAtivoPorNome';
        Parameters.Refresh;

        Parameters.ParamByName('@Nome').Value := Nome;
        Open;

        if not IsEmpty then
        begin
          Result := TEstilo.Create(
            FieldByName('Estilo_Nome').AsString,
            FieldByName('Estilo_Ativo').AsString[1],
            FieldByName('Data_Inclusao').AsDateTime,
            FieldByName('Data_Alteracao').AsDateTime);
          Result.ID := FieldByName('Estilo_ID').AsInteger;
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
      ProcedureName := 'sp_ListarEstilosAtivos';
      Open;
      First;

      if not IsEmpty then
        while not Eof do
        begin
          Estilo := TEstilo.Create(FieldByName('Estilo_Nome').AsString,
                                   FieldByName('Estilo_Ativo').AsString[1],
                                   FieldByName('Data_Inclusao').AsDateTime,
                                   FieldByName('Data_Alteracao').AsDateTime);
          Estilo.ID := FieldByName('Estilo_ID').AsInteger;
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
