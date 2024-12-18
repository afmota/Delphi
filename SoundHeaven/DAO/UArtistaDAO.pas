unit UArtistaDAO;

interface

uses System.SysUtils, Data.Win.ADODB, UConexao, UArtista, System.Generics.Collections;

type
  TArtistaDAO = class
  private
    FConn: TConexaoDB; // Conex�o com o SQL Server
  public
    constructor Create;
    destructor Destroy; override;

    // M�todos CRUD
    function Inserir(const Artista: TArtista): Boolean;
    function Atualizar(const Artista: TArtista): Boolean;
    function Excluir(const Artista: TArtista): Boolean;
    function LocalizarId(const ID: Integer): TArtista;
    function LocalizarNome(const ArtistaNome: string): TArtista;
    function ListarArtistas: TList<TArtista>;
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

function TArtistaDAO.Inserir(const Artista: TArtista): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  StoredProc := TADOStoredProc.Create(nil);
  try
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ArtistaInserir';
        Parameters.Refresh;

        with Parameters do
        begin
          ParamByName('@Nome').Value := Artista.Nome;
          ParamByName('@Estilo').Value := Artista.Estilo;
        end;

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

function TArtistaDAO.Atualizar(const Artista: TArtista): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  StoredProc := TADOStoredProc.Create(nil);
  try
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ArtistaAtualizar';
        Parameters.Refresh;

        with Parameters do
        begin
          ParamByName('@ID').Value := Artista.ID;
          ParamByName('@Nome').Value := Artista.Nome;
          ParamByName('@Estilo').Value := Artista.Estilo;
        end;

        ExecProc;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar Artista');
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TArtistaDAO.Excluir(const Artista: TArtista): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      try
        with StoredProc do
        begin
          Connection := FConn.GetConnection;
          ProcedureName := 'sp_ArtistaExcluir';
          Parameters.Refresh;
          Parameters.ParamByName('@Artista_ID').Value := Artista.ID;
          ExecProc;

          Result := True;
        end;
      except
        on E: Exception do
        begin
          raise Exception.Create('Erro ao excluir Artista: ' + E.Message);
          Result := False;
        end;
      end;
    finally
      StoredProc.Free;
    end;
  finally

  end;
end;

function TArtistaDAO.LocalizarId(const ID: Integer): TArtista;
var
  StoredProc: TADOStoredProc;
  Artista: TArtista;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ArtistaLocalizarPorID';
        Parameters.Refresh;
        Parameters.ParamByName('@Artista_ID').Value := ID;
        Open;

        if not IsEmpty then
        begin
          Artista := TArtista.Create(
            FieldByName('Artista_ID').AsInteger,
            FieldByName('Artista_Nome').AsString,
            FieldByName('Artista_Estilo').AsString);
          Result := Artista;
        end
        else
          Result := nil;
      end;
    except
      on E: Exception do
        raise Exception.Create('Artista n�o encontrado.');
    end;
  finally
    StoredProc.Free;
  end;
end;

function TArtistaDAO.LocalizarNome(const ArtistaNome: string): TArtista;
var
  StoredProc: TADOStoredProc;
  Artista: TArtista;
begin
  try
    try
      StoredProc := TADOStoredProc.Create(nil);
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_ArtistaLocalizarPorNome';
        Parameters.Refresh;
        Parameters.ParamByName('@Artista_Nome').Value := ArtistaNome;
        Open;

        if not IsEmpty then
        begin
          Artista := TArtista.Create(
            FieldByName('Artista_ID').AsInteger,
            FieldByName('Artista_Nome').AsString,
            FieldByName('Artista_Estilo').AsString);
          Result := Artista;
        end
        else
          Result := nil;
      end;
    except
      on E: Exception do
        raise Exception.Create('Artista n�o encontrado.');
    end;
  finally
    StoredProc.Free;
  end;
end;

function TArtistaDAO.ListarArtistas: TList<TArtista>;
var
  StoredProc: TADOStoredProc;
  Artista: TArtista;
begin
  Result := TList<TArtista>.Create;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_ArtistaListarAtivos';
      Parameters.Refresh;
      Open;
      First;

      if not IsEmpty then
        while not Eof do
        begin
          Artista := TArtista.Create(
            FieldByName('Artista_ID').AsInteger,
            FieldByName('Artista_Nome').AsString,
            FieldByName('Artista_Estilo').AsString);
          Result.Add(Artista);
          Next;
        end
        else
          Result := nil;
    end;
  finally
    StoredProc.Free;
  end;
end;

end.
