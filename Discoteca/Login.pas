unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ButtonStylesAttributes, Vcl.StyledButton;

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

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmPrincipal.Show;
  frmLogin.Hide;
end;

procedure TFrmLogin.FormPaint(Sender: TObject);
var
  altura, coluna: Word;
begin
  altura := (ClientHeight + 255) div 256;
  for coluna := 0 to 255 do
    with Canvas do
      begin
        Brush.Color := RGB(coluna, 0, 20); { Modifique para obter cores diferentes }
        FillRect(Rect(0, coluna * altura, ClientWidth, (coluna + 1) * altura));
      end;
end;

procedure TFrmLogin.FormResize(Sender: TObject);
var
  FormWidth: integer;
begin
  // Obtém a largura do formulário atual
  FormWidth := Self.ClientWidth;

  case FormWidth of
    1367..MaxInt:  // Se o formulário for maior que 1367
    begin
      pnlLogin.Width        := 960;
      pnlLogin.Height       := 380;

      pnlCampos.Width       := 480;
      imglogin.Width        := 480;

      lblTitulo.Left        := 200;
      lblTitulo.Top         := 16;
      lblTitulo.Font.Height := 36;

      lblMensa.Left         := 40;
      lblMensa.Top          := 59;
      lblMensa.Width        := 385;
      lblMensa.Font.Height  := 30;

      Shape1.Width          := 441;
      Shape1.Height         := 41;
      Shape1.Left           := 16;
      Shape1.Top            := 182;

      edtUser.Left          := 76;
      edtUser.Top           := 186;
      edtUser.Font.Height   := 27;
      edtUser.Width         := 377;
      edtUser.Height        := 33;

      Shape2.Width          := 441;
      Shape2.Height         := 41;
      Shape2.Left           := 16;
      Shape2.Top            := 239;

      edtPass.Left          := 76;
      edtPass.Top           := 243;
      edtPass.Font.Height   := 27;
      edtPass.Width         := 377;
      edtPass.Height        := 33;

      btnLogin.Font.Height  := 31;
      btnLogin.Width        := 441;
      btnLogin.Height       := 42;
      btnLogin.Left         := 16;
      btnLogin.Top          := 294;
    end;
    1025..1366:    // Se o formulário for maior que 1024 e menor ou igual a 1367
    begin
      pnlLogin.Width        := 684;
      pnlLogin.Height       := 270;

      pnlCampos.Width       := 342;
      imglogin.Width        := 342;

      lblTitulo.Font.Height := 26;
      lblTitulo.Left        := 136;
      lblTitulo.Top         := 16;

      lblMensa.Width        := 289;
      lblMensa.Font.Height  := 22;
      lblMensa.Left         := 16;
      lblMensa.Top          := 50;

      Shape1.Width          := 305;
      Shape1.Height         := 32;
      Shape1.Left           := 16;
      Shape1.Top            := 132;

      edtUser.Left          := 64;
      edtUser.Top           := 135;
      edtUser.Font.Height   := 22;
      edtUser.Width         := 253;
      edtUser.Height        := 26;

      Shape2.Width          := 305;
      Shape2.Height         := 32;
      Shape2.Left           := 16;
      Shape2.Top            := 170;

      edtPass.Left          := 64;
      edtPass.Top           := 173;
      edtPass.Font.Height   := 22;
      edtPass.Width         := 253;
      edtPass.Height        := 26;

      btnLogin.Font.Height  := 20;
      btnLogin.Width        := 305;
      btnLogin.Height       := 32;
      btnLogin.Left         := 16;
      btnLogin.Top          := 208;
    end
    else           // Se o formulário for menor ou igual a 1024
      pnlLogin.Width := 640;
  end;

  pnlLogin.Left := (Self.ClientWidth - pnlLogin.Width) div 2;
  pnlLogin.Top  := (Self.ClientHeight - pnlLogin.Height) div 2;
end;

end.
