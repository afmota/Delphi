﻿unit Estilos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.StyledButton, Vcl.ExtCtrls;

type
  TfrmEstilos = class(TfrmModel)
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
  frmEstilos: TfrmEstilos;

implementation

{$R *.dfm}

uses ComponentHelper, UEstilo, UEstiloController;

procedure TfrmEstilos.btnIncluirClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

procedure TfrmEstilos.btnExcluirClick(Sender: TObject);
var
  Estilo: TEstilo;
  EstiloController: TEstiloController;
  EstiloID: Integer;
begin
  inherited;

  EstiloID := StrToInt(edtID.Text);
  Estilo := TEstilo.Create(EstiloID);
  EstiloController := TEstiloController.Create;

  try
    if EstiloController.ExcluirEstilo(Estilo) then
      MessageDlg('Registro excluído com sucesso.', mtInformation, [mbOk], 0);
  finally
    EstiloController.Free;
    Estilo.Free;
  end;

  EnableButtons(Self, '1000011');
  pnlCampos.Enabled := False;
  CleanFields(Self);
end;

procedure TfrmEstilos.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

procedure TfrmEstilos.btnSalvarClick(Sender: TObject);
var
  EstiloController: TEstiloController;
  Estilo: TEstilo;
  EstiloID: Integer;
begin
    EstiloController := TEstiloController.Create;

    case OpBD of
      1: begin
        try
          Estilo := TEstilo.Create(edtNome.Text);
          if EstiloController.InserirEstilo(Estilo) then
            MessageDlg(
              'Registro gravado com sucesso.', mtInformation, [mbOk], 0);
        finally
          EstiloController.Free;
        end;
      end;
      2: begin
        try
          if TryStrToInt(edtID.Text, EstiloID) then
          begin
            Estilo := TEstilo.Create(EstiloID, edtNome.Text);
            if EstiloController.AtualizarEstilo(Estilo) then
              MessageDlg(
                'Registro atualizado com sucesso.', mtInformation, [mbOk], 0);
          end;
        finally
          EstiloController.Free;
          Estilo.Free;
        end;
      end;
    end;
    inherited;
end;

procedure TfrmEstilos.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  edtID.SetFocus;
end;

procedure TfrmEstilos.edtIDKeyPress(Sender: TObject; var Key: Char);
var
  EstiloID: Integer;
  EstiloController: TEstiloController;
  Estilo: TEstilo;
begin
  inherited;
  if Key = #13 then
  begin
    // Valida se o n�mero digitado em edtID � valido
    if not TryStrToInt(edtID.Text, EstiloID) then
    begin
      MessageDlg(
        'O ID informado � inv�lido. Tente novamente.', mtInformation, [mbOk], 0);
      edtId.SetFocus;
      Exit;
    end;

    // Cria o controller
    EstiloController := TEstiloController.Create;
    try
      // Busca o estilo pelo ID
      Estilo := EstiloController.LocalizarEstilo(EstiloID);

      // Preenche os campos com os dados do objeto
      if Assigned(Estilo) then
      begin
        edtNome.Text := Estilo.Nome;
        EnableButtons(Self, '0110100');
      end
      else
        MessageDlg('Estilo n�o localizado.', mtInformation, [mbOk], 0);
    finally
      Estilo.Free;
      EstiloController.Free;
    end;
  end;
end;

end.
