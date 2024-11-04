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

    constructor Create(const AID: Integer; const ANome: string; const AAtivo: Char;
      const ADataInclusao: TDateTime; const ADataAlteracao: TDateTime); overload;
    constructor Create(const ANome: string); overload;
    constructor Create(const AID: Integer; const AAtivo: Char;
      ADataAlteracao: TDateTime); overload;
  end;

implementation

{ TProdutor }

constructor TProdutor.Create(const AID: Integer; const ANome: string;
  const AAtivo: Char; const ADataInclusao: TDateTime; const ADataAlteracao: TDateTime);
begin
  Randomize;
  if AID = 0 then FID := Random(1000000) else FID := AID;
  if ANome = '' then FNome := 'Unknown' else FNome := ANome;
  FAtivo := AAtivo;
  if ADataInclusao = 0 then FDataInclusao := Now else FDataInclusao := ADataInclusao;
  if ADataAlteracao = 0 then FDataAlteracao := Now else FDataAlteracao := ADataAlteracao;
end;

constructor TProdutor.Create(const ANome: string);
begin
  Randomize;
  FID := Random(1000000);
  FNome := ANome;
  FAtivo := 'T';
  FDataInclusao := Now;
end;

constructor TProdutor.Create(const AID: Integer; const AAtivo: Char;
  ADataAlteracao: TDateTime);
begin
  FID := AID;
  FAtivo := AAtivo;
  FDataAlteracao := ADataAlteracao;
end;

end.
