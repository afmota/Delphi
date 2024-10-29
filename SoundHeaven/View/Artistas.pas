unit Artistas;

interface

uses
  Winapi.Windows, Model, Vcl.StdCtrls, Generics.Collections, Vcl.Controls,
  Vcl.ButtonStylesAttributes, Dialogs,Vcl.StyledButton, System.Classes,
  Vcl.ExtCtrls, System.SysUtils;

type
  TfrmArtistas = class(TfrmModel)
    cbEstilo: TComboBox;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    //procedure btnExcluirClick(Sender: TObject);
    //procedure btnPesquisarClick(Sender: TObject);
    //procedure edtIDKeyPress(Sender: TObject; var Key: Char);
    //procedure btnAtualizarClick(Sender: TObject);
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

  // Limpa a ComboBox
  cbEstilo.Items.Clear;

  try
    // Obt�m a lista de estilos via Controller
    EstiloController := TEstiloController.Create;
    ListaEstilos := EstiloController.ListarEstilos;

    if not Assigned(ListaEstilos) then
    begin
      MessageDlg('Estilos musicais ainda n�o foram cadastrados no sistema.',
        mtInformation, [mbOk], 0);
      EnableButtons(Self, '0000001');
    end
    else
    begin
      // Adiciona cada estilo ao combobox
      for i := 0 to ListaEstilos.Count -1 do
      begin
        Estilo := ListaEstilos[i];
        cbEstilo.Items.Add(Estilo.Nome); // Preenche com o nome do estilo
      end;
      cbEstilo.ItemIndex := -1;
    end;
  finally
    if Assigned(ListaEstilos) then
    begin
      ListaEstilos.Free;
      EstiloController.Free;
      Estilo.Free;
    end;
  end;
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
begin
  ArtistaController := TArtistaController.Create;

  case OpBD of
    1: begin
      try
        Artista := TArtista.Create(edtNome.Text, cbEstilo.Text, 'T', Now, 0);
        if ArtistaController.InserirArtista(Artista) then
          MessageDlg('Registro gravado com sucesso.', mtInformation, [mbOk], 0);
      finally
        ArtistaController.Free;
      end;
    end;
    2: begin
      try
        Artista := TArtista.Create(edtNome.Text, cbEstilo.Text, 'T', 0, Now);
        Artista.Id := StrToInt(edtId.Text);
         if ArtistaController.AtualizarArtista(Artista) then
           MessageDlg('Registro atualizado com sucesso.', mtInformation, [mbOk], 0);
      finally
        ArtistaController.Free;
      end;
    end;
  end;
  inherited;
end;

{procedure TfrmArtistas.btnExcluirClick(Sender: TObject);
var
  ArtistaController: TArtistaController;
begin
  inherited;
  ArtistaController := TArtistaController.Create;

  try
    ArtistaController.ExcluirArtista(StrToInt(edtId.Text));
    MessageDlg('Registro exclu�do com sucesso.', mtInformation, [mbOk], 0);
  finally
    ArtistaController.Free;
  end;
end;

procedure TfrmArtistas.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  //EnableComponentsByTag(Self, '100');
  //edtId.SetFocus;
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
        btnExcluir.Enabled := True;
        btnAtualizar.Enabled := True;
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
  {EnableComponentsByTag(Self, '011');
  edtNome.SetFocus;
end;}

end.