unit Store;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model,
  Vcl.ButtonStylesAttributes, Vcl.StdCtrls, Vcl.StyledButton, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Grids, System.Generics.Collections, System.ImageList,
  Vcl.ImgList;

type
  TfrmStore = class(TfrmModel)
    Label3: TLabel;
    edtArtista: TEdit;
    dtpDataLancamento: TDateTimePicker;
    Label4: TLabel;
    StringGrid: TStringGrid;
    ImageList: TImageList;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
    procedure PreencherStringGrid;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure StringGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStore: TfrmStore;

implementation

{$R *.dfm}

uses ComponentHelper, UStoreController, UStore;

procedure TfrmStore.btnIncluirClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

procedure TfrmStore.btnExcluirClick(Sender: TObject);
var
  StoreController: TStoreController;
  StoreID: Integer;
begin
  inherited;

  StoreID := StrToInt(edtId.Text);
  StoreController := TStoreController.Create;

  try
    if StoreController.ExcluirEntradaStore(StoreID) then
      MessageDlg('Registro excluído com sucesso.', mtInformation, [mbOk], 0);
  finally
    StoreController.Free;
  end;

  EnableButtons(Self, '1000011');
  pnlCampos.Enabled := False;
  CleanFields(Self);
end;

procedure TfrmStore.btnAtualizarClick(Sender: TObject);
begin
  inherited;

  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

procedure TfrmStore.btnSalvarClick(Sender: TObject);
var
  StoreController: TStoreController;
  Store: TStore;
begin
  inherited;

  StoreController := TStoreController.Create;
  try
    case OpBD of
      1: begin
        Store := TStore.Create(
          edtNome.Text,
          edtArtista.Text,
          dtpDataLancamento.Date);
        if StoreController.InserirEntradaStore(Store) = True then
          MessageDlg('Registro inserido com sucesso.', mtInformation, [mbOk], 0);
      end;
      2: begin
        Store := TStore.Create(
          StrToInt(edtId.Text),
          edtNome.Text,
          edtArtista.Text,
          dtpDataLancamento.Date);
        if StoreController.AtualizarEntradaStore(Store) = True then
          MessageDlg('Registro atualizado com sucesso.', mtInformation, [mbOk], 0);
      end;
    end;
  finally
    Store.Free;
    StoreController.Free;
  end;
end;

procedure TfrmStore.btnLocalizarClick(Sender: TObject);
begin
  inherited;

  EnableComponentsByTag(Self,'1100000000010');
  edtID.SetFocus;
end;

procedure TfrmStore.edtIDKeyPress(Sender: TObject; var Key: Char);
var
  EditComponent: TEdit;
  StoreID: Integer;
  StoreController: TStoreController;
  Store: TStore;
begin
  inherited;

  if Key = #013 then
  begin
    EditComponent := TEdit(Sender);
    if EditComponent = edtID then
      if not TryStrToInt(edtId.Text, StoreID) then
      begin
        MessageDlg('O ID informado é inválido. Tente novamente.', mtInformation, [mbOk], 0);
        edtId.SetFocus;
        Exit;
      end;

    StoreController := TStoreController.Create;
    try
      if EditComponent = edtId then
      begin
        Store := StoreController.LocalizarEntradaStorePorID(StoreID);
        if Assigned(Store) then
        begin
          edtNome.Text := Store.Titulo;
          edtArtista.Text := Store.Artista;
          dtpDataLancamento.Date := Store.DataLancamento;
          EnableButtons(Self, '0110100');
        end;
      end
      else
      if EditComponent = edtNome then
      begin
        Store := StoreController.LocalizarEntradaStorePorNome(edtNome.Text);
        if Assigned(Store) then
        begin
          edtId.Text := IntToStr(Store.ID);
          edtNome.Text := Store.Titulo;
          edtArtista.Text := Store.Artista;
          dtpDataLancamento.Date := Store.DataLancamento;
          EnableButtons(Self, '0110100');
        end;
      end;
    finally
      StoreController.Free;
      Store.Free;
    end;
  end;
end;

procedure TfrmStore.FormCreate(Sender: TObject);
begin
  inherited;

  //StringGrid.FixedColor := clGray;
  StringGrid.Color := clWhite;
  //StringGrid.Font.Color := clBlack;
  StringGrid.GridLineWidth := 1;
  StringGrid.Options := StringGrid.Options + [goRowSelect]; // Destaca linha inteira


