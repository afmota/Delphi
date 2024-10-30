unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  Tform_login = class(TForm)
    Panel1: TPanel;
    btn_fechar: TSpeedButton;
    pnl_bemvindo: TPanel;
    Panel3: TPanel;
    pnl_campos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_login: Tform_login;

implementation

{$R *.dfm}

procedure Tform_login.btn_fecharClick(Sender: TObject);
begin
  form_login.Close;
  Application.Terminate;
end;

procedure Tform_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(form_login);
end;

end.
