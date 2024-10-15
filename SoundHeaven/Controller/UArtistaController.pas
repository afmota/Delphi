unit UArtistaController;

interface

uses UArtistas, UArtistaDAO, SysUtils, ADODB;

type
  TArtistaController = class
  private
    FDAO: TArtistaDAO;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarArtista(NomeArtista: string);
    procedure AtualizarArtista(ID: Integer; NomeArtista: string; Status: Integer);
    procedure AlterarStatusArtista(ID: Integer; NovoStatus: Integer);
    function BuscarArtista(ID: Integer): TArtista; overload;
    function BuscarArtista(ArtistaNome: string): TArtista; overload;
    function ListarArtistasAtivos: TADOQuery;
  end;

implementation

constructor TArtistaController.Create;
begin
  FDAO := TArtistaDAO.Create;
end;

destructor TArtistaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

procedure TArtistaController.AdicionarArtista(NomeArtista: string);
var
  Artista: TArtista;
begin
  Artista := TArtista.Create(NomeArtista);
  FDAO.Inserir(Artista);
end;

procedure TArtistaController.AtualizarArtista(ID: Integer; NomeArtista: string; Status: Integer);
var
  Artista: TArtista;
begin
  Artista := FDAO.BuscarPorId(ID);
  if Artista <> nil then
  begin
    Artista.Nome := NomeArtista;
    Artista.Status := Status;
    FDAO.Atualizar(Artista);
  end;
end;

function TArtistaController.BuscarArtista(ArtistaNome: string): TArtista;
begin
  Result := FDAO.BuscarPorNome(ArtistaNome);
end;

procedure TArtistaController.AlterarStatusArtista(ID: Integer; NovoStatus: Integer);
var
  Artista: TArtista;
begin
  Artista := FDAO.BuscarPorId(ID);
  if Artista <> nil then
  begin
    Artista.Status := NovoStatus;
    FDAO.Atualizar(Artista);
  end;
end;

function TArtistaController.BuscarArtista(ID: Integer): TArtista;
begin
  Result := FDAO.BuscarPorId(ID);
end;

function TArtistaController.ListarArtistasAtivos: TADOQuery;
begin
  Result := FDAO.ListarAtivos;
end;

end.
