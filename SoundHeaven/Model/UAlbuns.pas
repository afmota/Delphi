unit UAlbuns;

interface

uses System.SysUtils, UArtistas;

type
  TAlbum = class
  private
    FID: Integer;
    FTitulo: string;
    FArtista: string;
    FDataLancamento: TDateTime;
    FDataAquisicao: TDateTime;
    FProdutor: string;
    FGravadora: string;
    FNumeroSerie: string;
    FStatus: Integer;
    FDataInclusao: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Titulo: string read FTitulo write FTitulo;
    property Artista: string read FArtista write FArtista;
    property DataLancamento: TDateTime read FDataLancamento write FDataLancamento;
    property DataAquisicao: TDateTime read FDataAquisicao write FDataAquisicao;
    property Produtor: string read FProdutor write FProdutor;
    property Gravadora: string read FGravadora write FGravadora;
    property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
    property Status: Integer read FStatus write FStatus;
    property DataInclusao: TDateTime read FDataInclusao write FDataInclusao;
    constructor Create(ATitulo: string; AArtista: string;
      ADataLancamento: TDateTime; AStatus: Integer = 1);
  end;

implementation

{ TAlbum }

constructor TAlbum.Create(ATitulo, AArtista: string; ADataLancamento: TDateTime;
  AStatus: Integer = 1);
begin
  FTitulo := ATitulo;
  FArtista := AArtista;
  FDataLancamento := ADataLancamento;
  FStatus := AStatus;
  FDataInclusao := Now;
end;

end.
