unit Model.Conexao.Firedac;

interface

uses
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.SQLite,
  Firedac.Phys.SQLiteDef,
  Firedac.Stan.ExprFuncs,
  Firedac.Phys.SQLiteWrapper.Stat,
  Firedac.VCLUI.Wait,
  Firedac.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Model.Conexao.Interfaces,
  Data.DB;

type
  TModelConexao = class(TInterfacedObject, iConexao)
    private
      FConexao : TFDConnection;
      FQuery : TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConexao;
      function Params (Param : String; Value : Variant) : iConexao; overload;
      function DataSet(DataSource : TDataSource) : iConexao; overload;
      function DataSet : TDataSet; overload;
      function ExecSQL : iConexao;
      function Open : iConexao;
      function SQL (Value : String) : iConexao;
  end;

implementation


function TModelConexao.Params(Param: String; Value: Variant): iConexao;
begin
  Result := Self;
  FQuery.ParamByName(Param).Value := Value;
end;

constructor TModelConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
  FConexao.Params.Clear;
  FConexao.Params.Add('DriverID=SQLite');
  FConexao.Params.Add('DataBase=..\..\..\database\dados.sdb');
  FConexao.Params.Add('LockingMode=Normal');
  FConexao.Connected := True;
end;

function TModelConexao.DataSet(DataSource : TDataSource) : iConexao;
begin
  Result := Self;
  DataSource.DataSet := FQuery;
end;

function TModelConexao.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelConexao.Destroy;
begin
  FConexao.DisposeOf;
  FQuery.DisposeOf;
  inherited;
end;

function TModelConexao.ExecSQL: iConexao;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

class function TModelConexao.New : iConexao;
begin
  Result := Self.Create;
end;

function TModelConexao.Open: iConexao;
begin
  Result := Self;
  FQuery.Open;
end;

function TModelConexao.SQL(Value: String): iConexao;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

end.
