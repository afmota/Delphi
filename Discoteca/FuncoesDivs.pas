unit FuncoesDivs;

 interface

 uses SysUtils, Forms, Classes, Windows, StdCtrls, Controls, Mask, DateUtils;

 procedure AbreForm(Instancia: TComponentClass; var Referencia; Usuario: string);
 procedure CleanFields(Form: TForm);
 function Mensagem(Texto: string; Tipo: integer): integer;
 function PasswordInputBox(const ACaption, APrompt:string): string;
 function NomeMes(Data: TDateTime): string;

 implementation

 procedure AbreForm(Instancia: TComponentClass; var Referencia; Usuario: string);
 begin
   if Usuario <> '' then
   begin
     if TForm(Referencia) = nil then
       Application.CreateForm(Instancia, Referencia);
     TForm(Referencia).Show;
   end;
 end;

 function Mensagem(Texto: string; Tipo: integer): integer;
 begin
   case Tipo of
     0: result := Application.MessageBox(PChar(Texto), PChar('Atenção'),
         MB_ICONINFORMATION + MB_OK);
     1: result := Application.MessageBox(PChar(Texto), PChar('Confirme'),
         MB_ICONQUESTION + MB_YESNO);
     2: result := Application.MessageBox(PChar(Texto), PChar('Erro'),
         MB_ICONERROR + MB_OK);
   end;
 end;

 function PasswordInputBox(const ACaption, APrompt:string): string;
 var
   Form: TForm;
   Prompt: TLabel;
   Edit: TEdit;
   DialogUnits: TPoint;
   ButtonTop, ButtonWidth, ButtonHeight: Integer;
   Value: string;
   I: Integer;
   Buffer: array[0..51] of Char;
 begin
   Result := '';
   Form := TForm.Create(Application);
   with Form do
     try
       Canvas.Font := Font;

       for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));

       for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));

       GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
       DialogUnits.X := DialogUnits.X div 52;
       BorderStyle := bsDialog;
       Caption := ACaption;
       ClientWidth := MulDiv(180, DialogUnits.X, 4);
       ClientHeight := MulDiv(63, DialogUnits.Y, 8);
       Position := poScreenCenter;
       Prompt := TLabel.Create(Form);

       with Prompt do
       begin
         Parent := Form;
         AutoSize := True;
         Left := MulDiv(8, DialogUnits.X, 4);
         Top := MulDiv(8, DialogUnits.Y, 8);
         Caption := APrompt;
       end;

       Edit := TEdit.Create(Form);

       with Edit do
       begin
         Parent := Form;
         Left := Prompt.Left;
         Top := MulDiv(19, DialogUnits.Y, 8);
         Width := MulDiv(164, DialogUnits.X, 4);
         MaxLength := 255;
         PasswordChar := '*';
         SelectAll;
       end;

       ButtonTop := MulDiv(41, DialogUnits.Y, 8);
       ButtonWidth := MulDiv(50, DialogUnits.X, 4);
       ButtonHeight := MulDiv(14, DialogUnits.Y, 8);

       with TButton.Create(Form) do
       begin
         Parent := Form;
         Caption := 'OK';
         ModalResult := mrOk;
         Default := True;
         SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
       end;

       with TButton.Create(Form) do
       begin
         Parent := Form;
         Caption := 'Cancel';
         ModalResult := mrCancel;
         Cancel := True;
         SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
       end;

       if ShowModal = mrOk then
       begin
         Value := Edit.Text;
         Result := Value;
       end;
     finally
       FreeAndNil(Form);
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
   end;
 end;

 function NomeMes(Data: TDateTime): string;
 var
   Mes: integer;
 begin
   Mes := MonthOf(Data);

   case Mes of
     1:  result := 'Janeiro';
     2:  result := 'Fevereiro';
     3:  result := 'Março';
     4:  result := 'Abril';
     5:  result := 'Maio';
     6:  result := 'Junho';
     7:  result := 'Julho';
     8:  result := 'Agosto';
     9:  result := 'Setembro';
     10: result := 'Outubro';
     11: result := 'Novembro';
     12: result := 'Dezembro';
   end;
 end;

 end.
