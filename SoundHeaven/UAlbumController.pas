unit UAlbumController;

interface

uses UAlbuns, UAlbumDAO, System.SysUtils, Data.Win.ADODB;

type
  TAlbumController = class
    private
      FDAO: TAlbumDAO;
    public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarAlbum(Titulo: string; Artista: string; DataLancamento: TDateTime;
      DataAquisicao: TDateTime; Status: Integer = 1);
    function BuscarAlbum(ID: Integer): TAlbum; overload;
    procedure AtualizarAlbum(Titulo: string; Artista: string; Lancamento: TDateTime;
      Aquisicao: TDateTime; NumeroSerie: string; Status: Integer);
  end;

implementation

{ AlbumController }

constructor TAlbumController.Create;
begin
  FDAO := TAlbumDAO.Create;
end;

destructor TAlbumController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

procedure TAlbumController.AdicionarAlbum(Titulo: string; Artista: string;
  DataLancamento: TDatetime; DataAquisicao: TDateTime; Status: Integer = 1);
var
  Album: TAlbum;
begin
  Album := TAlbum.Create(Titulo, Artista, DataLancamento, DataAquisicao, Status);
  FDAO.Inserir(Album);
end;

function TAlbumController.BuscarAlbum(ID: Integer): TAlbum;
begin
  Result := FDAO.BuscarPorID(ID);
end;

procedure TAlbumController.AtualizarAlbum(Titulo, Artista: string; Lancamento,
  Aquisicao: TDateTime; NumeroSerie: string; Status: Integer);
var
  Album: TAlbum;
begin
  Album := TAlbum.Create(Titulo, Artista, Lancamento, Aquisicao, Status);
  Album.NumeroSerie := NumeroSerie;
  FDAO.Atualizar(Album);
end;

end.
