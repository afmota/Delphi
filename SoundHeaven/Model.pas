unit Model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TfrmModel = class(TForm)
    pnlBotoes: TPanel;
    pnlCampos: TPanel;
    btnNovo: TButton;
    btnPesquisar: TButton;
    btnAtualizar: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnSair: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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

procedure TfrmModel.btnNovoClick(Sender: TObject);
begin
  EnableButtons(Self, '000110');
  CleanFields(Self);
  pnlCampos.Enabled := True;
  OpBD := 1;
end;

procedure TfrmModel.btnPesquisarClick(Sender: TObject);
begin
  EnableButtons(Self, '000100');
  CleanFields(Self);
  pnlCampos.Enabled := True;
end;

procedure TfrmModel.btnAtualizarClick(Sender: TObject);
begin
  EnableButtons(Self, '000110');
end;

procedure TfrmModel.btnCancelarClick(Sender: TObject);
begin
  EnableButtons(Self, '110001');
  CleanFields(Self);
  pnlCampos.Enabled := False;
end;

procedure TfrmModel.btnSalvarClick(Sender: TObject);
begin
  EnableButtons(Self, '110001');
  pnlCampos.Enabled := False;
  OpBD := 2;
  CleanFields(Self);
end;

procedure TfrmModel.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmModel.FormShow(Sender: TObject);
begin
  EnableButtons(Self, '110001');
  CleanFields(Self);
  pnlCampos.Enabled := False;
end;

end.
