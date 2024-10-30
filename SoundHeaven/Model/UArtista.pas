unit UArtista;

interface

uses System.SysUtils;

type
  TArtista = class
  private
    FID: Integer;
    FNome: string;
    FEstilo: string;
    FAtivo: Char;
    FDataInclusao: TDateTime;
    FDataAlteracao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Estilo: string read FEstilo write FEstilo;
    property Ativo: Char read FAtivo write FAtivo;
    property DataInclusao:  TDateTime read FDataInclusao  write FDataInclusao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;

    // Construtor
    constructor Create(const AID: Integer = 0; const ANome: string = '';
      const AEstilo: string = ''; const AAtivo: Char = 'T';
      const ADataInclusao: TDateTime = 0; const ADataAlteracao: TDateTime = 0);
  end;

implementation

{ TArtistas }

constructor TArtista.Create(const AID: Integer = 0; const ANome: string = '';
  const AEstilo: string = ''; const AAtivo: Char = 'T';
  const ADataInclusao: TDateTime = 0; const ADataAlteracao: TDateTime = 0);
begin
  Randomize;
  if AID = 0 then FID := Random(1000000) else FID := AID;
  if ANome = '' then FNome := 'Unknown' else FNome := ANome;
  if AEstilo = '' then FEstilo := 'Unknown' else FEstilo := AEstilo;
  FAtivo := AAtivo;
  if ADataInclusao = 0 then FDataInclusao := Now else FDataInclusao := ADataInclusao;
  if ADataAlteracao = 0 then FDataAlteracao := Now else FDataAlteracao := ADataAlteracao;
end;

end.
