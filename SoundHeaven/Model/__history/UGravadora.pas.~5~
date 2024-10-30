unit UGravadora;

interface

uses System.SysUtils;

type
  TGravadora = class
  private
    FID: Integer;
    FNome: string;
    FAtivo: Char;
    FDataInclusao: TDateTime;
    FDataAlteracao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property FAtivo: Char read FAtivo write FAtivo;
    property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;

    // Constructor
    constructor Create(const ANome: string; const AAtivo: Char = 'T';
      const ADataInclusao: TDateTime = 0; const ADataAlteracao: TDateTime = 0);
  end;

implementation

{ TGravadora }

constructor TGravadora.Create(const ANome: string; const AAtivo: Char = 'T';
  const ADataInclusao: TDateTime = 0; const ADataAlteracao: TDateTime = 0);
begin
  FNome := ANome;
  FAtivo := AAtivo;
  if ADataInclusao = 0 then FDataInclusao := Now else FDataInclusao := ADataInclusao;
  if ADataAlteracao = 0 then FDataInclusao := Now else FDataAlteracao := ADataAlteracao;
end;

end.
