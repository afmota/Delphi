unit UAlbumDAO;

interface

uses UConexao, UAlbum, Data.Win.ADODB, System.Classes, System.SysUtils, Data.DB,
  Variants, Graphics;

type
  TAlbumDAO = class
  private
    FConn: TConexaoDB;
  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(const Album: TAlbum): Boolean;
    function Atualizar(const Album: TAlbum): Boolean;
    function LocalizarPorId(AlbumID: Integer): TAlbum;
    function LocalizarPorNome(AlbumTitulo: string): TAlbum;
  end;

implementation

{ TAlbumDAO }

constructor TAlbumDAO.Create;
begin
  FConn := TConexaoDB.Create;
end;

destructor TAlbumDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TAlbumDAO.Inserir(const Album: TAlbum): Boolean;
var
  StoredProc: TADOStoredProc;
  MemoryStream: TMemoryStream;
begin
  Result := False;
  StoredProc := TADOStoredProc.Create(nil);
  MemoryStream := TMemoryStream.Create;
  try
    try
      // Carregar a imagem (capa do �lbum) em um fluxo de mem�ria
      if Assigned(Album.Capa) then
        Album.Capa.SaveToStream(MemoryStream);

      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_AlbumInserir';

        with Parameters do
        begin
          Refresh;
          ParamByName('@Album_Titulo').Value := Album.Nome;
          ParamByName('@Album_Artista').Value := Album.Artista;
          ParamByName('@Album_Estilo').Value := Album.Estilo;
          ParamByName('@Album_Produtor').Value := Album.Produtor;
          ParamByName('@Album_Gravadora').Value := Album.Gravadora;
          ParamByName('@Album_Midia').Value := Album.Midia;
          ParamByName('@Album_Catalogo').Value := Album.Catalogo;
          ParamByName('@Album_Lancamento').Value := Album.Lancamento;
          ParamByName('@Album_Aquisicao').Value := Album.Aquisicao;

          // Carregar a imagem como BLOB se houver capa
          if MemoryStream.Size > 0 then
          begin
            MemoryStream.Position := 0; // Garantir que a leitura come�a do in�cio
            ParamByName('@Album_Capa').LoadFromStream(MemoryStream, ftBlob);
          end
          else
            ParamByName('@Album_Capa').Value := null;

          ExecProc;
        end;
      end;

      Result := True;
    except
      on E: Exception do
        raise Exception.Create('Erro ao inserir �lbum: ' + E.Message);
    end;
  finally
    StoredProc.Free;
    MemoryStream.Free;
  end;
end;

function TAlbumDAO.Atualizar(const Album: TAlbum): Boolean;
var
  StoredProc: TADOStoredProc;
  MemoryStream: TMemoryStream;
begin
  Result := False;
  StoredProc := TADOStoredProc.Create(nil);
  MemoryStream := TMemoryStream.Create;
  try
    try
      if Assigned(Album.Capa) then
        Album.Capa.SaveToStream(MemoryStream);

      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_AlbumAtualizar';

        with Parameters do
        begin
          Refresh;
          ParamByName('@Album_ID').Value := Album.ID;
          ParamByName('@Album_Titulo').Value := Album.Nome;
          ParamByName('@Album_Artista').Value := Album.Artista;
          ParamByName('@Album_Estilo').Value := Album.Estilo;
          ParamByName('@Album_Produtor').Value := Album.Produtor;
          ParamByName('@Album_Gravadora').Value := Album.Gravadora;
          ParamByName('@Album_Midia').Value := Album.Midia;
          ParamByName('@Album_Catalogo').Value := Album.Catalogo;
          ParamByName('@Album_Lancamento').Value := Album.Lancamento;
          ParamByName('@Album_Aquisicao').Value := Album.Aquisicao;

          // Carregar a imagem como BLOB se houver capa
          if MemoryStream.Size > 0 then
          begin
            MemoryStream.Position := 0; // Garantir que a leitura come�a do in�cio
            ParamByName('@Album_Capa').LoadFromStream(MemoryStream, ftBlob);
          end
          else
            ParamByName('@Album_Capa').Value := null;

          ExecProc;
        end;
      end;

      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar �lbum: ' + E.Message);
      end;
    end;
  finally
    StoredProc.Free;
    MemoryStream.Free;
  end;
