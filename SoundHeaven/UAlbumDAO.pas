unit UAlbumDAO;

interface

uses System.SysUtils, Data.Win.ADODB, UConexao, UAlbuns, UArtistas,
  UArtistasController;

type
  TAlbumDAO = class
  private
    FConn: TConexaoDB;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Inserir(Album: TAlbum);
    function BuscarPorID(ID: Integer): TAlbum;
    procedure Atualizar(Album: TAlbum);
  end;

implementation

constructor TAlbumDAO.Create;
begin
  FConn := TConexaoDB.Create  // Instanciar a conex�o ADO
end;

destructor TAlbumDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

procedure TAlbumDAO.Inserir(Album: TAlbum);
var
  Query: TADOQuery;
  Artista: TArtista;
  ArtistaController: TArtistasController;
begin
  // instancia��o de objetos para buscar o id do artista
  ArtistaController := TArtistasController.Create;
  Artista := ArtistaController.BuscarArtista(Album.Artista);

  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'INSERT INTO TB_Albuns (Album_Titulo, Album_ArtistaID, ' +
                      'Album_DataLancamento, Album_DataAquisicao) VALUES (:Titulo, ' +
                      ':Artista, :Lancamento, :Aquisicao)';

    Query.Parameters.ParamByName('Titulo').Value := Album.Titulo;
    Query.Parameters.ParamByName('Id').Value := Artista.ID;
    Query.Parameters.ParamByName('Lancamento').Value := Album.DataLancamento;
    Query.Parameters.ParamByName('Aquisicao').Value := Album.DataAquisicao;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

function TAlbumDAO.BuscarPorID(ID: Integer): TAlbum;
var
  Query: TADOQuery;
  Album: TAlbum;
  Artista: TArtista;
  ArtistaController: TArtistasController;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'SELECT * FROM TB_Albuns WHERE Album_ID = :ID';
    Query.Parameters.ParamByName('ID').Value := ID;
    Query.Open;

    if not Query.IsEmpty then
    begin
      // Inst�ncia artista para buscar seu ID
      ArtistaController := TArtistasController.Create;
      Artista := ArtistaController.BuscarArtista(Query.FieldByName('Album_ID').AsInteger);

      Album := TAlbum.Create(Query.FieldByName('Album_Titulo').AsString,
                             Artista.Nome,
                             Query.FieldByName('Album_DataLancamento').AsDateTime,
                             Query.FieldByname('Album_DataAquisicao').AsDateTime,
                             Query.FieldByName('Album_Status').AsInteger);
      Album.ID           := Query.FieldByName('Abum_ID').AsInteger;
      Album.NumeroSerie  := Query.FieldByName('Album_NumSerie').AsString;
      Album.DataInclusao := Query.FieldByName('Album_DataInclusao').AsDateTime;
      Result := Album;
    end;

  finally

  end;
end;

procedure TAlbumDAO.Atualizar(Album: TAlbum);
var
  Query: TADOQuery;
  Artista: TArtista;
  ArtistaController: TArtistasController;
begin
  // Instancia��o de objetos para buscar o id do artista
  ArtistaController := TArtistasController.Create;
  Artista := ArtistaController.BuscarArtista(Album.Artista);

  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'UPDATE TB_Albuns SET Album_Titulo = :Titulo, Album_ArtistaID = :Artista, ' +
                      'Album_DataLancamento = :Lancamento, Album_DataAquisicao = :Aquisicao, ' +
                      'Album_NumeroSerie = :NumeroSerie, Album_Status = :Status';
    Query.Parameters.ParamByName('Titulo').Value := Album.Titulo;
    Query.Parameters.ParamByName('Artista').Value := Artista.ID;
    Query.Parameters.ParamByName('Lancamento').Value := Album.DataLancamento;
    Query.Parameters.ParamByName('Aquisicao').Value := Album.DataAquisicao;
    Query.Parameters.ParamByName('NumeroSerie').Value := Album.NumeroSerie;
    Query.Parameters.ParamByName('Status').Value := Album.Status;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;
end.