unit UArtistasDAO;

interface

uses System.SysUtils, Data.Win.ADODB, UConexao, UArtistas;

type
  TArtistasDAO = class
  private
    FConn: TConexaoDB; // Conexão com o SQL Server
  public
    constructor Create;
    destructor Destroy; override;

    // Métodos CRUD
    procedure Inserir(Artista: TArtista);
    procedure Atualizar(Artista: TArtista);
    procedure AlterarStatus(Artista: TArtista; NovoStatus: Integer);
    function BuscarPorId(ID: Integer): TArtista;
    function ListarAtivos: TADOQuery;
  end;

implementation

{ TArtistasDAO }

constructor TArtistasDAO.Create;
begin
  FConn := TConexaoDB.Create; // Instanciar a conexão ADO
end;

destructor TArtistasDAO.Destroy;
begin
  FConn.Free;  // Liberar a conexão ao destruir
  inherited;
end;

// Método para inserir novo artista no banco
procedure TArtistasDAO.Inserir(Artista: TArtista);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'INSERT INTO TB_Artistas (Artista_Nome, Artista_Status, Data_Inclusao)' +
                      'VALUES (:Artista, :Status, :DataInclusao)';
    Query.Parameters.ParamByName('Artista').Value := Artista.Artista;
    Query.Parameters.ParamByName('Status').Value := Artista.Status;
    Query.Parameters.ParamByName('DataInclusao').Value := Artista.DataInclusão;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

// Método para atualizar artista existente
procedure TArtistasDAO.Atualizar(Artista: TArtista);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'UPDATE TB_Artistas SET Artista = :Artista, Stauts = :Status' +
                      'WHERE ID = :ID';
    Query.Parameters.ParamByName('Artista').Value := Artista.Artista;
    Query.Parameters.ParamByName('Status').Value := Artista.Status;
    Query.Parameters.ParamByName('ID').Value := Artista.ID;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

// Método para alterar status de um artista
procedure TArtistasDAO.AlterarStatus(Artista: TArtista; NovoStatus: Integer);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'UPDATE TB_Artistas SET Status = :Status WHERE ID = :ID';
    Query.Parameters.ParamByName('ID').Value := Artista.ID;
    Query.Parameters.ParamByName('Status').Value := NovoStatus;
    Query.ExecSQL;
  finally
    Query.Free;
  end;

end;

// Método para buscar artista por ID
function TArtistasDAO.BuscarPorId(ID: Integer): TArtista;
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
      Artista.DataInclusão := Query.FieldByName('Data_Inclusao').AsDateTime;
      Result := Artista;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

// Método para listar artistas ativos
function TArtistasDAO.ListarAtivos: TADOQuery;
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
end;

end.
