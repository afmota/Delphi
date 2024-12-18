unit Produtores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.StyledButton, Vcl.ExtCtrls;

type
  TfrmProdutores = class(TfrmModel)
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
  frmProdutores: TfrmProdutores;

implementation

{$R *.dfm}

uses ComponentHelper, UProdutor, UProdutorController;

procedure TfrmProdutores.btnIncluirClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

procedure TfrmProdutores.btnExcluirClick(Sender: TObject);
var
  ProdutorController: TProdutorController;
  Produtor: TProdutor;
  ProdutorID: Integer;
begin
  inherited;

  ProdutorID := StrToInt(edtID.Text);
  Produtor := TProdutor.Create(ProdutorID);
  ProdutorController := TProdutorController.Create;

  try
    if ProdutorController.ExcluirProdutor(Produtor) then
      MessageDlg('Registro exclu�do com sucesso.', mtInformation, [mbOk], 0);
  finally
    ProdutorController.Free;
    Produtor.Free;
  end;

  EnableButtons(Self, '1000011');
  pnlCampos.Enabled := False;
  CleanFields(Self);
end;

procedure TfrmProdutores.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

procedure TfrmProdutores.btnSalvarClick(Sender: TObject);
var
  ProdutorController: TProdutorController;
  Produtor: TProdutor;
  ProdutorID: Integer;
begin
  ProdutorController := TProdutorController.Create;

  case OpBD of
    1: begin
      try
        Produtor := TProdutor.Create(edtNome.Text);
        if ProdutorController.InserirProdutor(Produtor) then
          MessageDlg('Produtor gravado com sucesso.', mtInformation, [mbOk], 0);
      finally
        ProdutorController.Free;
        Produtor.Free;
      end;
    end;
    2: begin
      try
        if TryStrToInt(edtId.Text, ProdutorID) then
        begin
          Produtor := TProdutor.Create(ProdutorID, edtNome.Text);
          if ProdutorController.AtualizarProdutor(Produtor) then
            MessageDlg('Produtor atualizado com sucesso.', mtInformation, [mbOk], 0);
        end;
      finally
        ProdutorController.Free;
        Produtor.Free;
      end;
    end;
  end;

  inherited;
end;

procedure TfrmProdutores.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  edtId.SetFocus;
end;

procedure TfrmProdutores.edtIDKeyPress(Sender: TObject; var Key: Char);
var
  ProdutorID: Integer;
  ProdutorController: TProdutorController;
  Produtor: TProdutor;
begin
  inherited;
  if Key = #13 then
  begin
    if not TryStrToInt(edtId.Text, ProdutorID) then
    begin
      MessageDlg('O ID informado � inv�lido. Tente novamente.', mtInformation, [mbOk], 0);
      edtId.SetFocus;
      Exit;
    end;

    ProdutorController := TProdutorController.Create;
    try
      Produtor := ProdutorController.LocalizarProdutor(ProdutorID);
      if Assigned(PRodutor) then
      begin
        edtNome.Text := Produtor.Nome;
        EnableButtons(Self, '0110100');
      end
      else
        MessageDlg('Produtor n�o localizado.', mtInformation, [mbOk], 0);
    finally
      Produtor.Free;
      ProdutorController.Free;
    end;
  end;
end;

end.
