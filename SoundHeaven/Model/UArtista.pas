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
    constructor Create(const ANome: string; const AEstilo: string); overload;
    constructor Create(const AID: Integer; const ANome: string; const AEstilo: string); overload;
    constructor Create(const AID: Integer); overload;
  end;

implementation

{ TArtista }

constructor TArtista.Create(const ANome, AEstilo: string);
begin
  FNome := ANome;
  FEstilo := AEstilo;
end;

constructor TArtista.Create(const AID: Integer; const ANome, AEstilo: string);
begin
  FID := AID;
  FNome := ANome;
  FEstilo := AEstilo;
end;

constructor TArtista.Create(const AID: Integer);
begin
  FID := AID;
end;

end.
