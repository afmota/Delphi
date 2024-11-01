unit UGravadoraDAO;

interface

uses UConexao, UGravadora, Data.Win.ADODB, System.SysUtils, System.Generics.Collections;

type
  TGravadoraDAO = class
  private
    FConn: TConexaoDB; // Conex�o com o SQL Server
  public
    constructor Create;
    destructor Destroy;
    function Inserir(const Gravadora: TGravadora): Boolean;
    function Atualizar(const Gravadora: TGravadora): Boolean;
    function Localizar(const ID: Integer): TGravadora; overload;
    function Localizar(const Nome: string): TGravadora; overload;
    function ListarGravadoras: TList<TGravadora>;
  end;

implementation

constructor TGravadoraDAO.Create;
begin
  FConn := TConexaoDB.Create; //Instancia a conex�o ADO
end;

destructor TGravadoraDAO.Destroy;
begin
  FConn.Free; // Liberar a conex�o ao destruir
  inherited;
end;

function TGravadoraDAO.Inserir(const Gravadora: TGravadora): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    try
      StoredProc := TADOStoredProc.Create(nil);

      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_InserirGravadora';
        Parameters.Refresh;

        with Parameters do
        begin
          ParamByName('@Nome').Value := Gravadora.Nome;
          ParamByName('@Ativo').Value := Gravadora.Ativo;
          ParamByName('@DataInclusao').Value := Gravadora.DataInclusao;
        end;
        ExecProc;
      end;

      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao incluir Gravadora: ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.Atualizar(const Gravadora: TGravadora): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    try
      StoredProc := TADOStoredProc.Create(nil);

      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_AtualizarGravadora';

        with Parameters do
        begin
          ParamByName('@Gravadora_ID').Value := Gravadora.ID;
          ParamByName('@Nome').Value := Gravadora.Nome;
          ParamByName('@Ativo').Value := Gravadora.Ativo;
          ParamByName('@DataAlteracao').Value := Gravadora.DataAlteracao;
        end;

        ExecProc;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar Gravadora: ' + E.message);
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.Localizar(const ID: Integer): TGravadora;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ObterGravadoraAtivoPorID';
        Parameters.Refresh;

        Parameters.ParamByName('@Gravadora_ID').Value := ID;
        Open;
        First;

        if not IsEmpty then
          Result := TGravadora.Create(
            FieldByName('Gravadora_ID').AsInteger,
            FieldByName('Gravadora_Nome').AsString,
            FieldByName('Gravatora_Ativo').AsString[1],
            FieldByName('Data_Inclusao').AsDateTime,
            FieldByName('Data_Alteracao').AsDateTime)
        else
          Result := nil;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Gravadora n�o encontrada.');
        Result := nil;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.Localizar(const Nome: string): TGravadora;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);

    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ObterGravadoraAtivaPorNome';
        Parameters.Refresh;
        Open;
        First;

        if not IsEmpty then
          Result := TGravadora.Create(
            FieldByName('Gravadora_ID').AsInteger,
            FieldByName('Gravadora Nome').AsString,
            FieldByName('Gravadora_Ativo').AsString[1],
            FieldByName('Data_Inclusao').AsDateTime,
            FieldByName('Data_Alteracao').AsDateTime)
        else
          Result := nil;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Gravadora n�o encontrada.');
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.ListarGravadoras: TList<TGravadora>;
var
  StoredProc: TADOStoredProc;
  Gravadora: TGravadora;
begin
  Result := TList<TGravadora>.Create;

  StoredProc := TADOStoredProc.Create(nil);
  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_ListarGravadorasAtivas';
      Parameters.Refresh;
      Open;
      First;

      if not IsEmpty then
        while not Eof do
        begin
          Gravadora.Create(
            FieldByName('Gravadora_ID').AsInteger,
            FieldByName('Gravadora_Nome').AsString,
            FieldByName('Gravadora_Ativo').AsString[1],
            FieldByName('Data_Inclusao').AsDateTime,
            FieldByName('Data_Alteracao').AsDateTime);

          Result.Add(Gravadora);
          Next;
        end
      else
        Result := nil;
    end;
  finally
    Gravadora.Free;
    StoredProc.Free;
  end;
end;

end.
