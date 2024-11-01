unit UGravadoraController;

interface

uses UGravadoraDAO, UGravadora;

type
  TGravadoraController = class
  private
    FDAO: TGravadoraDAO;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirGravadora(Nome: string);
    procedure AtualizarGravadora(ID: Integer; Nome: string; Status: Integer);
    function BuscarGravadora(ID: Integer): TGravadora;
  end;

implementation

constructor TGravadoraController.Create;
begin
  FDAO := TGravadoraDAO.Create;
end;

destructor TGravadoraController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

procedure TGravadoraController.InserirGravadora(Nome: string);
var
  Gravadora: TGravadora;
begin
  Gravadora := TGravadora.Create(Nome);
  FDAO.Inserir(Gravadora);
end;

procedure TGravadoraController.AtualizarGravadora(ID: Integer; Nome: string; Status: Integer);
var
  Gravadora: TGravadora;
begin
  Gravadora := FDAO.BuscarGravadora(ID);
  if Gravadora <> nil then
  begin
    Gravadora.Nome := Nome;
    Gravadora.Status := Status;
    FDAO.Atualizar(Gravadora);
  end;
end;

function TGravadoraController.BuscarGravadora(ID: Integer): TGravadora;
begin
  Result := FDAO.BuscarGravadora(ID);
end;

end.
