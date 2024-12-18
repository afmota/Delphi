unit ComponentHelper;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, System.SysUtils,
    Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.StyledButton; // Importa as unidades necess�rias

// Declara o procedimento para ativar/desativar componentes com base em uma string de 0s e 1s
procedure EnableComponentsByTag(AForm: TForm; const States: string);
procedure CleanFields(Form: TForm);
procedure EnableButtons(Form: TForm; States: string);

implementation

procedure EnableComponentsByTag(AForm: TForm; const States: string);
var
  i, TagIndex: Integer;
begin
  TagIndex := 1; // Inicia na primeira posi��o da string
  for i := 0 to AForm.ComponentCount - 1 do
  begin
    // Verifica se o componente � um controle visual e se o Tag � maior que zero
    if (AForm.Components[i] is TControl) and ((AForm.Components[i] as TControl).Tag > 0) then
    begin
      // Verifica se ainda h� caracteres na string States
      if TagIndex <= Length(States) then
      begin
        // Habilita ou desabilita com base no caractere da string (1 = habilitar, 0 = desabilitar)
        (AForm.Components[i] as TControl).Enabled := States[TagIndex] = '1';
        Inc(TagIndex); // Move para o pr�ximo caractere da string
      end
      else
        Break; // Sai se a string de estados for menor que o n�mero de componentes
    end;
  end;
end;

 procedure CleanFields(Form: TForm);
 var
   i: integer;
 begin
   for i := 0 to Form.ComponentCount -1 do
   begin
     if Form.Components[i] is TEdit then
       TEdit(Form.Components[i]).Text := '';
     if Form.Components[i] is TComboBox then
       TComboBox(Form.Components[i]).ItemIndex := -1;
     if Form.Components[i] is TMemo then
       TComboBox(Form.Components[i]).Clear;
     if Form.Components[i] is TMaskEdit then
       TMaskEdit(Form.Components[i]).Text := '';
     if Form.Components[i] is TMemo then
       TMemo(Form.Components[i]).Lines.Clear;
     if Form.Components[i] is TDateTimePicker then
       TDateTimePicker(Form.Components[i]).Date := Now;
     if Form.Components[i] is TImage then
       TImage(Form.Components[i]).Picture := nil;
   end;
 end;

procedure EnableButtons(Form: TForm; States: string);
var
  Buttons: array [1..7] of TStyledButton;
  i: Integer;
  state: Boolean;
begin
  // Busca os bot�es pelo nome no formul�rio passado como par�metro
  Buttons[1] := Form.FindComponent('btnIncluir') as TStyledButton;
  Buttons[2] := Form.FindComponent('btnExcluir') as TStyledButton;
  Buttons[3] := Form.FindComponent('btnAtualizar') as TStyledButton;
  Buttons[4] := Form.FindComponent('btnSalvar') as TStyledButton;
  Buttons[5] := Form.FindComponent('btnCancelar') as TStyledButton;
  Buttons[6] := Form.FindComponent('btnLocalizar') as TStyledButton;
  Buttons[7] := Form.FindComponent('btnSair') as TStyledButton;

  for i := 1 to 7 do
  begin
    if (States[i] = '1') then
      state := True
    else
      state := False;

    if Assigned(Buttons[i]) then // Verifica se o bot�o foi encontrado no formul�rio
    begin
      Buttons[i].Enabled := state;
    end;
  end;
end;

end.

