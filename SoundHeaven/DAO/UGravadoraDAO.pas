unit UGravadoraDAO;

interface

uses UConexao, UGravadora, Data.Win.ADODB;

type
  TGravadoraDAO = class
  private
    FConn: TConexaoDB; // Conexão com o SQL Server
  public
    constructor Create;
    destructor Destroy;
    procedure Inserir(Gravadora: TGravadora);
    procedure Atualizar(Gravadora: TGravadora);
    function BuscarGravadora(ID: Integer): TGravadora;
  end;

implementation

constructor TGravadoraDAO.Create;
begin
  FConn := TConexaoDB.Create; //Instancia a conexão ADO
end;

destructor TGravadoraDAO.Destroy;
begin
  FConn.Free; // Liberar a conexão ao destruir
  inherited;
end;

procedure TGravadoraDAO.Inserir(Gravadora: TGravadora);
var
  Query: TADOQuery;
begin
  try
    Query := TADOQuery.Create(nil);
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'INSERT INTO TB_Gravadoras (Gravadora_Nome, Gravadora_Status, DataInclusao) ' +
                      'VALUES (:Nome, :Status, :DataInclusao)';
    Query.Parameters.ParamByName('Nome').Value := Gravadora.Nome;
    Query.Parameters.ParamByName('Status').Value := Gravadora.Status;
    Query.Parameters.ParamByName('DataInclusao').Value := Gravadora.DataInclusao;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TGravadoraDAO.Atualizar(Gravadora: TGravadora);
var
  Query: TADOQuery;
begin
  try
    Query := TADOQuery.Create(nil);
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'UPDATE TB_Gravadores SET Gravadora_Nome = :Nome, Gravadora_Status = :Status';
    Query.Parameters.ParamByName('Nome').Value := Gravadora.Nome;
    Query.Parameters.ParamByName('Status').Value := Gravadora.Status;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

function TGravadoraDAO.BuscarGravadora(ID: Integer): TGravadora;
var
  Query: TADOQuery;
  Gravadora: TGravadora;
begin
  try
    Query := TADOQuery.Create(nil);
    Query.Connection := FConn.GetConnection;
    Query.SQL.Text := 'SELECT * FROM TB_Gravadoras WHERE ID = :ID';
    Query.Parameters.ParamByName('ID').Value := ID;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Gravadora := TGravadora.Create(Query.FieldByName('Gravadora_Nome').AsString,
                                     Query.FieldByName('Gravadora_Status').AsInteger);
      Gravadora.ID := Query.FieldByName('Gravadora_ID').AsInteger;
      Gravadora.DataInclusao := Query.FieldByName('DataInclusao').AsDateTime;
      Result := Gravadora;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

end.
