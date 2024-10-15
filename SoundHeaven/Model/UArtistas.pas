unit UArtistas;

interface

uses System.SysUtils;

type
  TArtista = class
  private
    FID: Integer;
    FNome: string;
    FStatus: Integer;
    FDataInclusao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Status: Integer read FStatus write FStatus;
    property DataInclusão: TDateTime read FDataInclusao write FDataInclusao;

    // Construtor
    constructor Create(AArtista: string; AStatus: Integer = 1);
  end;

implementation

{ TArtistas }

constructor TArtista.Create(AArtista: string; AStatus: Integer = 1);
begin
  FNome := AArtista;
  FStatus := AStatus;
  FDataInclusao := Now;
end;

end.
