unit Artistas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TOperacao = (opShow, opNovo, opAtualizar, opSalvar, opBuscar, opCancelar, opProcurar);
type
  TForm1 = class(TForm)
    PnlCampos: TPanel;
    EdtID: TEdit;
    EdtNome: TEdit;
    ChkStatus: TCheckBox;
    LblID: TLabel;
    LblNome: TLabel;
    btnNovo: TButton;
    btnBuscar: TButton;
    btnEncontrar: TSpeedButton;
    btnAtualizar: TButton;
    btnCancel: TButton;
    btnSave: TButton;
    btnSair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnEncontrarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure LigaDesliga(Operacao: TOperacao);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  OpBD: Integer;

implementation

{$R *.dfm}

uses UArtistas, UArtistasDAO, UArtistasController;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LigaDesliga(opShow);
end;

procedure TForm1.btnAtualizarClick(Sender: TObject);
begin
  LigaDesliga(opAtualizar);
  OpBD := 2;
  edtNome.SetFocus
end;

procedure TForm1.btnNovoClick(Sender: TObject);
begin
  LigaDesliga(opNovo);
  OpBD := 1;
  EdtNome.SetFocus;
end;

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  LigaDesliga(opShow);
end;

procedure TForm1.btnBuscarClick(Sender: TObject);
begin
   LigaDesliga(opBuscar);
   edtID.SetFocus;
end;

procedure TForm1.btnEncontrarClick(Sender: TObject);
var
  Artista: TArtista;
  ArtistaController: TArtistasController;
  ArtistaID, Estado: Integer;
begin
  // Verificar se o valor do ID � v�lido (n�mero)
  if not TryStrToInt(edtID.Text, ArtistaID) then
  begin
    MessageDlg('Por favor, insira um ID v�lido.', mtWarning, [mbOk], 0);
    edtId.SetFocus;
    Exit;
  end;

  // Criar o controller
  ArtistaController := TArtistasController.Create;
  try
    // Buscar o artista pelo ID
    Artista := ArtistaController.BuscarArtista(ArtistaID);

    // Preencher os campos visuais se o artista for encontrado
    if Assigned(Artista) then
    begin
      edtNome.Text := Artista.Artista;
      Estado := Artista.Status;
      If Estado = 1 then ChkStatus.Checked := True else ChkStatus.Checked := False;
      btnAtualizar.Enabled := True;
    end
    else
    begin
      MessageDlg('Artista n�o encontrado', mtInformation, [mbOk], 0);
    end;
  finally
    Artista.Free;
    ArtistaController.Free;
  end;
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  // Self.Release;
  Application.Terminate;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var
  Artista: TArtista;
  DAO: TArtistasDAO;
  Estado: Integer;
begin
  if ChkStatus.Checked then Estado := 1 else Estado := 0;

  Artista := TArtista.Create(edtNome.Text, Estado);
  DAO := TArtistasDAO.Create;

  case OpBD of
    1: begin
      try
        DAO.Inserir(Artista);
      finally
        DAO.Free;
      end;
    end;
    2: begin
      try
        DAO.Atualizar(Artista);
      finally
        DAO.Free;
      end;
    end;
  end;


  //LigaDesliga(0);
end;

procedure TForm1.LigaDesliga(Operacao: TOperacao);
begin
  case Operacao of
    opShow: begin // create, save, cancel
      edtId.Text := '';
      edtNome.Text := '';

      btnNovo.Enabled      := True;
      btnAtualizar.Enabled := False;
      btnSave.Enabled      := False;
      btnBuscar.Enabled    := True;
      btnCancel.Enabled    := False;
      btnSair.Enabled      := True;
      pnlCampos.Enabled    := False;
      edtId.Enabled        := False;
      btnEncontrar.Enabled := False;
      edtNome.Enabled      := False;
      chkStatus.Enabled    := False;
    end;
    opNovo: begin
      edtId.Text := '';
      edtNome.Text := '';

      btnNovo.Enabled      := False;
      btnAtualizar.Enabled := False;
      btnSave.Enabled      := True;
      btnBuscar.Enabled    := False;
      btnCancel.Enabled    := True;
      btnSair.Enabled      := False;
      pnlCampos.Enabled    := True;
      edtId.Enabled        := False;
      btnEncontrar.Enabled := False;
      edtNome.Enabled      := True;
      chkStatus.Enabled    := True;
    end;
    opBuscar: begin
      btnNovo.Enabled      := False;
      btnAtualizar.Enabled := False;
      btnSave.Enabled      := True;
      btnBuscar.Enabled    := False;
      btnCancel.Enabled    := True;
      btnSair.Enabled      := False;
      pnlCampos.Enabled    := True;
      edtId.Enabled        := True;
      btnEncontrar.Enabled := True;
      edtNome.Enabled      := False;
      chkStatus.Enabled    := False;
    end;
    opAtualizar: begin
      btnNovo.Enabled      := False;
      btnAtualizar.Enabled := False;
      btnSave.Enabled      := True;
      btnBuscar.Enabled    := False;
      btnCancel.Enabled    := True;
      btnSair.Enabled      := False;
      pnlCampos.Enabled    := True;
      edtId.Enabled        := False;
      btnEncontrar.Enabled := False;
      edtNome.Enabled      := True;
      chkStatus.Enabled    := True;
    end;
  end;
end;

end.