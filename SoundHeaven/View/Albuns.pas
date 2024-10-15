unit Albuns;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmAlbuns = class(TfrmModel)
    Label1: TLabel;
    edtID: TEdit;
    Label2: TLabel;
    edtTitulo: TEdit;
    Label3: TLabel;
    cbxArtista: TComboBox;
    Label4: TLabel;
    dtpLancamento: TDateTimePicker;
    Label5: TLabel;
    dtpAquisicao: TDateTimePicker;
    Label6: TLabel;
    edtProdutor: TEdit;
    Label7: TLabel;
    cbxGravadora: TComboBox;
    Label8: TLabel;
    edtNumeroSerie: TEdit;
    chkStatus: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlbuns: TfrmAlbuns;

implementation

{$R *.dfm}

end.



{
type
  TfrmAlbuns = class(TfrmModel)
    {pnlBotoes: TPanel;
    pnlCampos: TPanel;
    btnNovo: TButton;
    btnBuscar: TButton;
    btnAtualizar: TButton;
    btnSair: TButton;
    btnSalvar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnCancelar: TButton;
    edtID: TEdit;
    btnEncontrar: TSpeedButton;
    edtTitulo: TEdit;
    edtArtista: TEdit;
    datLancamento: TDateTimePicker;
    datAquisicao: TDateTimePicker;
    edtNumSerie: TEdit;
    chkStatus: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnEncontrarClick(Sender: TObject);
    procedure edtTituloChange(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
{  public
    { Public declarations }
{  end;

var
  frmAlbuns: TfrmAlbuns;
  //OpBD: Integer;

{const
  dataErro1 = 'A data de lan�amento n�o pode ser maior que a data de aquisi��o.';
  dataErro2 = 'A data de lan�amento n�o pode ser maior que a data atual.';
  dataErro3 = 'A data de aquisi��o n�o pode ser maior que a data atual.';

implementation

{$R *.dfm}

{uses
  FuncoesDivs
  , ComponentHelper
  , UAlbumController
  , UAlbuns
  , UAlbumDAO
  ;}

{ TfrmAlbuns }

{procedure TfrmAlbuns.FormShow(Sender: TObject);
begin
  EnableButtons('110001');
  pnlCampos.Enabled := False;
  EnableComponentsByTag(Self, '00000000');
  CleanFields(Self);
end;

procedure TfrmAlbuns.btnNovoClick(Sender: TObject);
begin
  EnableButtons('000110');
  pnlCampos.Enabled := True;
  EnableComponentsByTag(Self, '00111101');
  edtTitulo.SetFocus;
  OpBD := 1;
end;

procedure TfrmAlbuns.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAlbuns.edtTituloChange(Sender: TObject);
begin
  if edtID.Text <> '' then
    btnAtualizar.Enabled := True;
end;

procedure TfrmAlbuns.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAlbuns.btnCancelarClick(Sender: TObject);
begin
  EnableButtons('110001');
  pnlcampos.Enabled := False;
  EnableComponentsByTag(Self, '00000000');
  CleanFields(Self);
end;

procedure TfrmAlbuns.btnBuscarClick(Sender: TObject);
begin
  EnableButtons('000100');
  pnlCampos.Enabled := True;
  EnableComponentsByTag(Self, '11000000');
  CleanFields(Self);
  EdtID.SetFocus;
end;

procedure TfrmAlbuns.btnEncontrarClick(Sender: TObject);
var
  AlbumID: Integer;
  AlbumController: TAlbumController;
  Album: TAlbum;
begin
  // Verificar se o valor do ID � v�lido (n�mero)
  if not TryStrToInt(edtId.Text, AlbumID) then
  begin
    Mensagem('ID inv�lido. Tente novamente', 0);
    edtID.SetFocus;
    Exit;
  end;

  // Criar o Controller
  AlbumController := TAlbumController.Create;
  try
    // Busca o album pelo ID
    Album := AlbumController.BuscarAlbum(AlbumID);

    // Preencher os campos visuais se o �lbum for encontrado
    if Assigned(Album) then
    begin
      edtTitulo.Text     := Album.Titulo;
      edtArtista.Text    := Album.Artista;
      datLancamento.Date := Album.DataLancamento;
      datAquisicao.Date  := Album.DataAquisicao;
      edtNumSerie.Text   := Album.NumeroSerie;
      if Album.Status = 1 then chkStatus.Checked := True else chkStatus.Checked := False;
    end
    else
    begin
      MessageDlg('�lbum n�o encontrado.', mtInformation, [mbOk], 0);
      CleanFields(Self);
      btnAtualizar.Enabled := False;
    end;
  finally
    Album.Free;
    AlbumController.Free;
  end;
end;

procedure TfrmAlbuns.btnAtualizarClick(Sender: TObject);
begin
  EnableButtons('0001100');
  pnlCampos.Enabled := True;
  EnableComponentsByTag(Self, '00111101');
  edtTitulo.SetFocus;
  OpBD := 2;
end;

procedure TfrmAlbuns.btnSalvarClick(Sender: TObject);
var
  Album: TAlbum;
  DAO: TAlbumDAO;
  Estado: Integer;
begin
  if chkStatus.Checked = True then Estado := 1 else Estado := 0;
  Album := TAlbum.Create(edtTitulo.Text, edtArtista.Text, datLancamento.Date, datAquisicao.Date, Estado);
  DAO := TAlbumDAO.Create;

  if GreaterDate(datLancamento.Date, datAquisicao.Date) then
  begin
    Mensagem(DataErro1, 0);
    datLancamento.SetFocus;
    Exit;
  end
  else
    if GreaterDate(datLancamento.Date, Now) then
    begin
      Mensagem(DataErro2, 0);
      datLancamento.SetFocus;
      Exit;
    end
    else
      if GreaterDate(datAquisicao.Date, Now) then
      begin
        Mensagem(DataErro3, 0);
        datAquisicao.SetFocus;
        Exit;
      end
      else
      begin
        case OpBD of
          1: begin
            try
              DAO.Inserir(Album);
            finally
              DAO.Free;
            end;
          end;
          2: begin
            DAO.Atualizar(Album);
          end;
        end;
      end;
end;

end.}