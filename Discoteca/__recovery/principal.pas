unit principal;

interface

uses
  Vcl.Forms, System.Win.Registry, System.Actions, Vcl.ActnList, IdBaseComponent,
  IdComponent, IdIPWatch, Data.DB, Data.Win.ADODB, System.ImageList,
  Vcl.ImgList, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.Classes;

type
  TFrmPrincipal = class(TForm)
    MainMenu: TMainMenu;
    StatusBar: TStatusBar;
    Cadastro1: TMenuItem;
    Sair1: TMenuItem;
    ArquivoDigital1: TMenuItem;
    CategoriasAD1: TMenuItem;
    Departamentos1: TMenuItem;
    ransferirarq1: TMenuItem;
    Consultas2: TMenuItem;
    Recepo1: TMenuItem;
    Empresas1: TMenuItem;
    Funcionrios1: TMenuItem;
    Despesas1: TMenuItem;
    Cadcontas1: TMenuItem;
    Bancos1: TMenuItem;
    Movimento1: TMenuItem;
    PessoasFsicas2: TMenuItem;
    DeptoFiscal1: TMenuItem;
    NFEntrada1: TMenuItem;
    Produtos1: TMenuItem;
    Informtica1: TMenuItem;
    Softwares1: TMenuItem;
    ImageList1: TImageList;
    abelas1: TMenuItem;
    ControlAces1: TMenuItem;
    DeptoContbil1: TMenuItem;
    Grupos1: TMenuItem;
    Desbloquearumaconta1: TMenuItem;
    Encerrarsistema1: TMenuItem;
    rocarusurio1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    rocarsenha1: TMenuItem;
    Equipamentos1: TMenuItem;
    Conexao: TADOConnection;
    ClasFiscal1: TMenuItem;
    IdIPWatch: TIdIPWatch;
    ImpSintegra1: TMenuItem;
    Clientes1: TMenuItem;
    Ferramentas1: TMenuItem;
    Atualiza1: TMenuItem;
    DeptoLegal1: TMenuItem;
    ContrAb1: TMenuItem;
    ImageList: TImageList;
    ImageListDis: TImageList;
    ActionList: TActionList;
    ActionListDis: TActionList;
    ToolBar: TToolBar;
    btnPrimeiro: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    ToolButton3: TToolButton;
    btnNovo: TToolButton;
    btnAlterar: TToolButton;
    btnCancelar: TToolButton;
    btnSalvar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton8: TToolButton;
    btnPesquisar: TToolButton;
    ToolButton4: TToolButton;
    btnSair: TToolButton;
    Endereos1: TMenuItem;
    Estados1: TMenuItem;
    Localidades1: TMenuItem;
    Bairros1: TMenuItem;
    Logradouros1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure EnableButtons(States: string);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
     States: string[11];
     Active: integer;
  end;

var
   frmPrincipal: TfrmPrincipal;
   Sair: boolean;
   UserName: string;

implementation

uses FuncoesRede, FuncoesDivs;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
   Reg: TRegistry;
   //Caminho: string;
 begin
   {Sair := false;
   Conexao.Connected := false;

   Reg := TRegistry.Create;

   with Reg do
   begin
     RootKey := HKEY_CURRENT_USER;
     if (KeyExists('Software\CST')) then
     begin
       OpenKey('Software\CST\Avalon\Server', false);
       edtServidor.Text := ReadString('NumeroIP');
       CloseKey;

       OpenKey('Software\CST\Avalon\User', false);
       edtUsuario.Text := ReadString('UserName');
       CloseKey;}

       { Para uso caso haja papel de parede no form principal
       OpenKey('Software\Velani\ArquivoDigital\Wallpaper', false);
       Caminho := ReadString('Imagem');
       CloseKey;
       Wallpaper.Picture.LoadFromFile(Caminho);}

       {Será usado para o repositório de imagens da aplicação
       OpenKey('Software\Velani\ArquivoDigital\Repositorio', false);
       Repositorio := ReadString('Endereco');
       CloseKey;}

       {Free;
     end;
   end;

   StatusBar.Panels[0].Text := 'Número IP: ' + IdIPWatch.LocalIP;
   StatusBar.Panels[1].Text := 'Nome do host: ' + NomeComputador;}
 end;

