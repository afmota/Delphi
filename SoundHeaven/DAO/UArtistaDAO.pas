unit UArtistaDAO;

interface

uses System.SysUtils, Data.Win.ADODB, UConexao, UArtista;

type
  TArtistaDAO = class
  private
    FConn: TConexaoDB; // Conex�o com o SQL Server
  public
    constructor Create;
    destructor Destroy; override;

    // M�todos CRUD
    function Inserir(Artista: TArtista): Boolean;
    function Atualizar(Artista: TArtista): Boolean;
    {function BuscarPorId(ID: Integer): TArtista;
    function BuscarPorNome(ArtistaNome: string): TArtista;
    function ListarAtivos: TADOQuery;}
  end;

implementation

{ TArtistasDAO }

constructor TArtistaDAO.Create;
begin
  FConn := TConexaoDB.Create; // Instanciar a conex�o ADO
end;

destructor TArtistaDAO.Destroy;
begin
  FConn.Free;  // Liberar a conex�o ao destruir
  inherited;
end;

// M�todo para inserir novo artista no banco
function TArtistaDAO.Inserir(Artista: TArtista): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  StoredProc := TADOStoredProc.Create(nil);
  try
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_InserirArtista';
        Parameters.Refresh;

        Parameters.ParamByName('@Nome').Value := Artista.Nome;
        Parameters.ParamByName('@Estilo').Value := Artista.Estilo;
        Parameters.ParamByName('@Ativo').value := Artista.Ativo;
        Parameters.ParamByName('@DataInclusao').Value := Artista.DataInclusao;
        ExecProc;
      end;

      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao incluir Artista: ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

// M�todo para atualizar artista existente
function TArtistaDAO.Atualizar(Artista: TArtista): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  StoredProc := TADOStoredProc.Create(nil);
  try
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_AtualizarArtista';
        Parameters.Refresh;

        Parameters.ParamByName('@ID').Value := Artista.ID;
        Parameters.ParamByName('@Nome').Value := Artista.Nome;
        Parameters.ParamByName('@Estilo').Value := Artista.Estilo;
        Parameters.ParamByName('@Ativo').Value := Artista.Ativo;
        Parameters.ParamByName('@DataAlteracao').Value := Artista.DataAlteracao;
        ExecProc;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar Artista');
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

// M�todo para buscar artista por ID
{function TArtistaDAO.BuscarPorId(ID: Integer): TArtista;
var
  Query: TADOQuery;
  Artista: TArtista;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'SELECT * FROM TB_Artistas WHERE Artista_ID = :ID';
    Query.Parameters.ParamByName('ID').Value := ID;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Artista := TArtista.Create(Query.FieldByName('Artista_Nome').AsString,
                                 Query.FieldByName('Artista_Status').AsInteger);
      Artista.ID := Query.FieldByName('Artista_ID').AsInteger;
      Artista.DataInclus�o := Query.FieldByName('Data_Inclusao').AsDateTime;
      Result := Artista;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TArtistaDAO.BuscarPorNome(ArtistaNome: string): TArtista;
var
  Query: TADOQuery;
  Artista: TArtista;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'SELECT * FROM TB_Artistas WHERE Artista_Nome = :Artista';
    Query.Parameters.ParamByName('Artista').Value := ArtistaNome;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Artista := TArtista.Create(Query.FieldByName('Artista_Nome').AsString,
                                 Query.FieldByName('Artista_Status').AsInteger);
      Artista.ID := Query.FieldByName('Artista_ID').AsInteger;
      Artista.DataInclus�o := Query.FieldByName('Data_Inclusao').AsDateTime;
      Result := Artista;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

// M�todo para listar artistas ativos
function TArtistaDAO.ListarAtivos: TADOQuery;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'SELECT * FROM TB_Artistas WHERE Status = 1';
    Query.Open;
    Result := Query;
  except
    Query.Free;
    raise;
  end;
end;}

end.