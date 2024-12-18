unit UAlbum;

interface

uses Graphics, SysUtils;

type
  TAlbum = class
  private
    FID: Integer;
    FNome: string;
    FArtista: string;
    FEstilo: string;
    FProdutor: string;
    FGravadora: string;
    FMidia: Integer;
    FCatalogo: string;
    FNumSerie: string;
    FLancamento: TDateTime;
    FAquisicao: TDateTime;
    FCapa: TBitmap;
    FObservacao: string;
    FAtivo: Char;
    Data_Inclusao: TDateTime;
    Data_Alteracao: TDateTime;
  public
    constructor Create(const ANome: string; const AArtista: string; const AEstilo: string;
      const AProdutor: string; const AGravadora: string; const AMidia: Integer;
      const ACatalogo: string; const ALancamento: TDateTime; const AAquisicao: TDateTime;
      const ACapa: TBitmap); overload;
    constructor Create(const ANome: string; const AArtista: string;
      const AEstilo: string; const AProdutor: string; const AGravadora: string;
      const AMidia: Integer; const ACatalogo: string; const ANumSerie: string;
      const ALancamento: TDateTime; const AAquisicao: TDateTime; const ACapa: TBitmap); overload;
    constructor Create(const AID: Integer; const ANome: string; const AArtista: string;
      const AEstilo: string; const AProdutor: string; const AGravadora: string;
      const AMidia: Integer; const ACatalogo: string; const ALancamento: TDateTime;
      const AAquisicao: TDateTime; const ACapa: TBitmap); overload;
    destructor Destroy; override;
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Artista: string read FArtista write FArtista;
    property Estilo: string read FEstilo write FEstilo;
    property Produtor: string read FProdutor write FProdutor;
    property Gravadora: string read FGravadora write FGravadora;
    property Midia: Integer read FMidia write FMidia;
    property Catalogo: string read FCatalogo write FCatalogo;
    property NumSerie: string read FNumSerie write FNumSerie;
    property Lancamento: TDateTime read FLancamento write FLancamento;
    property Aquisicao: TDateTime read FAquisicao write FAquisicao;
    property Capa: TBitmap read FCapa write FCapa;
    property Observacao: string read FObservacao write FObservacao;
  end;

implementation

{ TAlbum }

constructor TAlbum.Create(const ANome: string; const AArtista: string; const AEstilo: string;
  const AProdutor: string; const AGravadora: string; const AMidia: Integer;
  const ACatalogo: string; const ALancamento: TDateTime; const AAquisicao: TDateTime;
  const ACapa: TBitmap);
begin
  FNome := ANome;
  FArtista := AArtista;
  FEstilo := AEstilo;
  FProdutor := AProdutor;
  FGravadora := AGravadora;
  FMidia := AMidia;
  FCatalogo := ACatalogo;
  FLancamento := ALancamento;
  FAquisicao := AAquisicao;

  // Inicializar e copiar o bitmap, se um bitmap for fornecido
  FCapa := TBitmap.Create;
  if Assigned(ACapa) then
    FCapa.Assign(ACapa);
end;

constructor TAlbum.Create(const ANome: string; const AArtista: string;
      const AEstilo: string; const AProdutor: string; const AGravadora: string;
      const AMidia: Integer; const ACatalogo: string; const ANumSerie: string;
      const ALancamento: TDateTime; const AAquisicao: TDateTime; const ACapa: TBitmap);
begin
  FNome := ANome;
  FArtista := AArtista;
  FEstilo := AEstilo;
  FProdutor := AProdutor;
  FGravadora := AGravadora;
  FMidia := AMidia;
  FCatalogo := ACatalogo;
  FNumSerie := ANumSerie;
  FLancamento := ALancamento;
  FAquisicao := AAquisicao;

  // Inicializar e copiar o bitmap, se um bitmap for fornecido
  FCapa := TBitmap.Create;
  if Assigned(ACapa) then
    FCapa.Assign(ACapa);
end;

constructor TAlbum.Create(const AID: Integer; const ANome, AArtista, AEstilo,
  AProdutor, AGravadora: string; const AMidia: Integer; const ACatalogo: string;
  const ALancamento, AAquisicao: TDateTime; const ACapa: TBitmap);
begin
  FID := AID;
  FNome := ANome;
  FArtista := AArtista;
  FEstilo := AEstilo;
  FProdutor := AProdutor;
  FGravadora := AGravadora;
  FMidia := AMidia;
  FCatalogo := ACatalogo;
  FLancamento := ALancamento;
  FAquisicao := AAquisicao;

  // Inicializar e copiar o bitmap, se um bitmap for fornecido
  FCapa := TBitmap.Create;
  if Assigned(ACapa) then
    FCapa.Assign(ACapa);

end;

destructor TAlbum.Destroy;
begin
  FCapa.Free; // Libera o bitmap para evitar vazamento de mem�ria
  inherited;
end;

end.

