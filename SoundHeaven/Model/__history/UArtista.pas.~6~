unit UArtista;

interface

uses System.SysUtils;

type
  TArtista = class
  private
    FID: Integer;
    FNome: string;
    FEstilo: string;
    FStatus: Char;
    FDataInclusao: TDateTime;
    FDataAlteracao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Estilo: string read FEstilo write FEstilo;
    property Ativo: Char read FStatus write FStatus;
    property DataInclusao:  TDateTime read FDataInclusao  write FDataInclusao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;

    // Construtor
    constructor Create(const ANome: string; const AEstilo: string; const AStatus: Char;
      const ADataInclusao: TDateTime; const ADataAlteracao: TDateTime);
  end;

implementation

{ TArtistas }

constructor TArtista.Create(const ANome: string; const AEstilo: string; const AStatus: Char;
  const ADataInclusao: TDateTime; const ADataAlteracao: TDateTime);
begin
  FNome := ANome;
  FEstilo := AEstilo;
  FStatus := AStatus;
  if ADataInclusao = 0 then FDataInclusao := Now else FDataInclusao := ADataInclusao;
  if ADataAlteracao = 0 then FDataAlteracao := Now else FDataAlteracao := ADataAlteracao;
end;

end.
