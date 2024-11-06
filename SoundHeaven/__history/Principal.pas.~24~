unit Principal;

interface

uses System.SysUtils, System.Classes, Vcl.Forms, Vcl.Menus, Vcl.Controls,
  Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Estilos1: TMenuItem;
    Artistas1: TMenuItem;
    procedure OpenMDIChild(AFormClass: TFormClass);
    procedure MenuClick(Sender: TObject);
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

uses Estilos, Artistas;

procedure TfrmPrincipal.OpenMDIChild(AFormClass: TFormClass);
var
  ChildForm: TForm;
begin
  // Verifica se o formulário já está aberto
  ChildForm := nil;
  for var i := 0 to MDIChildCount - 1 do
    if MDIChildren[i].ClassType = AFormClass then
    begin
      ChildForm := MDIChildren[i];
      Break;
    end;

  // Se não estiver aberto, cria uma nova instância
  if not Assigned(ChildForm) then
    ChildForm := AFormClass.Create(Self);

  // Exibe o formulário MDI Child
  ChildForm.Show;
end;

procedure TfrmPrincipal.MenuClick(Sender: TObject);
begin
  case (Sender as TMenuItem).Tag of
    1: OpenMDIChild(TfrmEstilos);
    2: OpenMDIChild(TfrmArtistas);
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  FreeAndNil(frmPrincipal);
  Application.Terminate;
end;

end.
