unit UEstiloController;

interface

uses UEstilo, UEstiloDAO, System.Generics.Collections, System.SysUtils;

type
  TEstiloController = class
    private
      FDAO: TEstiloDAO;
    public
      constructor Create;
      destructor Destroy; override;
      function InserirEstilo(const Estilo: TEstilo): Boolean;
      function AtualizarEstilo(const Estilo: TEstilo): Boolean;
      function ExcluirEstilo(const Estilo: TEstilo): Boolean;
      function LocalizarEstilo(const ID: Integer): TEstilo; overload;
      function LocalizarEstilo(const Nome: string): TEstilo; overload;
      function ListarEstilos: TList<TEstilo>;
  end;

implementation

uses FuncoesDivs;

constructor TEstiloController.Create;
begin
  FDAO := TEstiloDAO.Create;
end;

destructor TEstiloController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TEstiloController.InserirEstilo(const Estilo: TEstilo): Boolean;
begin
  if Estilo.Nome = '' then
    raise Exception.Create('O campo NOME deve ser preenchido.')
  else
    Result := FDAO.Inserir(Estilo);
end;

function TEstiloController.AtualizarEstilo(const Estilo: TEstilo): Boolean;
begin
  if Estilo.Nome <> '' then
    Result := FDAO.Atualizar(Estilo)
  else
    raise Exception.Create('O campo NOME deve ser preenchido.');
end;

function TEstiloController.ExcluirEstilo(const Estilo: TEstilo): Boolean;
begin
  Result := FDAO.Excluir(Estilo);
end;

function TEstiloController.LocalizarEstilo(const ID: Integer): TEstilo;
begin
  Result := FDAO.Localizar(ID);
end;

function TEstiloController.LocalizarEstilo(const Nome: string): TEstilo;
begin
  Result := FDAO.Localizar(Nome);
end;

function TEstiloController.ListarEstilos: TList<TEstilo>;
begin
  Result := FDAO.ListarEstilos;
end;

end.
