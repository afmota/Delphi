unit Principal;

interface

uses System.SysUtils, System.Classes, Vcl.Forms, Vcl.Menus, Vcl.Controls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, StyledButton;

type
  TfrmPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Estilos1: TMenuItem;
    Artistas1: TMenuItem;
    Gravadoras1: TMenuItem;
    Produtores1: TMenuItem;
    lbuns1: TMenuItem;
    pnlTaskBar: TPanel;
    AnimationTimer: TTimer;
    Store1: TMenuItem;
    //procedure OpenMDIChild(AFormClass: TFormClass);
    procedure MenuClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AnimationTimerTimer(Sender: TObject);
  private
    TaskButtonCount: Integer; // Controla a quantidade de bot�es
    SlidingIn: Boolean; // True se o painel estiver mostrando, False se estiver escondendo
    procedure AddTaskButton(AForm: TForm);
    procedure RemoveTaskButton(AForm: TForm);
    procedure TaskButtonClick(Sender: TObject);
    procedure FormCloseHandler(Sender: TObject; var Action: TCloseAction);
    procedure ShowTaskBar;
    procedure HideTaskBar;
  public
    procedure OpenForm(AFormClass: TFormClass);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Estilos, Artistas, Produtores, Gravadoras, Albuns, Store;

procedure TfrmPrincipal.OpenForm(AFormClass: TFormClass);
var
  NewForm: TForm;
begin
  // Verifica se o formul�rio j� est� aberto
  for var i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is AFormClass then
    begin
      MDIChildren[i].BringToFront;
      Exit;
    end;
  end;

  // Cria e configura o novo formul�rio MDI
  NewForm := AFormClass.Create(Self);
  NewForm.FormStyle := fsMDIChild;
  NewForm.OnClose := FormCloseHandler; // Define o evento OnClose
  NewForm.Show;

  // Adiciona o bot�o para o formul�rio rec�m-aberto
  AddTaskButton(NewForm);
end;

// Remove o bot�o da barra de tarefas ao fechar o formul�rio
procedure TfrmPrincipal.RemoveTaskButton(AForm: TForm);
var
  i: Integer;
begin
  for i := pnlTaskBar.ControlCount - 1 downto 0 do
  begin
    if (pnlTaskBar.Controls[i] is TStyledButton) and
       (TStyledButton(pnlTaskBar.Controls[i]).Tag = NativeInt(AForm)) then
    begin
      pnlTaskBar.Controls[i].Free;
      Break;
    end;
  end;

  Dec(TaskButtonCount);
  if TaskButtonCount = 0 then
    HideTaskBar; // Chama a anima��o para esconder o painel
end;

// Adiciona um bot�o na barra de tarefas para o formul�rio aberto
procedure TfrmPrincipal.AddTaskButton(AForm: TForm);
var
  Btn: TStyledButton;
begin
  Btn := TStyledButton.Create(pnlTaskBar);
  Btn.Parent := pnlTaskBar;
  Btn.Align := alLeft;
  Btn.Width := 100;
  Btn.Caption := AForm.Caption;  // `Text` em vez de `Caption` no TStyledButton
  Btn.Tag := NativeInt(AForm); // Associa o bot�o ao formul�rio
  Btn.OnClick := TaskButtonClick; // Define o evento de clique

  Inc(TaskButtonCount);
  if TaskButtonCount = 1 then
  begin
    pnlTaskBar.Visible := True;
    pnlTaskBar.Height := 0; // Come�a escondido
    ShowTaskBar; // Chama a anima��o para mostrar o painel
  end;
end;

procedure TfrmPrincipal.AnimationTimerTimer(Sender: TObject);
const
  SlideSpeed = 10; // Velocidade do deslizamento, ajuste conforme necess�rio
begin
  if SlidingIn then
  begin
    if pnlTaskBar.Height < 40 then // Defina a altura final desejada
      pnlTaskBar.Height := pnlTaskBar.Height + SlideSpeed
    else
      AnimationTimer.Enabled := False; // Finaliza a anima��o quando atinge a altura
  end
  else
  begin
    if pnlTaskBar.Height > 0 then
      pnlTaskBar.Height := pnlTaskBar.Height - SlideSpeed
    else
    begin
      AnimationTimer.Enabled := False;
      pnlTaskBar.Visible := False; // Oculta o painel quando a altura � 0
    end;
  end;
end;

procedure TfrmPrincipal.FormCloseHandler(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; // Libera o formul�rio ao fechar
  RemoveTaskButton(TForm(Sender)); // Remove o bot�o correspondente na barra de tarefas
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  pnlTaskBar.Align := alTop;  // Posiciona a barra de tarefas no topo
  pnlTaskBar.Visible := False;
  pnlTaskBar.Height := 0; // Come�a com altura zero para deslizar ao mostrar
  TaskButtonCount := 0;
end;

procedure TfrmPrincipal.MenuClick(Sender: TObject);
begin
  case (Sender as TMenuItem).Tag of
    1: OpenForm(TfrmEstilos);
    2: OpenForm(TfrmArtistas);
    3: OpenForm(TfrmProdutores);
    4: OpenForm(TfrmGravadoras);
    5: OpenForm(TfrmAlbuns);
    6: OpenForm(TfrmStore);
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  FreeAndNil(frmPrincipal);
  Application.Terminate;
end;

// Evento de clique do bot�o na barra de tarefas para focar no formul�rio correspondente
procedure TfrmPrincipal.TaskButtonClick(Sender: TObject);
var
  TargetForm: TForm;
begin
  TargetForm := TForm(TStyledButton(Sender).Tag);
  if Assigned(TargetForm) then
    TargetForm.BringToFront; // Coloca o formul�rio em foco
end;

procedure TfrmPrincipal.ShowTaskBar;
begin
  SlidingIn := True;
  AnimationTimer.Enabled := True;
end;

procedure TfrmPrincipal.HideTaskBar;
begin
  SlidingIn := False;
  AnimationTimer.Enabled := True;
end;

{procedure TfrmPrincipal.OpenMDIChild(AFormClass: TFormClass);
var
  ChildForm: TForm;
begin
  // Verifica se o formul�rio j� est� aberto
  ChildForm := nil;
  for var i := 0 to MDIChildCount - 1 do
    if MDIChildren[i].ClassType = AFormClass then
    begin
      ChildForm := MDIChildren[i];
      Break;
    end;

  // Se n�o estiver aberto, cria uma nova inst�ncia
  if not Assigned(ChildForm) then
    ChildForm := AFormClass.Create(Self);

  // Exibe o formul�rio MDI Child
  ChildForm.Show;
end;}

end.