end;

procedure TfrmStore.FormResize(Sender: TObject);
begin
  inherited;
  StringGrid.Left := (Self.ClientWidth - StringGrid.Width) div 2;
end;

procedure TfrmStore.FormShow(Sender: TObject);
begin
  inherited;
  PreencherStringGrid;
end;

procedure TfrmStore.PreencherStringGrid;
var
  I: Integer;
  Store: TStore;
  StoreController: TStoreController;
  StoreList: TList<TStore>;
begin
  StringGrid.Left := pnlCampos.Left;

  // Obter os dados através do Controller
  StoreController := TStoreController.Create;
  StoreList := StoreController.StoreListarEntradas;

  try
    StringGrid.ColWidths[0] := 50;
    StringGrid.ColWidths[1] := 340;
    StringGrid.ColWidths[2] := 230;
    StringGrid.ColWidths[3] := 170;
    //StringGrid.ColWidths[4] := 120;
    StringGrid.DefaultRowHeight := 30;

    // Configurar o TStringGrid
    StringGrid.RowCount := StoreList.Count + 1; // +1 para o cabeçalho
    StringGrid.ColCount := 4;
    StringGrid.FixedRows := 1;

    // Configurar cabeçalhos
    StringGrid.Cells[0, 0] := 'ID';
    StringGrid.Cells[1, 0] := 'Título';
    StringGrid.Cells[2, 0] := 'Artista';
    StringGrid.Cells[3, 0] := 'Data de Lançamento';
    //StringGrid.Cells[4, 0] := 'Ações';

    // Adicionar os dados à grid
    for I := 0 to StoreList.Count -1 do
    begin
      Store := StoreList[I];
      StringGrid.Cells[0, I + 1] := IntToStr(Store.ID);
      StringGrid.Cells[1, I + 1] := Store.Titulo;
      StringGrid.Cells[2, I + 1] := Store.Artista;
      StringGrid.Cells[3, I + 1] := DateToStr(Store.DataLancamento);
    end;
  finally
    StoreList.Free;
  end;
end;

procedure TfrmStore.StringGridDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;

  // destaca os títulos das colunas
  if ARow = 0 then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      Brush.Color := $00FF3535;
      FillRect(Rect); // preenche o fundo da célula

      // define a cor e o estilo da fonte
      Font.Color := clWhite;
      Font.Style := [fsBold];

      // escreve o texto na célula
      TextOut(Rect.Left + 5, Rect.Top + 2, TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end
  else
  begin
    // Mantém o comportamento padrão para as outras linhas
    with TStringGrid(Sender).Canvas do
    begin
      // Define a cor de fundo
      if gdSelected in State then
      begin
        Brush.Color := clGray; // Fundo para célula selecionada
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := TStringGrid(Sender).Color; // Fundo padrão
        // Define a fonte padrão
        Font.Color := $00FF3535; //TStringGrid(Sender).Font.Color;
        Font.Style := TStringGrid(Sender).Font.Style;
      end;

      FillRect(Rect); // Preenche o fundo

      // Escreve o texto
      TextOut(Rect.Left + 5, Rect.Top + 2, TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;

  {if ACol = 4 then // coluna Ações
  begin
    if ARow > 0 then // apenas para dados
    begin
      // ícone de edição
      ImageList.Draw(StringGrid.Canvas, Rect.Left + 5, Rect.Top + 2, 0);

      // ícone de exclusão
      ImageList.Draw(StringGrid.Canvas, Rect.Left + 25, Rect.Top + 2, 1);
    end;
  end;}

end;

procedure TfrmStore.StringGridSelectCell(Sender: TObject; ACol, ARow: LongInt;
  var CanSelect: Boolean);
begin
  inherited;
  if ARow > 0 then // ignora o cabeçalho
  begin
    edtId.Text := StringGrid.Cells[0, ARow];
    edtNome.Text := StringGrid.Cells[1, ARow];
    edtArtista.Text := StringGrid.Cells[2, ARow];
    dtpDataLancamento.Date := StrToDate(StringGrid.Cells[3, ARow]);

    EnableButtons(Self, '0111100');
  end;
end;

end.
