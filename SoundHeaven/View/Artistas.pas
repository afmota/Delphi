unit Artistas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmArtistas = class(TfrmModel)
    Label1: TLabel;
    Label2: TLabel;
    edtID: TEdit;
    edtNome: TEdit;
    chkStatus: TCheckBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArtistas: TfrmArtistas;

implementation

{$R *.dfm}

uses ComponentHelper, FuncoesDivs, UArtistaController, UArtistas;

procedure TfrmArtistas.btnNovoClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '011');
  edtNome.SetFocus;
end;

procedure TfrmArtistas.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '100');
  edtId.SetFocus;
end;

procedure TfrmArtistas.edtNomeChange(Sender: TObject);
begin
  inherited;
  if edtId.Text <> '' then
    btnAtualizar.Enabled := True;
end;

procedure TfrmArtistas.edtIDKeyPress(Sender: TObject; var Key: Char);
var
  ArtistaID: Integer;
  ArtistaController: TArtistaController;
  Artista: TArtista;
begin
  inherited;
  if Key = #13 then
  begin
    // Valida se o n�mero digitado no campo edtID � v�lido
    if not TryStrToInt(edtID.Text, ArtistaID) then
    begin
      Mensagem('O ID informado � inv�lido. Tente novamente', 0);
      edtId.SetFocus;
      Exit;
    end;

    // Cria o controller
    ArtistaController := TArtistaController.Create;
    try
      // Buscar o artista pelo ID
      Artista :=  ArtistaController.BuscarArtista(ArtistaID);

      // Preencher os campos visuais se o artista for encontrado
      if Assigned(Artista) then
      begin
        edtNome.Text := Artista.Nome;
        ChkStatus.Checked := Estado(Artista.Status);
      end
      else
        Mensagem('Artista n�o encontrado.', 0);
    finally
      Artista.Free;
      ArtistaController.Free;
    end;
  end;
end;

procedure TfrmArtistas.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '011');
  edtNome.SetFocus;
end;

procedure TfrmArtistas.btnSalvarClick(Sender: TObject);
var
  Artista: TArtista;
  ArtistaController: TArtistaController;
begin
  if edtNome.Text <> '' then
  begin
    Artista := TArtista.Create(edtNome.Text, Estado(chkStatus.Checked));
    if edtId.Text <> '' then Artista.ID := StrToInt(edtId.Text);
    ArtistaController := TArtistaController.Create;

    case OpBD of
      1: begin
        try
          ArtistaController.AdicionarArtista(Artista.Nome);
          Mensagem('Registro gravado com sucesso.', 0);
        finally
          ArtistaController.Free;
        end;
      end;
      2: begin
        try
          ArtistaController.AtualizarArtista(Artista.ID, Artista.Nome, Artista.Status);
          Mensagem('Registro atualizado com sucesso.', 0);
        finally
          ArtistaController.Free;
        end;
      end;
    end;
    inherited;
  end
  else
  begin
    Mensagem('Nome do artista deve ser preenchido.', 0);
    edtNome.SetFocus;
  end;
end;

end.
