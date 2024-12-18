unit Albuns;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.StyledButton, Vcl.ExtCtrls, Vcl.ComCtrls, System.Generics.Collections,
  Vcl.Buttons;

type
  TfrmAlbuns = class(TfrmModel)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cbArtista: TComboBox;
    cbEstilo: TComboBox;
    cbProdutor: TComboBox;
    cbGravadora: TComboBox;
    cbMidia: TComboBox;
    dtLancamento: TDateTimePicker;
    dtAquisicao: TDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtCatalogo: TEdit;
    edtNumSerie: TEdit;
    Shape1: TShape;
    imgCapa: TImage;
    btnUpArtista: TBitBtn;
    btnUpEstilo: TBitBtn;
    btnUpProdutor: TBitBtn;
    btnUpGravadora: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CarregaCbArtista;
    procedure CarregaCbEstilo;
    procedure CarregaCbProdutor;
    procedure CarregaCbGravadora;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnUpArtistaClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlbuns: TfrmAlbuns;

implementation

{$R *.dfm}

uses UArtistaController, UArtista, ComponentHelper, UEstiloController, UEstilo,
  UProdutorController, UProdutor, UGravadoraController, UGravadora, UAlbum,
  UAlbumController, Vcl.Clipbrd;

procedure TfrmAlbuns.FormShow(Sender: TObject);
begin
  inherited;

  imgCapa.Picture := nil;

  cbArtista.Items.Clear;
  cbEstilo.Items.Clear;
  cbProdutor.Items.Clear;
  cbGravadora.Items.Clear;

  CarregaCbArtista;
  CarregaCbEstilo;
  CarregaCbProdutor;
  CarregaCbGravadora;

  dtLancamento.Date := Now;
  dtAquisicao.Date := Now;
end;

procedure TfrmAlbuns.CarregaCBArtista;
var
  ArtistaController: TArtistaController;
  ListaArtistas: TList<TArtista>;
  I: Integer;
  Artista: TArtista;
begin
  try
    cbArtista.Items.Clear;
    ArtistaController := TArtistaController.Create;
    ListaArtistas := ArtistaController.ListarArtistas;
    if not Assigned(ListaArtistas) then
    begin
      MessageDlg('Artistas ainda n�o foram cadastrados no sistema.', mtInformation, [mbOk], 0);
      EnableButtons(Self, '0000001');
    end
    else
    begin
      for I := 0 to ListaArtistas.Count -1 do
      begin
        Artista := ListaArtistas[I];
        cbArtista.Items.Add(Artista.Nome);
      end;
      cbArtista.ItemIndex := -1;
    end;
  finally
    if Assigned(ListaArtistas) then
    begin
      ListaArtistas.Free;
      ArtistaController.Free;
    end;
  end;
end;

procedure TfrmAlbuns.CarregaCbEstilo;
var
  EstiloController: TEstiloController;
  ListaEstilos: TList<TEstilo>;
  I: Integer;
  Estilo: TEstilo;
begin
  try
    cbEstilo.Items.Clear;
    EstiloController := TEstiloController.Create;
    ListaEstilos := EstiloController.ListarEstilos;
    if not Assigned(ListaEstilos) then
    begin
      MessageDlg('Estilos musicais ainda n�o foram cadastrados no sistema.', mtInformation, [mbOk], 0);
      EnableButtons(Self, '0000001');
    end
    else
    begin
      for I := 0 to ListaEstilos.Count -1 do
      begin
        Estilo := ListaEstilos[I];
        cbEstilo.Items.Add(Estilo.Nome);
      end;
      cbEstilo.ItemIndex := -1;
    end;
  finally
    if Assigned(ListaEstilos) then
    begin
      ListaEstilos.Free;
      EstiloController.Free;
    end;
  end;
end;

procedure TfrmAlbuns.CarregaCbProdutor;
var
  ProdutorController: TProdutorController;
  ListaProdutores: TList<TProdutor>;
  I: Integer;
  Produtor: TProdutor;
begin
  try
    cbProdutor.Items.Clear;
    ProdutorController := TProdutorController.Create;
    ListaProdutores := ProdutorController.ListarProdutores;
    if not Assigned(ListaProdutores) then
    begin
      MessageDlg('Produtores ainda n�o foram cadastrados no sistema.', mtInformation, [mbOk], 0);
      EnableButtons(Self, '0000001');
    end
    else
    begin
      for I := 0 to ListaProdutores.Count -1 do
      begin
        Produtor := ListaProdutores[I];
        cbProdutor.Items.Add(Produtor.Nome);
      end;
      cbProdutor.ItemIndex := -1;
    end;
  finally
    if Assigned(ListaProdutores) then
    begin
      ListaProdutores.Free;
      ProdutorController.Free;
    end;
  end;
end;

procedure TfrmAlbuns.CarregaCbGravadora;
var
  GravadoraController: TGravadoraController;
  ListaGravadoras: TList<TGravadora>;
  I: Integer;
  Gravadora: TGravadora;
begin
  try
    cbGravadora.Items.Clear;
    GravadoraController := TGravadoraController.Create;
    ListaGravadoras := GravadoraController.ListarGravadoras;
    if not Assigned(ListaGravadoras) then
    begin
      MessageDlg('Gravadoras ainda n�o foram cadastradas no sistema.', mtInformation, [mbOk], 0);
      EnableButtons(Self, '0000001');
    end
    else
    begin
      for I := 0 to ListaGravadoras.Count -1 do
      begin
        Gravadora := ListaGravadoras[I];
        cbGravadora.Items.Add(Gravadora.Nome);
      end;
      cbGravadora.ItemIndex := -1;
    end;
  finally
    if Assigned(ListaGravadoras) then ListaGravadoras.Free;
  end;
