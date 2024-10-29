unit UAlbunsController;

interface

uses UAlbuns, UAlbunsDAO, System.SysUtils, Data.Win.ADODB;

type
  TAlbumController = class
    private
      FDAO: TAlbunsDAO;
    public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarAlbum(Titulo: string; Artista: string; DataLancamento: TDateTime;
      DataAquisicao: TDateTime; Status: Integer = 1);
    function BuscarAlbum(ID: Integer): TAlbum; overload;
  end;

implementation

{ AlbumController }

constructor TAlbumController.Create;
begin
  FDAO := TAlbunsDAO.Create;
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

end.