procedure TFrmPrincipal.FormResize(Sender: TObject);
begin
   {if not(Sair) then
   begin
     pnlLogin.Top  := Round((frmPrincipal.Height - pnlLogin.Height) / 2);
     pnlLogin.Left := Round((frmPrincipal.Width - pnlLogin.Width) / 2);
   end;}
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  {frmPrincipal.Menu := nil;}
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   {Conexao.Connected := false;
   Action := caFree;
   frmPrincipal := nil;}
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
var
   x: integer;
 begin
   if (MDIChildCount > 0) then
   begin
     {case Active of
       1: frmEstados.Exit;
       2: frmLocalidades.Exit;
       3: frmBairros.Exit;
       4: frmLogradouros.Exit;
     end; }
   end
   else
     if (Mensagem('Deseja encerrar o sistema?', 1) = 6) then
     begin
       Sair := true;
       if (MDIChildCount > 0) then
         for x := 0 to Pred(MDIChildCount) do
           MDIChildren[x].Close;
       Close;
     end;
 end;

procedure TFrmPrincipal.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  {if Key = #13 then
     btnLogin.Click;}
end;

procedure TFrmPrincipal.btnLoginClick(Sender: TObject);
var
   Reg: TRegistry;
 begin
   {if not(DirectoryExists('C:\Avalon')) then
     CreateDir('C:\Avalon');

   Reg := TRegistry.Create;
   // se não existir, cria as chaves no registro
   if not Reg.KeyExists('Software\CST') then
   begin
     with Reg do
     begin
       CreateKey('Software\CST');
       CreateKey('Software\CST\Avalon');
       CreateKey('Software\CST\Avalon\Server');
       CreateKey('Software\CST\Avalon\User');
       //CreateKey('Software\CST\Avalon\Wallpaper');
       //CreateKey('Software\CST\Avalon\Repositorio');

       // grava os dados informados na janela de login no registro
       OpenKey('Software\CST\Avalon\Server', false);
       WriteString('NumeroIP', edtServidor.Text);
       CloseKey;
       OpenKey('Software\CST\Avalon\User', false);
       WriteString('UserName', edtUsuario.Text);
       CloseKey;

       // se não existir o caminho do papel de parede e do repositório, pede ao usuário
       {OpenKey('Software\Velani\ArquivoDigital\Wallpaper', false);
       Caminho := InputBox('Papel de parede', 'Informe o caminho do papel de parede', '');
       WriteString('Imagem', Caminho);
       CloseKey;

       OpenKey('Software\Velani\ArquivoDigital\Repositorio', false);
       Repositorio := InputBox('Pastas de clientes', 'Informe o caminho das pastas', '');
       WriteString('Endereco', Repositorio);
       CloseKey;}

       {Free;
     end;
   end;

   if (edtServidor.Text <> '') then
   begin
     if (edtSenha.Text <> '') then
     begin
       try
         UserName := edtUsuario.Text;
         Conexao.Connected := true;

         if (Menu = nil) then
           Menu := MainMenu;

         Reg.OpenKey('Software\CST\Avalon\Server', false);
         Reg.WriteString('NumeroIP', edtServidor.Text);
         Reg.OpenKey('Software\Velani\ArquivoDigital\User', false);
         Reg.WriteString('UserName', edtusuario.Text);
         StatusBar.Panels[2].Text := 'Usuário: ' + edtUsuario.Text;

         with frmPrincipal do
         begin
           BorderStyle := bsSizeable;
           BorderIcons := [biSystemMenu];
           pnlLogin.Hide;
           Menu := MainMenu;
           ToolBar.Visible := true;
         end;
       except //except
         On E: EOleException do
         begin
           case E.ErrorCode of
             -2147467259: begin
               Mensagem(FalhaConexao + IntToStr(E.ErrorCode), 0);
               Application.Terminate;
             end;
             -2147217843: begin
               Mensagem(ErroLogin, 2);
               Exit;
             end;
             -2146824582: begin
               Mensagem(FalhaDriver, 0);
               Application.Terminate;
             end;
             -2146824583: begin
               Mensagem(MultiplasConexoes, 0);
               Application.Terminate;
             end
             else
             begin
               Mensagem(IntToStr(E.ErrorCode) + ' : ' + E.Message, 0);
               Application.Terminate;
             end;
           end;
         end;
       end;   //end except
     end
     else
     begin
       Mensagem(PreencherCampo + 'SENHA!', 0);
       edtSenha.SetFocus;
     end;
   end
   else
   begin
     Mensagem(PreencherCampo + 'USUÁRIO!', 0);
     edtUsuario.SetFocus;
   end;}
end;

procedure TFrmPrincipal.btnCancelClick(Sender: TObject);
begin
  {Application.Terminate;}
end;

procedure TFrmPrincipal.btnNovoClick(Sender: TObject);
begin
  {if (Sender = btnNovo) then
     case Active of
       1: frmEstados.NewReg;
       2: frmLocalidades.NewReg;
       3: frmBairros.NewReg;
       4: frmLogradouros.NewReg;
     end;

   if (Sender = btnCancelar) then
     case Active of
       1: frmEstados.CancelEdition;
       2: frmLocalidades.CancelEdition;
       3: frmBairros.CancelEdition;
       4: frmLogradouros.CancelEdition;
     end;

   if (Sender = btnAlterar) then
     case Active of
       1: frmEstados.UpdateReg;
       2: frmLocalidades.UpdateReg;
       3: frmBairros.UpdateReg;
       4: frmLogradouros.UpdateReg;
     end;

   if (Sender = btnSalvar) then
     case Active of
       1: frmEstados.SaveReg;
       2: frmLocalidades.SaveReg;
       3: frmBairros.SaveReg;
       4: frmLogradouros.SaveReg;
     end;

   if (Sender = btnExcluir) then
   case Active of
     1: frmEstados.DeleteReg;
     2: frmLocalidades.DeleteReg;
     3: frmBairros.DeleteReg;
     4: frmLogradouros.DeleteReg;
   end;}
end;

procedure TFrmPrincipal.btnPrimeiroClick(Sender: TObject);
begin
  {if (Sender = btnPrimeiro) then
     case Active of
       1: frmEstados.FirstReg;
       2: frmLocalidades.FirstReg;
       3: frmBairros.FirstReg;
       4: frmLogradouros.FirstReg;
     end;

   if (Sender = btnUltimo) then
     case Active of
       1: frmEstados.LastReg;
       2: frmLocalidades.LastReg;
       3: frmBairros.LastReg;
       4: frmLogradouros.LastReg;
     end;

   if (Sender = btnAnterior) then
     case Active of
       1: frmEstados.PriorReg;
       2: frmLocalidades.PriorReg;
       3: frmBairros.PriorReg;
       4: frmLogradouros.PriorReg;
     end;

   if (Sender = btnProximo) then
     case Active of
       1: frmEstados.NextReg;
       2: frmLocalidades.NextReg;
       3: frmBairros.NextReg;
       4: frmLogradouros.NextReg;
     end;}
end;

procedure TFrmPrincipal.EnableButtons(States: string);
var
   Buttons: array[1..11] of TToolButton;
   i: integer;
   state: boolean;
 begin
   {Buttons[1] := btnPrimeiro;
   Buttons[2] := btnAnterior;
   Buttons[3] := btnProximo;
   Buttons[4] := btnUltimo;
   Buttons[5] := btnNovo;
   Buttons[6] := btnAlterar;
   Buttons[7] := btnCancelar;
   Buttons[8] := btnSalvar;
   Buttons[9] := btnExcluir;
   Buttons[10] := btnPesquisar;
   Buttons[11] := btnSair;

   for i := 1 to 11 do
   begin
     if (States[i] = '1') then state := true else state := false;
     Buttons[i].Enabled := state;
   end;}
 end;

procedure TFrmPrincipal.Estados1Click(Sender: TObject);
begin
   {if Sender = Estados1     then AbreForm(TfrmEstados,     frmEstados,     UserName);
   if Sender = Localidades1 then AbreForm(TfrmLocalidades, frmLocalidades, UserName);
   if Sender = Bairros1     then AbreForm(TfrmBairros,     frmBairros,     UserName);
   if Sender = Logradouros1 then AbreForm(TfrmLogradouros, frmLogradouros, UserName);}
end;

end.
