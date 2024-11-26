unit UStore;

interface

type
  TStore = class
  private
    FID: Integer;
    FTitulo: string;
    FArtista: string;
    FDataLancamento: TDateTime;
    FAtivo: string;
  public
    property ID: Integer read FID write FID;
    property Titulo: string read FTitulo write FTitulo;
    property Artista: string read FArtista write FArtista;
    property DataLancamento: TDateTime read FDataLancamento write FDataLancamento;
    constructor Create(const ATitulo: string; const AArtista: string;
      const ADataLancamento: TDateTime); overload;
    constructor Create(const AID: Integer); overload;
  end;

implementation

{ TStore }

constructor TStore.Create(const AID: Integer);
begin
  FID := AID;
end;

constructor TStore.Create(const ATitulo, AArtista: string;
  const ADataLancamento: TDateTime);
begin
  FTitulo := ATitulo;
  FArtista := AArtista;
  FDataLancamento := ADataLancamento;
end;

end.
