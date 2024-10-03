unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, System.Win.Registry;

type
  TFrmLogin = class(TForm)
    pnlLogin: TPanel;
    imglogin: TImage;
    pnlCampos: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    btnLogin: TStyledButton;
    edtPass: TEdit;
    edtUser: TEdit;
    lblTitulo: TLabel;
    lblMensa: TLabel;
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure SetControlDimensions(Control: TControl; AWidth, AHeight, ALeft,
      ATop: Integer; AFontHeight: Integer = -1);
    procedure ConfigureLayout;
    procedure FormCreate(Sender: TObject);
    procedure edtUserKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses principal;

procedure TFrmLogin.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
begin
  // Busca no registro do Windows o �ltimo usu�rio que usou o sistema
  Reg := TRegistry.Create;
  with Reg do
  begin
    RootKey := HKEY_CURRENT_USER;
    if KeyExists('Software\WWI') then
    begin
      OpenKey('Software\WWI\SoundHaven\User', false);
      edtUser.Text := ReadString('UserName');
      CloseKey;
    end;
    Free;
  end;
end;

procedure TFrmLogin.FormPaint(Sender: TObject);
var
  altura, coluna: Word;
begin
  altura := (ClientHeight + 255) div 256;
  for coluna := 0 to 255 do
    with Canvas do
      begin
        Brush.Color := RGB(coluna, 0, 26); { Modifique para obter cores diferentes }
        FillRect(Rect(0, coluna * altura, ClientWidth, (coluna + 1) * altura));
      end;
end;

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  ConfigureLayout;
end;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
var
  Reg: TRegistry;
begin
  if not(DirectoryExists('C:\SoundHaven')) then
    CreateDir('C:\Soundhaven');

  if (edtUser.Text <> '') and (edtPass.Text <> '') then
  begin
    Reg := TRegistry.Create;
    // se n�o existir, cria as chaves no Registro
    if not Reg.KeyExists('Software\WWI') then
    begin
      with Reg do
      begin
        CreateKey('Software\WWI');
        CreateKey('Software\WWI\SoundHaven');
        CreateKey('Software\WWI\SoundHaven\User');

        // grava o �ltimo usu�rio a fazer login, no registro
        OpenKey('Software\WWI\Soundhaven\User', false);
        WriteString('UserName', edtUser.Text);
        CloseKey;
      end;
    end;

    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    frmPrincipal.Show;
    frmLogin.Hide;
  end
  else
  begin
    MessageDlg('Os campos Usu�rio e Senha n�o podem estar vazios.',
      mtInformation, [mbOk], 0);
    edtUser.SetFocus;
  end;
end;

procedure TFrmLogin.SetControlDimensions(Control: TControl; AWidth, AHeight,
  ALeft, ATop, AFontHeight: Integer);
begin
  Control.Width := AWidth;
  Control.Height := AHeight;
  Control.Left := ALeft;
  Control.Top := ATop;

  if AFontHeight > 0 then
  begin
    if Control is TLabel then
      (Control as TLabel).Font.Height := AFontHeight
    else if Control is TEdit then
      (Control as TEdit).Font.Height := AFontHeight; // Ajuste para TEdit
  end;
end;

procedure TFrmLogin.ConfigureLayout;
var
  FormWidth: integer;
begin
  // Obt�m a largura do formul�rio atual
  FormWidth := Self.ClientWidth;

  case FormWidth of
    1367..MaxInt:  // Se o formul�rio for maior que 1367
    begin
      SetControlDimensions(pnlLogin, 960, 380, 480, 350);
      SetControlDimensions(pnlCampos, 480, 0, 0, 0);
      SetControlDimensions(imglogin, 480, 0, 0, 0);

      SetControlDimensions(lblTitulo, 0, 0, 200, 16, 36);
      SetControlDimensions(lblMensa, 385, 0, 40, 59, 30);
      SetControlDimensions(Shape1, 441, 41, 16, 182);
      SetControlDimensions(edtUser, 377, 33, 76, 186, 27);
      SetControlDimensions(Shape2, 441, 41, 16, 239);
      SetControlDimensions(edtPass, 377, 33, 76, 243, 27);
      SetControlDimensions(btnLogin, 441, 42, 16, 294, 31);
    end;

    1025..1366:  // Se o formul�rio for maior que 1024 e menor ou igual a 1367
    begin
      SetControlDimensions(pnlLogin, 684, 270, 341, 249);
      SetControlDimensions(pnlCampos, 342, 0, 0, 0);
      SetControlDimensions(imglogin, 342, 0, 0, 0);

      SetControlDimensions(lblTitulo, 0, 0, 136, 16, 26);
      SetControlDimensions(lblMensa, 289, 0, 16, 50, 22);
      SetControlDimensions(Shape1, 305, 32, 16, 132);
      SetControlDimensions(edtUser, 253, 26, 64, 135, 22);
      SetControlDimensions(Shape2, 305, 32, 16, 170);
      SetControlDimensions(edtPass, 253, 26, 64, 173, 22);
      SetControlDimensions(btnLogin, 305, 32, 16, 208, 20);
    end
    else  // Se o formul�rio for menor ou igual a 1024
    begin
      // em desenvolvimento
    end;
  end;
end;

procedure TFrmLogin.edtUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnLogin.Click;
end;

end.
