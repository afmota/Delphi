﻿unit UGravadoraDAO;

interface

uses UConexao, UGravadora, Data.Win.ADODB, System.SysUtils, System.Generics.Collections;

type
  TGravadoraDAO = class
  private
    FConn: TConexaoDB; // Conex�o com o SQL Server
  public
    constructor Create;
    destructor Destroy;
    function Excluir(const Gravadora: TGravadora): Boolean;
    function Inserir(const Gravadora: TGravadora): Boolean;
    function Atualizar(const Gravadora: TGravadora): Boolean;
    function Localizar(const ID: Integer): TGravadora; overload;
    function Localizar(const Nome: string): TGravadora; overload;
    function ListarGravadoras: TList<TGravadora>;
  end;

implementation

constructor TGravadoraDAO.Create;
begin
  FConn := TConexaoDB.Create; //Instancia a conex�o ADO
end;

destructor TGravadoraDAO.Destroy;
begin
  FConn.Free; // Liberar a conex�o ao destruir
  inherited;
end;

function TGravadoraDAO.Excluir(const Gravadora: TGravadora): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_GravadoraExcluir';
        Parameters.Refresh;
        Parameters.ParamByName('@Gravadora_ID').Value := Gravadora.ID;
        ExecProc;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao excluir Gravadora: ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.Inserir(const Gravadora: TGravadora): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    try
      StoredProc := TADOStoredProc.Create(nil);

      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_GravadoraInserir';
        Parameters.Refresh;
        Parameters.ParamByName('@Nome').Value := Gravadora.Nome;
        ExecProc;
      end;

      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao incluir Gravadora: ' + E.Message);
        Result := False;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.Atualizar(const Gravadora: TGravadora): Boolean;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_GravadoraAtualizar';

        with Parameters do
        begin
          Refresh;
          ParamByName('@Gravadora_ID').Value := Gravadora.ID;
          ParamByName('@Nome').Value := Gravadora.Nome;
        end;

        ExecProc;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar Gravadora: ' + E.message);
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.Localizar(const ID: Integer): TGravadora;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);
    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_GravadoraLocalizarPorID';
        Parameters.Refresh;
        Parameters.ParamByName('@Gravadora_ID').Value := ID;
        Open;
        First;

        if not IsEmpty then
          Result := TGravadora.Create(
            FieldByName('Gravadora_ID').AsInteger,
            FieldByName('Gravadora_Nome').AsString)
        else
          Result := nil;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Gravadora n�o encontrada.');
        Result := nil;
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.Localizar(const Nome: string): TGravadora;
var
  StoredProc: TADOStoredProc;
begin
  try
    StoredProc := TADOStoredProc.Create(nil);

    try
      with StoredProc do
      begin
        Connection := FConn.GetConnection;
        ProcedureName := 'sp_GravadoraLocalizarPorNome';
        Parameters.Refresh;
        Open;
        First;

        if not IsEmpty then
          Result := TGravadora.Create(
            FieldByName('Gravadora_ID').AsInteger,
            FieldByName('Gravadora Nome').AsString)
        else
          Result := nil;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Gravadora n�o encontrada.');
      end;
    end;
  finally
    StoredProc.Free;
  end;
end;

function TGravadoraDAO.ListarGravadoras: TList<TGravadora>;
var
  StoredProc: TADOStoredProc;
  Gravadora: TGravadora;
begin
  Result := TList<TGravadora>.Create;
  StoredProc := TADOStoredProc.Create(nil);

  try
    with StoredProc do
    begin
      Connection := FConn.GetConnection;
      ProcedureName := 'sp_GravadoraListarAtivas';
      Parameters.Refresh;
      Open;
      First;

      if not IsEmpty then
        while not Eof do
        begin
          Gravadora := TGravadora.Create(
            FieldByName('Gravadora_ID').AsInteger,
            FieldByName('Gravadora_Nome').AsString);
          Result.Add(Gravadora);
          Next;
        end
      else
        Result := nil;
    end;
  finally
    StoredProc.Free;
  end;
end;

end.
