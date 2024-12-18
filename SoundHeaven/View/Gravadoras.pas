unit Gravadoras;

interface

uses Model, Vcl.ButtonStylesAttributes, Vcl.StdCtrls, Vcl.Controls, Dialogs,
  Vcl.StyledButton, System.Classes, Vcl.ExtCtrls, SysUtils;

type
  TfrmGravadoras = class(TfrmModel)
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGravadoras: TfrmGravadoras;

implementation

{$R *.dfm}

uses ComponentHelper, UGravadora, UGravadoraController;

procedure TfrmGravadoras.btnIncluirClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

procedure TfrmGravadoras.btnExcluirClick(Sender: TObject);
var
  Gravadora: TGravadora;
  GravadoraController: TGravadoraController;
begin
  Inherited;

  Gravadora := TGravadora.Create(StrToInt(edtId.Text));
  GravadoraController := TGravadoraController.Create;

  try
    if GravadoraController.ExcluirGravadora(Gravadora) then
      MessageDlg('Registro exclu�do com sucesso.', mtInformation, [mbOk], 0);
  finally
    GravadoraController.Free;
    Gravadora.Free;
  end;
end;

procedure TfrmGravadoras.btnAtualizarClick(Sender: TObject);
begin
  inherited;
    EnableComponentsByTag(Self, '01');
    edtNome.SetFocus;
end;

procedure TfrmGravadoras.btnSalvarClick(Sender: TObject);
var
  GravadoraController: TGravadoraController;
  Gravadora: TGravadora;
begin
  inherited;
    GravadoraController := TGravadoraController.Create;

    case OpBD of
      1: begin
        try
          Gravadora := TGravadora.Create(edtNome.Text);
          if GravadoraController.InserirGravadora(Gravadora) then
            MessageDlg('Registro gravado com sucesso.', mtInformation, [mbOk], 0);
        finally
          GravadoraController.Free;
          Gravadora.Free;
        end;
      end;
      2: begin
        try
          Gravadora := TGravadora.Create(StrToInt(edtID.Text), edtNome.Text);
          if GravadoraController.AtualizarGravadora(Gravadora) then
            MessageDlg('Registro atualizado com sucesso.', mtInformation, [mbOk], 0);
        finally
          GravadoraController.Free;
          Gravadora.Free;
        end;
      end;
    end;
end;

procedure TfrmGravadoras.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '10');
  edtId.SetFocus;
end;

procedure TfrmGravadoras.edtNomeChange(Sender: TObject);
begin
  inherited;
  if edtID.Text <> '' then
    btnAtualizar.Enabled := True;
end;

procedure TfrmGravadoras.edtIDKeyPress(Sender: TObject; var Key: Char);
var
  GravadoraID: Integer;
  GravadoraController: TGravadoraController;
  Gravadora: TGravadora;
begin
  inherited;
  if Key = #13 then
  begin
    // Valida se o n�mero digitado no campo � v�lido
    if not TryStrToInt(edtId.Text, GravadoraID) then
    begin
      MessageDlg('O ID informado � inv�lido. Tente novamente.', mtInformation, [mbOk], 0);
      edtId.SetFocus;
      Exit;
    end;

    // Cria o controller
    GravadoraController := TGravadoraController.Create;
    try
      // Buscar a gravadora pelo ID
      Gravadora := GravadoraController.LocalizarGravadora(GravadoraID);

      // Preencher os campos visuais se a gravadora for encontrada
      if Assigned(Gravadora) then
      begin
        edtNome.Text := Gravadora.Nome;
        EnableButtons(Self, '0110100');
      end
      else
        MessageDlg('Gravadora n�o encontrada.', mtInformation, [mbOk], 0);
    finally
        Gravadora.Free;
        GravadoraController.Free;
    end;
  end;
end;

end.
