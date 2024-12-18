unit UArtistaController;

interface

uses UArtista, UArtistaDAO, SysUtils, ADODB, System.Generics.Collections;

type
  TArtistaController = class
  private
    FDAO: TArtistaDAO;
  public
    constructor Create;
    destructor Destroy; override;
    function InserirArtista(const Artista: TArtista): Boolean;
    function AtualizarArtista(const Artista: TArtista): Boolean;
    function ExcluirArtista(const Artista: TArtista): Boolean;
    function LocalizarArtista(const ID: Integer): TArtista; overload;
    function LocalizarArtista(const ArtistaNome: string): TArtista; overload;
    function ListarArtistas: TList<TArtista>;
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

function TArtistaController.InserirArtista(const Artista: TArtista): Boolean;
begin
  if Artista <> nil then
    if Artista.Nome = '' then
      raise Exception.Create('O campo NOME deve ser preenchido.')
    else
      if Artista.Estilo = '' then
        raise Exception.Create('O campo ESTILO deve ser preenchido.')
      else
        Result := FDAO.Inserir(Artista);
end;

function TArtistaController.AtualizarArtista(const Artista: TArtista): Boolean;
begin
  if Artista <> nil then
    if Artista.Nome = '' then
      raise Exception.Create('O campo NOME deve ser preenchido.')
    else
      if Artista.Estilo = '' then
        raise Exception.Create('O campo ESTILO deve ser preenchido')
      else
        Result := FDAO.Atualizar(Artista);
end;

function TArtistaController.ExcluirArtista(const Artista: TArtista): Boolean;
begin
  Result := FDAO.Excluir(Artista);
end;

function TArtistaController.LocalizarArtista(const ID: Integer): TArtista;
begin
  Result := FDAO.LocalizarId(ID);
end;

function TArtistaController.LocalizarArtista(const ArtistaNome: string): TArtista;
begin
  Result := FDAO.LocalizarNome(ArtistaNome);
end;

function TArtistaController.ListarArtistas: TList<TArtista>;
begin
  Result := FDAO.ListarArtistas;
end;

end.
