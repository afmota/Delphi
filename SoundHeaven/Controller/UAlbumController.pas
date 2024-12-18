unit UAlbumController;

interface

uses UAlbumDAO, UAlbum, SysUtils, System.Classes, Dialogs;

type
  TAlbumController = class
  private
    FDAO: TAlbumDAO;
    function ValidarCampos(Album: TAlbum; Erros: TStringList): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function InserirAlbum(const Album: TAlbum): Boolean;
    function AtualizarAlbum(const Album: TAlbum): Boolean;
    function LocalizarAlbumPorID(AlbumID: Integer): TAlbum;
    function LocalizarAlbumPorNome(AlbumTitulo: string): TAlbum;
  end;

implementation

{ TAlbumController }

constructor TAlbumController.Create;
begin
  FDAO := TAlbumDAO.Create;
end;

destructor TAlbumController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TAlbumController.InserirAlbum(const Album: TAlbum): Boolean;
var
  Erros: TStringList;
  EhValido: Boolean;
begin
  Erros := TStringList.Create;
  try
    EhValido := ValidarCampos(Album, Erros);
    if not EhValido then
      ShowMessage('Verificar os erros: ' + sLineBreak + Erros.Text)
    else
      Result := FDAO.Inserir(Album);
  finally
    Erros.Free;
  end;
end;

function TAlbumController.AtualizarAlbum(const Album: TAlbum): Boolean;
var
  Erros: TStringList;
  EhValido: Boolean;
begin
  Erros := TStringList.Create;
  try
    EhValido := ValidarCampos(Album, Erros);
    if not EhValido then
      ShowMessage('Verificar os erros: ' + sLineBreak + Erros.Text)
    else
      Result := FDAO.Atualizar(Album);
  finally

  end;
end;

function TAlbumController.ValidarCampos(Album: TAlbum; Erros: TStringList): Boolean;
begin
  Erros.Clear;

  if Trim(Album.Nome) = '' then Erros.Add('O campo T�TULO deve ser preenchido.');
  if Trim(Album.Artista) = '' then Erros.Add('O campo ARTISTA deve ser preenchido.');
  if Trim(Album.Estilo) = '' then Erros.Add('O campo ESTILO deve ser preenchido.');
  if Trim(Album.Produtor) = '' then Erros.Add('O campo PRODUTOR deve ser preenchido.');
  if Trim(Album.Gravadora) = '' then Erros.Add('O campo GRAVADORA deve ser preenchido.');
  if Album.Midia < 0 then Erros.Add('O campo M�DIA deve ser preenchido.');
  if Album.Lancamento > Now then Erros.Add('A data de LAN�AMENTO n�o pode ser uma data futura.');
  if Album.Aquisicao > Now then Erros.Add('A data de AQUISI��O n�o pode ser uma data futura.');
  if Trim(Album.Catalogo) = '' then Erros.Add('O campo CAT�LOGO deve ser preenchido.');

  // Retorna True se n�o houver erros (lista vazia), ou False se houver
  Result := Erros.Count = 0;
end;

function TAlbumController.LocalizarAlbumPorID(AlbumID: Integer): TAlbum;
begin
  Result := FDAO.LocalizarPorId(AlbumID);
end;

function TAlbumController.LocalizarAlbumPorNome(AlbumTitulo: string): TAlbum;
begin
  Result := FDAO.LocalizarPorNome(AlbumTitulo);
end;

end.
