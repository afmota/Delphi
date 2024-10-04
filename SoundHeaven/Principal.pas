unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Artistas1: TMenuItem;
    Sair1: TMenuItem;
    procedure Artistas1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Artistas;

procedure TfrmPrincipal.Artistas1Click(Sender: TObject);
begin
// Verifica se o formul�rio frmArtistas j� est� criado
  if not Assigned(frmArtistas) then
    frmArtistas := TfrmArtistas.Create(Self);  // Cria o formul�rio, se n�o existir

  frmArtistas.ShowModal;  // Exibe o formul�rio
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
