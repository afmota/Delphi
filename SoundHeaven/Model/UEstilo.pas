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
    //constructor Create(ANome: string; AStatus: Integer = 1);
    constructor Create(const AID: Integer = 0; const ANome: string = '';
      const AAtivo: Char = 'T'; const ADataInclusao: TDateTime = 0;
      const ADataAlteracao: TDateTime = 0); overload;
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Ativo: Char read FAtivo write FAtivo;
    property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;
  end;

implementation

{ TEstilo }

constructor TEstilo.Create(const AID: Integer = 0; const ANome: string = '';
  const AAtivo: Char = 'T'; const ADataInclusao: TDateTime = 0;
  const ADataAlteracao: TDateTime = 0);
begin
  Randomize;
  if FID = 0 then FID := Random(1000000) else FID := AID;
  if ANome = '' then FNome := 'Unknown' else FNome := ANome;
  FAtivo := AAtivo;
  if ADataInclusao = 0 then FDataInclusao := Now else FDataInclusao := ADataInclusao;
  if DataAlteracao = 0 then FDataAlteracao := Now else FDataAlteracao := DataAlteracao;
end;

end.