end;

function TAlbumDAO.LocalizarPorId(AlbumID: Integer): TAlbum;
var
  StoredProc: TADOStoredProc;
  MemoryStream: TMemoryStream;
  Bitmap: TBitmap;
begin
  Result := nil; // Inicializa o resultado como nil por precau��o
  StoredProc := TADOStoredProc.Create(nil);
  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_AlbumLocalizarPorId';
      Parameters.Refresh;
      Parameters.ParamByName('@Album_ID').Value := AlbumID;
      Open;

      if not IsEmpty then
      begin
        // Criar o objeto TAlbum com os dados recuperados
        Result := TAlbum.Create(
          FieldByName('Album_Titulo').AsString,
          FieldByName('Album_Artista').AsString,
          FieldByName('Album_Estilo').AsString,
          FieldByName('Album_Produtor').AsString,
          FieldByName('Album_Gravadora').AsString,
          FieldByName('Album_Midia').AsInteger,
          FieldByName('Album_Catalogo').AsString,
          FieldByName('Album_NumSerie').AsString,
          FieldByName('Album_DataLancamento').AsDateTime,
          FieldByName('Album_DataAquisicao').AsDateTime,
          nil // Capa ser� carregada em seguida
        );

        // Carregar a capa se n�o for null
        if not FieldByName('Album_Capa').IsNull then
        begin
          MemoryStream := TMemoryStream.Create;
          Bitmap := TBitmap.Create;
          try
            TBlobField(FieldByName('Album_Capa')).SaveToStream(MemoryStream);
            MemoryStream.Position := 0;
            Bitmap.LoadFromStream(MemoryStream);
            Result.Capa.Assign(Bitmap);
          finally
            MemoryStream.Free;
            Bitmap.Free;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      Result := nil;
      raise Exception.Create('Erro ao localizar o �lbum: ' + E.Message);
    end;
  end;
  StoredProc.Free;
end;


function TAlbumDAO.LocalizarPorNome(AlbumTitulo: string): TAlbum;
var
  StoredProc: TADOStoredProc;
  MemoryStream: TMemoryStream;
  Bitmap: TBitmap;
begin
  Result := nil;
  StoredProc := TADOStoredProc.Create(nil);
  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_AlbumLocalizarPorNome';
      Parameters.Refresh;
      Parameters.ParamByName('@Album_Titulo').Value := AlbumTitulo;
      Open;

      if not IsEmpty then
      begin
        Result := TAlbum.Create(
          FieldByName('Album_Titulo').AsString,
          FieldByName('Album_Artista').AsString,
          FieldByName('Album_Estilo').AsString,
          FieldByName('Album_Produtor').AsString,
          FieldByName('Album_Gravadora').AsString,
          FieldByName('Album_Midia').AsInteger,
          FieldByName('Album_Catalogo').AsString,
          FieldByName('Album_NumSerie').AsString,
          FieldByName('Album_DataLancamento').AsDateTime,
          FieldByName('Album_DataAquisicao').AsDateTime,
          nil // Capa ser� carregada em seguida
        );
        Result.Id := FieldByName('Album_ID').AsInteger;

        if not FieldByName('Album_Capa').IsNull then
        begin
          MemoryStream := TMemoryStream.Create;
          Bitmap := TBitmap.Create;
          try
            TBlobField(FieldByName('Album_Capa')).SaveToStream(MemoryStream);
            MemoryStream.Position := 0;
            Bitmap.LoadFromStream(MemoryStream);
            Result.Capa.Assign(Bitmap);
          finally
            MemoryStream.Free;
            Bitmap.Free;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      Result := nil;
      raise Exception.Create('�lbum n�o encontrado: ' + E.Message);
    end;
  end;
  StoredProc.Free;
end;

end.
