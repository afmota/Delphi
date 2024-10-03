unit UArtistas;

interface

uses System.SysUtils;

type
  TArtista = class
  private
    FID: Integer;
    FArtista: string;
    FStatus: Integer;
    FDataInclusao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Artista: string read FArtista write FArtista;
    property Status: Integer read FStatus write FStatus;
    property DataInclusão: TDateTime read FDataInclusao write FDataInclusao;

    // Método para ativar ou desativar a gravadora
    procedure AlterarStatus(NovoStatus: Integer);

    // Construtor
    constructor Create(AArtista: string; AStatus: Integer = 1);

    // Para facilitar a visualização se está ativo ou não
    function IsAtivo: Boolean;
  end;

implementation

{ TArtistas }

procedure TArtista.AlterarStatus(NovoStatus: Integer);
begin
  FStatus := NovoStatus;
end;

constructor TArtista.Create(AArtista: string; AStatus: Integer = 1);
begin
  FArtista := AArtista;
  FStatus := AStatus;
  FDataInclusao := Now;
end;

function TArtista.IsAtivo: Boolean;
begin
  Result := Fstatus = 1;
end;

end.