end;

procedure TfrmAlbuns.btnAtualizarClick(Sender: TObject);
begin
  inherited;
   EnableComponentsByTag(Self, '0101111111101');
   edtNome.SetFocus;
end;

procedure TfrmAlbuns.btnIncluirClick(Sender: TObject);
begin
  inherited;
  pnlCampos.Enabled := True;
  EnableComponentsByTag(Self, '0101111111101');
  edtNome.SetFocus;
end;

procedure TfrmAlbuns.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '1100000000010');
end;

procedure TfrmAlbuns.btnSalvarClick(Sender: TObject);
var
  AlbumController: TAlbumController;
  Album: TAlbum;
begin
  AlbumController := TAlbumController.Create;
  try
    try
      case OpBD of
        1: begin
          Album := TAlbum.Create(
            edtNome.Text,
            cbArtista.Text,
            cbEstilo.Text,
            cbProdutor.Text,
            cbGravadora.Text,
            cbMidia.ItemIndex,
            edtCatalogo.Text,
            dtLancamento.Date,
            dtAquisicao.Date,
            imgCapa.Picture.Bitmap
          );
          if AlbumController.InserirAlbum(Album) then
            MessageDlg('�lbum inserido com sucesso.', mtInformation, [mbOk], 0);
        end;
        2: begin
          Album := TAlbum.Create(
            StrToInt(edtID.Text),
            edtNome.Text,
            cbArtista.Text,
            cbEstilo.Text,
            cbProdutor.Text,
            cbGravadora.Text,
            cbMidia.ItemIndex,
            edtCatalogo.Text,
            dtLancamento.Date,
            dtAquisicao.Date,
            imgCapa.Picture.Bitmap
          );
          if AlbumController.AtualizarAlbum(Album) then
            MessageDlg('�lbum atualizado com sucesso.', mtInformation, [mbOk], 0);
        end;
      end;
    finally
      Album.Free; // Garante que o �lbum ser� liberado
    end;
  finally
    AlbumController.Free; // Garante que o controlador ser� liberado
  end;

  inherited;
end;

procedure TfrmAlbuns.btnUpArtistaClick(Sender: TObject);
var
  Botao: TBitBtn;
begin
  if Sender is TBitBtn then
  begin
    Botao := TBitBtn(Sender);

    case Botao.Tag of
      -1: CarregaCbArtista;
      -2: CarregaCbEstilo;
      -3: CarregaCbProdutor;
      -4: CarregaCbGravadora;
    end;
  end;
end;

procedure TfrmAlbuns.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if pnlCampos.Enabled then
    // Verifica se CTRL+V foi pressionado
    if (Key = Ord('V')) and (ssCtrl in Shift) then
    begin
      // Verifica se a �rea de transfer�ncia cont�m uma imagem
      if Clipboard.HasFormat(CF_BITMAP) then
      begin
        // Atribui a imagem do Clipboard ao TImage
        imgCapa.Picture.Bitmap.Assign(Clipboard);
      end
      else
        ShowMessage('A �rea de transfer�ncia n�o cont�m uma imagem.');

      // Evita o processamento adicional da tecla
      Key := 0;
    end;
end;

procedure TfrmAlbuns.edtIDKeyPress(Sender: TObject; var Key: Char);
var
  AlbumID: Integer;
  AlbumController: TAlbumController;
  Album: TAlbum;
  EditComponent: TEdit;
begin
  if Key = #13 then
  begin
    EditComponent := TEdit(Sender);
    if EditComponent = edtID then
      if not TryStrToInt(edtId.Text, AlbumID) then
      begin
        MessageDlg('O ID informado � inv�lido. Tente novamente', mtInformation, [mbOk], 0);
        edtId.SetFocus;
        Exit;
      end;

    AlbumController := TAlbumController.Create;
    try
      if EditComponent = edtId then
        Album := AlbumController.LocalizarAlbumPorID(AlbumID)
      else
        Album := AlbumController.LocalizarAlbumPorNome(edtNome.Text);

      if Assigned(Album) then
      begin
        if Album.ID > 0 then edtID.Text := IntToStr(Album.ID);
        edtNome.Text := Album.Nome;
        cbArtista.ItemIndex := cbArtista.Items.IndexOf(Album.Artista);
        cbEstilo.ItemIndex := cbEstilo.Items.IndexOf(Album.Estilo);
        cbProdutor.ItemIndex := cbProdutor.Items.IndexOf(Album.Produtor);
        cbGravadora.ItemIndex := cbGravadora.Items.IndexOf(Album.Gravadora);
        cbMidia.ItemIndex := Album.Midia;
        dtLancamento.Date := Album.Lancamento;
        dtAquisicao.Date := Album.Aquisicao;
        edtCatalogo.Text := Album.Catalogo;
        edtNumSerie.Text := Album.NumSerie;

        // Verifica se a capa existe antes de atribuir
        if Assigned(Album.Capa) and not Album.Capa.Empty then
          imgCapa.Picture.Bitmap.Assign(Album.Capa)
        else
          imgCapa.Picture := nil; // Limpa a imagem se n�o houver capa

        EnableButtons(Self, '1110100');
      end
      else
        MessageDlg('�lbum n�o encontrado.', mtInformation, [mbOk], 0);
    finally
      AlbumController.Free; // Album ser� liberado pelo controller
    end;
  end;
end;

end.
