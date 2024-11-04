unit Produtores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.StyledButton, Vcl.ExtCtrls;

type
  TfrmProdutor = class(TfrmModel)
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutor: TfrmProdutor;

implementation

{$R *.dfm}

uses ComponentHelper, UProdutor, UProdutorController;

procedure TfrmProdutor.btnExcluirClick(Sender: TObject);
var
  Produtor: TProdutor;
  ProdutorController: TProdutorController;
begin
  inherited;

  Produtor := TProdutor.Create(StrToInt(edtID.Text), 'F', Now);
  ProdutorController := TProdutorController.Create;

  try

  finally

  end;
end;

procedure TfrmProdutor.btnIncluirClick(Sender: TObject);
begin
  inherited;
  EnableComponentsByTag(Self, '01');
  edtNome.SetFocus;
end;

end.
