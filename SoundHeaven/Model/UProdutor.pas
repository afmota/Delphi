unit UProdutor;

interface

uses System.SysUtils;

type
  TProdutor = class
  private
    FID: Integer;
    FNome: string;
    FAtivo: Char;
    FDataInclusao: TDateTime;
    FDataAlteracao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Ativo: Char read FAtivo write FAtivo;
    property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;
    constructor Create(const AID: Integer); overload;
    constructor Create(const ANome: string); overload;
    constructor Create(const AID: Integer; const ANome: string); overload;
  end;

implementation

{ TProdutor }

constructor TProdutor.Create(const AID: Integer);
begin
  FID := AID;
end;

constructor TProdutor.Create(const ANome: string);
begin
  FNome := ANome;
end;

constructor TProdutor.Create(const AID: Integer; const ANome: string);
begin
  FID := AID;
  FNome := ANome;
end;

end.
