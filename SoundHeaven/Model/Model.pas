unit Model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TfrmModel = class(TForm)
    pnlBotoes: TPanel;
    pnlCampos: TPanel;
    Label1: TLabel;
    edtID: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    pnlButton: TPanel;
    btnIncluir: TStyledButton;
    btnExcluir: TStyledButton;
    btnAtualizar: TStyledButton;
    btnSalvar: TStyledButton;
    btnCancelar: TStyledButton;
    btnLocalizar: TStyledButton;
    btnSair: TStyledButton;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModel: TfrmModel;
  OpBD: Integer;

implementation

{$R *.dfm}

uses ComponentHelper;

procedure TfrmModel.FormResize(Sender: TObject);
begin
  pnlCampos.Left := (Self.ClientWidth - pnlCampos.Width) div 2;
  pnlButton.Left := (pnlBotoes.ClientWidth - pnlButton.Width) div 2;
end;

procedure TfrmModel.FormShow(Sender: TObject);
begin
  EnableButtons(Self, '1000011');
  pnlCampos.Enabled := False;
  CleanFields(Self);
end;

procedure TfrmModel.btnIncluirClick(Sender: TObject);
begin
  EnableButtons(Self, '0001100');
  CleanFields(Self);
  OpBD := 1;
  pnlCampos.Enabled := True;
end;

procedure TfrmModel.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro atual?' + #13 +
      'Depois de exclu�do, o registro n�o poder� ser recuperado.',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit
end;

procedure TfrmModel.btnAtualizarClick(Sender: TObject);
begin
  EnableButtons(Self, '0001100');
  OpBD := 2;
end;

procedure TfrmModel.btnSalvarClick(Sender: TObject);
begin
  EnableButtons(Self, '1000011');
  pnlCampos.Enabled := False;
end;

procedure TfrmModel.btnCancelarClick(Sender: TObject);
begin
  EnableButtons(Self, '1000011');
  pnlCampos.Enabled := False;
  CleanFields(Self);
end;

procedure TfrmModel.btnLocalizarClick(Sender: TObject);
begin
  EnableButtons(Self, '0000100');
  EnableComponentsByTag(Self, '11');
  CleanFields(Self);
  pnlCampos.Enabled := True;
end;

procedure TfrmModel.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModel.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmModel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
