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

// M�todo para inserir novo artista no banco
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
        ProcedureName := 'sp_InserirArtista';
        Parameters.Refresh;

        Parameters.ParamByName('@Nome').Value := Artista.Nome;
        Parameters.ParamByName('@Estilo').Value := Artista.Estilo;
        Parameters.ParamByName('@Ativo').value := Artista.Ativo;
        Parameters.ParamByName('@DataInclusao').Value := Artista.DataInclusao;
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

// M�todo para atualizar artista existente
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
        ProcedureName := 'sp_AtualizarArtista';
        Parameters.Refresh;

        Parameters.ParamByName('@ID').Value := Artista.ID;
        Parameters.ParamByName('@Nome').Value := Artista.Nome;
        Parameters.ParamByName('@Estilo').Value := Artista.Estilo;
        Parameters.ParamByName('@Ativo').Value := Artista.Ativo;
        Parameters.ParamByName('@DataAlteracao').Value := Artista.DataAlteracao;
        ExecProc;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar Artista');
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

// M�todo para buscar artista por ID
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
        ProcedureName := 'sp_ObterArtistaAtivoPorID';
        Parameters.Refresh;
        Parameters.ParamByName('@Artista_ID').Value := ID;
        Open;

        if not IsEmpty then
        begin
          Artista := TArtista.Create(FieldByName('Artista_Nome').AsString,
                                     FieldByName('Artista_Estilo').AsString,
                                     FieldByName('Artista_Ativo').AsString[1],
                                     FieldByName('Data_Inclusao').AsDateTime,
                                     FieldByName('Data_Alteracao').AsDateTime);
          Artista.ID := FieldByName('Artista_ID').AsInteger;
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
        ProcedureName := 'sp_ObterArtistaAtivoPorNome';
        Parameters.Refresh;
        Parameters.ParamByName('@Artista_Nome').Value := ArtistaNome;
        Open;

        if not IsEmpty then
        begin
          Artista := TArtista.Create(FieldByName('Artista_Nome').AsString,
                                     FieldByName('Artista_Estilo').AsString,
                                     FieldByName('Artista_Ativo').AsString[1],
                                     FieldByName('Data_Inclusao').AsDateTime,
                                     FieldByName('Data_Alteracao').AsDateTime);
          Artista.ID := FieldByName('Artista_ID').AsInteger;
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

// M�todo para listar artistas ativos
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
      ProcedureName := 'sp_ListarArtistasAtivos';
      Parameters.Refresh;
      Open;
      First;

      if not IsEmpty then
        while not Eof do
        begin
          Artista := TArtista.Create(FieldByName('Artista_Nome').AsString,
                                     FieldByName('Artista_Estilo').AsString,
                                     FieldByName('Artista_Ativo').AsString[1],
                                     FieldByName('Data_Inclusao').AsDateTime,
                                     FieldByName('Data_Alteracao').AsDateTime);
          Artista.ID := FieldByName('Artista_ID').AsInteger;
          Result.Add(Artista);
          Next;
        end
        else
          Result := nil;
    end;
  finally
    StoredProc.Free;
    Artista.Free;
  end;
end;

end.
