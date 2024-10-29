unit Gravadoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ButtonStylesAttributes, System.ImageList, Vcl.ImgList, Vcl.StyledButton;

type
  TfrmGravadoras = class(TfrmModel)
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
  frmGravadoras: TfrmGravadoras;

implementation

{$R *.dfm}

uses ComponentHelper, FuncoesDivs, UGravadoraController, UGravadora;

procedure TfrmGravadoras.btnNovoClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '011');
  edtNome.SetFocus;
end;

procedure TfrmGravadoras.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '100');
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
    // Valida se o número digitado no campo é válido
    if not TryStrToInt(edtId.Text, GravadoraID) then
    begin
      Mensagem('O ID informado é inválido. Tente novamente.', 0);
      Exit;
    end;

    // Cria o controller
    GravadoraController := TGravadoraController.Create;
    try
      // Buscar a gravadora pelo ID
      Gravadora := GravadoraController.BuscarGravadora(GravadoraID);

      // Preencher os campos visuais se a gravadora for encontrada
      if Assigned(Gravadora) then
      begin
        edtNome.Text := Gravadora.Nome;
        chkStatus.Checked := Estado(Gravadora.Status);
      end
      else
        Mensagem('Gravadora não encontrada.', 0);
    finally
        Gravadora.Free;
        GravadoraController.Free;
    end;
  end;
end;

procedure TfrmGravadoras.btnAtualizarClick(Sender: TObject);
begin
  inherited;
    EnableComponentsByTag(Self, '011');
    edtNome.SetFocus;
end;

procedure TfrmGravadoras.btnSalvarClick(Sender: TObject);
var
  Gravadora: TGravadora;
  GravadoraController: TGravadoraController;
begin
  inherited;
  if edtNome.Text <> '' then
  begin
    Gravadora := TGravadora.Create(edtNome.Text, Estado(chkStatus.Checked));
    if edtId.Text <> '' then Gravadora.ID := StrToInt(edtId.Text);
    GravadoraController := TGravadoraController.Create;

    case OpBD of
      1: begin
        try
          GravadoraController.InserirGravadora(Gravadora.Nome);
          Mensagem('Registro gravado com sucesso.', 0);
        finally
          GravadoraController.Free;
          Gravadora.Free;
        end;
      end;
      2: begin
        try
          GravadoraController.AtualizarGravadora(Gravadora.ID, Gravadora.Nome, Gravadora.Status);
          Mensagem('Registro atualizado com sucesso.', 0);
        finally
          GravadoraController.Free;
          Gravadora.Free;
        end;
      end;
    end;
  end
  else
  begin
    Mensagem('O campo Nome deve ser preenchido.', 0);
    edtNome.SetFocus;
  end;
end;

end.
