unit UProdutorDAO;

interface

uses UCOnexao;

type
  TProdutorDAO = class
  private
    FConn: TConexaoDB;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TProdutorDAO }

constructor TProdutorDAO.Create;
begin
  FConn := TConexaoDB.Create;
end;

destructor TProdutorDAO.Destroy;
begin
  FConn.Free;
  inherited;
end;

end.