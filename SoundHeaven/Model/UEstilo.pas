unit UEstilo;

interface

uses System.SysUtils, System.Math;

type
  TEstilo = class
  private
    FID: Integer;
    FNome: string;
    FAtivo: Char;
    FDataInclusao: TDateTime;
    FDataAlteracao: TDateTime;
  public
    constructor Create(const AID: Integer); overload; // usado em exclusões
    constructor Create(const ANome: string); overload; // usado em inclusões
    constructor Create(const AID: Integer; const ANome: string); overload; // usado em alterações
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Ativo: Char read FAtivo write FAtivo;
    property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;
  end;

implementation

{ TEstilo }

constructor TEstilo.Create(const AID: Integer);
begin
  FID := AID;
end;

constructor TEstilo.Create(const ANome: string);
begin
  FNome := ANome;
end;

constructor TEstilo.Create(const AID: Integer; const ANome: string);
begin
  FID := AID;
  FNome := ANome;
end;

end.
