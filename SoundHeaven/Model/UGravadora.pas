unit UGravadora;

interface

uses System.SysUtils;

type
  TGravadora = class
  private
    FID: Integer;
    FNome: string;
    FStatus: Integer;
    FDataInclusao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Status: Integer read FStatus write FStatus;
    property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;

    // Constructor
    constructor Create(ANome: string; AStatus: Integer = 1);
  end;

implementation

{ TGravadora }

constructor TGravadora.Create(ANome: string; AStatus: Integer = 1);
begin
  FNome := ANome;
  FStatus := AStatus;
  FDataInclusao := Now;
end;

end.