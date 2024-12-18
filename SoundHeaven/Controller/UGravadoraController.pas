unit UGravadoraController;

interface

uses UGravadoraDAO, UGravadora, System.SysUtils, System.Generics.Collections;

type
  TGravadoraController = class
  private
    FDAO: TGravadoraDAO;
  public
    constructor Create;
    destructor Destroy; override;
    function ExcluirGravadora(const Gravadora: TGravadora): Boolean;
    function InserirGravadora(const Gravadora: TGravadora): Boolean;
    function AtualizarGravadora(const Gravadora: TGravadora): Boolean;
    function LocalizarGravadora(const ID: Integer): TGravadora; overload;
    function LocalizarGravadora(const Nome:string): TGravadora; overload;
    function ListarGravadoras: TList<TGravadora>;
  end;

implementation

constructor TGravadoraController.Create;
begin
  FDAO := TGravadoraDAO.Create;
end;

destructor TGravadoraController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TGravadoraController.ExcluirGravadora(const Gravadora: TGravadora): Boolean;
begin
  Result := FDAO.Excluir(Gravadora);
end;

function TGravadoraController.InserirGravadora(const Gravadora: TGravadora): Boolean;
begin
  if Gravadora.Nome = '' then
    raise Exception.Create('O campo NOME deve ser preenchido')
  else
    Result := FDAO.Inserir(Gravadora);
end;

function TGravadoraController.AtualizarGravadora(const Gravadora: TGravadora): Boolean;
begin
  if Gravadora.Nome= '' then
    raise Exception.Create('O campo NOME deve ser preenchido.')
  else
    Result := FDAO.Atualizar(Gravadora);
end;

function TGravadoraController.LocalizarGravadora(const ID: Integer): TGravadora;
begin
  Result := FDAO.Localizar(ID);
end;

function TGravadoraController.LocalizarGravadora(const Nome: string): TGravadora;
begin
  Result := FDAO.Localizar(Nome);
end;

function TGravadoraController.ListarGravadoras: TList<TGravadora>;
begin
  Result := FDAO.ListarGravadoras;
end;

end.
