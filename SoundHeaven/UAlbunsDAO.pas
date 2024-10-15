unit UAlbunsDAO;

interface

uses System.SysUtils, Data.Win.ADODB, UConexao, UAlbuns, UArtistas,
  UArtistasController;

type
  TAlbunsDAO = class
  private
    FConn: TConexaoDB;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Inserir(Album: TAlbum);
    function BuscarPorID(ID: Integer): TAlbum;
  end;

implementation

constructor TAlbunsDAO.Create;
begin
  FConn := TConexaoDB.Create  // Instanciar a conex�o ADO
end;

destructor TAlbunsDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

procedure TAlbunsDAO.Inserir(Album: TAlbum);
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
                      ':ArtistaID, :DataLancamento, :DataAquisicao)';

    Query.Parameters.ParamByName('Titulo').Value := Album.Titulo;
    Query.Parameters.ParamByName('ArtistaId').Value := Artista.ID;
    Query.Parameters.ParamByName('DataLancamento').Value := Album.DataLancamento;
    Query.Parameters.ParamByName('DataAquisicao').Value := Album.DataAquisicao;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

function TAlbunsDAO.BuscarPorID(ID: Integer): TAlbum;
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
      Artista := ArtistaController.BuscarArtista(Query.FieldByName('Album_ArtistaID').AsInteger);

      Album := TAlbum.Create(Query.FieldByName('Album_Titulo').AsString,
                             Artista.Nome,
                             Query.FieldByName('Album_DataLancamento').AsDateTime,
                             Query.FieldByname('Album_DataAquisicao').AsDateTime,
                             Query.FieldByName('Album_Status').AsInteger);
      Album.ID           := Query.FieldByName('Album_ID').AsInteger;
      Album.NumeroSerie  := Query.FieldByName('Album_NumeroSerie').AsString;
      Album.DataInclusao := Query.FieldByName('Album_DataInclusao').AsDateTime;
      Result := Album;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

end.
