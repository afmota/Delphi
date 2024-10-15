unit Principal;

interface

uses System.SysUtils, System.Classes, Vcl.Forms, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Artistas1: TMenuItem;
    Sair1: TMenuItem;
    lbuns1: TMenuItem;
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

uses Artistas;

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
    1: OpenMDIChild(TfrmArtistas);   // Tag 1 corresponde a frmArtistas
    2: OpenMDIChild(TfrmGravadoras); // Tag 2 corresponde a frmGravadoras
    // Adicione mais casos para outros formulários
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
