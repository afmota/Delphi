unit Artistas;

interface

uses
  Winapi.Windows, Model, Vcl.StdCtrls, Generics.Collections, Vcl.Controls,
  Vcl.ButtonStylesAttributes, Dialogs,Vcl.StyledButton, System.Classes,
  Vcl.ExtCtrls, System.SysUtils, Vcl.Forms, Vcl.Buttons;

type
  TfrmArtistas = class(TfrmModel)
    cbEstilo: TComboBox;
    Label3: TLabel;
    btnUpEstilo: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
    procedure CarregaCbEstilo;
    procedure btnUpEstiloClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArtistas: TfrmArtistas;

implementation

{$R *.dfm}

uses ComponentHelper, UEstiloController, UEstilo, UArtista, UArtistaController;

procedure TfrmArtistas.FormShow(Sender: TObject);
var
  EstiloController: TEstiloController;
  ListaEstilos: TList<TEstilo>;
  Estilo: TEstilo;
  i: Integer;
begin
  inherited;

  CarregaCbEstilo;
end;

procedure TfrmArtistas.btnIncluirClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '011');
  edtNome.SetFocus;
end;

procedure TfrmArtistas.btnSalvarClick(Sender: TObject);
var
  ArtistaController: TArtistaController;
  Artista: TArtista;
  ArtistaID: Integer;
begin
  ArtistaController := TArtistaController.Create;

  case OpBD of
    1: begin
      try
        Artista := TArtista.Create(edtNome.Text, cbEstilo.Text);
        if ArtistaController.InserirArtista(Artista) then
          MessageDlg('Registro gravado com sucesso.', mtInformation, [mbOk], 0);
      finally
        ArtistaController.Free;
      end;
    end;
    2: begin
      try
        if TryStrToInt(edtID.Text, ArtistaID) then
        begin
          Artista := TArtista.Create(ArtistaID, edtNome.Text, cbEstilo.Text);
           if ArtistaController.AtualizarArtista(Artista) then
             MessageDlg('Registro atualizado com sucesso.', mtInformation, [mbOk], 0);
        end;
      finally
        ArtistaController.Free;
      end;
    end;
  end;
  inherited;
end;

procedure TfrmArtistas.btnUpEstiloClick(Sender: TObject);
begin
  inherited;
  CarregaCbEstilo;
end;

procedure TfrmArtistas.btnExcluirClick(Sender: TObject);
var
  Artista: TArtista;
  ArtistaController: TArtistaController;
begin
  inherited;

  Artista := TArtista.Create(StrToInt(edtID.Text));
  ArtistaController := TArtistaController.Create;

  try
    if ArtistaController.ExcluirArtista(Artista) then
      MessageDlg('Registro exclu�do com sucesso.', mtInformation, [mbOk], 0);
  finally
    ArtistaController.Free;
    Artista.Free;
  end;

  EnableButtons(Self, '1000011');
  pnlCampos.Enabled := False;
  CleanFields(Self);
end;

procedure TfrmArtistas.btnLocalizarClick(Sender: TObject);
begin
  inherited;

  EnableComponentsByTag(Self, '100');
  edtId.SetFocus;
end;

procedure TfrmArtistas.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '011');
  edtNome.SetFocus;
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
      MessageDlg(
        'O ID informado � inv�lido. Tente novamente', mtInformation, [mbOk], 0);
      edtId.SetFocus;
      Exit;
    end;

    // Cria o controller
    ArtistaController := TArtistaController.Create;
    try
      // Buscar o artista pelo ID
      Artista :=  ArtistaController.LocalizarArtista(ArtistaID);

      // Preencher os campos visuais se o artista for encontrado
      if Assigned(Artista) then
      begin
        edtNome.Text := Artista.Nome;
        cbEstilo.ItemIndex := cbEstilo.Items.IndexOf(Artista.Estilo);
        btnExcluir.Enabled := True;
        btnAtualizar.Enabled := True;
      end
      else
        MessageDlg('Artista n�o encontrado.', mtInformation, [mbOk], 0);
    finally
      Artista.Free;
      ArtistaController.Free;
    end;
  end;
end;

procedure TfrmArtistas.CarregaCbEstilo;
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
end.
