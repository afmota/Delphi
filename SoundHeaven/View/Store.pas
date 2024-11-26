unit Store;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.StyledButton, Vcl.ExtCtrls;

type
  TfrmStore = class(TfrmModel)
    Label3: TLabel;
    edtArtista: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
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
  Store: TStore;
begin
  inherited;

  Store := TStore.Create(StrToInt(edtId.Text));
  StoreController := TStoreController.Create;

  try
    if StoreController.ExcluirEntradaStore(Store) then
      MessageDlg('Registro exclu�do com sucesso.', mtInformation, [mbOk], 0);
  finally
    StoreController.Free;
    Store.Free;
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
          Now);
        if StoreController.InserirEntradaStore(Store) = True then
          MessageDlg('Registro inserido com sucesso.', mtInformation, [mbOk], 0);
      end;
      2: begin
        Store := TStore.Create(
          edtNome.Text,
          edtArtista.Text,
          0);
        Store.ID := StrToInt(edtId.Text);
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
        MessageDlg('O ID informado � inv�lido. Tente novamente.', mtInformation, [mbOk], 0);
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
        end;
      end
      else
      if EditComponent = edtArtista then
      begin
        Store := StoreController.LocalizarEntradaStorePorNome(edtNome.Text);
        if Assigned(Store) then
        begin
          edtId.Text := IntToStr(Store.ID);
          edtNome.Text := Store.Titulo;
          edtArtista.Text := Store.Artista;
        end;
      end;
    finally
      StoreController.Free;
      Store.Free;
    end;
  end;
end;

end.