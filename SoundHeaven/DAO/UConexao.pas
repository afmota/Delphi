unit UConexao;

interface

uses System.SysUtils, Data.Win.ADODB; // ADO para Delphi

type
  TConexaoDB = class
  private
    FConn: TADOConnection;
  public
    constructor Create;
    destructor Destroy; override;
    function GetConnection: TADOConnection; // M�todo para obter a conex�o
  end;

implementation

{ TConexaoDB }

constructor TConexaoDB.Create;
begin
  FConn := TADOConnection.Create(nil);
  try
    FConn.ConnectionString :=
      'Provider=SQLOLEDB;' +            // Provedor para SQL Server
      'Data Source=localhost;' +        // Nome ou IP do servidor
      'Initial Catalog=SoundHaven;' +   // Nome do banco de dados
      'User ID=sh_user;' +              // Usu�rio do banco
      'Password=W3azxc*;';              // Senha do banco
    FConn.LoginPrompt := False;         // Desativar prompt de login
    FConn.Open;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar no banco de dados: ' + E.Message);
  end;
end;

destructor TConexaoDB.Destroy;
begin
  if FConn.Connected then
    FConn.Close; // Fechar a conex�o ao destruir o objeto
  FConn.Free;
  inherited;
end;

function TConexaoDB.GetConnection: TADOConnection;
begin
  Result := FConn;
end;

end.
