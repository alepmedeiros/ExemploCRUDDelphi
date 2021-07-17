unit CRUD.Services.Generic;

interface

uses
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client ,
  CRUD.Resources.Interfaces,
  CRUD.Resources.Conexao, System.Generics.Collections;

type
  iService<T : Class> = interface
    function Listar : TDataSet;
    function ListarPorId(Id : Integer) : TDataSet;
    function ListarPorFiltro(Key : String; Value : Variant) : TDataSet;
    function Inserir : TDataSet;
    function Atualizar : TDataSet;
    function Excluir : TDataSet; overload;
    function Excluir(Field : String; Value : String) : TDataSet; overload;
    function Entity : T;
  end;

  TService<T : class, constructor> = class(TInterfacedObject, iService<T>)
    private
      FParent : T;
      FConexao : iConexao;
      FConn : iSimpleQuery;
      FDAO : iSimpleDAO<T>;
      FDataSource : TDataSource;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iService<T>;
      function Listar : TDataSet;
      function ListarPorId(Id : Integer) : TDataSet;
      function ListarPorFiltro(Key : String; Value : Variant) : TDataSet;
      function Inserir : TDataSet;
      function Atualizar : TDataSet;
      function Excluir : TDataSet; overload;
      function Excluir(Field : String; Value : String) : TDataSet; overload;
      function Entity : T;
  end;

implementation

function TService<T>.Atualizar: TDataSet;
begin
  FDAO.Update(FParent);
  Result := FDataSource.DataSet;
end;

constructor TService<T>.Create;
begin
  FParent := T.Create;
  FDataSource := TDataSource.Create(nil);
  FConexao := TConexao.New;
  FConn := TSimpleQueryFiredac.New(TFDConnection(FConexao.Connect));
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

destructor TService<T>.Destroy;
begin
  FDataSource.DisposeOf;
  inherited;
end;

function TService<T>.Excluir: TDataSet;
begin
  FDAO.Delete(FParent);
  Result := FDataSource.DataSet;
end;

function TService<T>.Excluir(Field, Value: String): TDataSet;
begin
  FDAO.Delete(Field,Value);
  Result := FDataSource.DataSet;
end;

function TService<T>.Inserir: TDataSet;
begin
  FDAO.Insert(FParent);
  Result := FDataSource.DataSet;
end;

function TService<T>.Listar: TDataSet;
begin
  FDAO.Find;
  Result := FDataSource.DataSet;
end;

function TService<T>.ListarPorFiltro(Key: String; Value: Variant): TDataSet;
begin
  FDAO.Find(Key,Value);
  Result := FDataSource.DataSet;
end;

function TService<T>.ListarPorId(Id: Integer): TDataSet;
begin
  FDAO.Find(Id);
  Result := FDataSource.DataSet;
end;

class function TService<T>.New : iService<T>;
begin
  Result := Self.Create;
end;

function TService<T>.Entity: T;
begin
  Result := FParent;
end;

end.
