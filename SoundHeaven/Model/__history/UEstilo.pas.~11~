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
    constructor Create(const Nome: string; const Ativo: Char;
      const DataInclusao: TDateTime = 0; const DataAlteracao: TDateTime = 0); overload;
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Ativo: Char read FAtivo write FAtivo;
    property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;
  end;

implementation

{ TEstilo }

//constructor TEstilo.Create(ANome: string; AStatus: Integer = 1);
constructor TEstilo.Create(const Nome: string; const Ativo: Char;
  const DataInclusao: TDateTime = 0; const DataAlteracao: TDateTime = 0);
begin
  FNome := Nome;
  FAtivo := Ativo;
  if DataInclusao = 0 then FDataInclusao := Now else FDataInclusao := DataInclusao;
  if DataAlteracao = 0 then FDataAlteracao := Now else FDataAlteracao := DataAlteracao;
end;

end.
