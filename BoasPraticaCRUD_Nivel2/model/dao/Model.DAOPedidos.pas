unit Model.DAOPedidos;

interface

uses
  Model.DAO.Interfaces,
  Model.Entidades.Pedidos,
  Data.DB,
  Model.Conexao.Interfaces, Model.Conexao.Firedac;

type
  TDAOPedido = class(TInterfacedObject, iDAOEntity<TPedidos>)
    private
      FPedidos : TPedidos;
      FConexao : iConexao;
      FDataSet : TDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TPedidos>;
      function Listar : iDAOEntity<TPedidos>;
      function ListarPorId(Id : Variant) : iDAOEntity<TPedidos>;
      function Excluir(Id : Integer) : iDAOEntity<TPedidos>; overload;
      function Excluir: iDAOEntity<TPedidos>; overload;
      function Atualizar : iDAOEntity<TPedidos>;
      function Inserir : iDAOEntity<TPedidos>;
      function DataSet(DataSource : TDataSource) : iDAOEntity<TPedidos>;
      function This : TPedidos;
  end;

implementation

uses
  System.SysUtils;

function TDAOPedido.Atualizar: iDAOEntity<TPedidos>;
begin
  Result := Self;
  try
    FConexao
      .SQL('UPDATE PEDIDOS SET DESCRICAO=:DESCRICAO WHERE ID=:ID')
      .Params('DESCRICAO',FPedidos.Descricao)
      .Params('ID',FPedidos.Id)
      .ExecSQL
  except on e:Exception do
    raise Exception.Create('Error ao tentar atualizar o resgistro: '+e.Message);
  end;
end;

constructor TDAOPedido.Create;
begin
  FConexao := TModelConexao.New;
  FPedidos := TPedidos.Create(Self);
end;

function TDAOPedido.DataSet(DataSource: TDataSource): iDAOEntity<TPedidos>;
begin
  Result := Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet := FConexao.DataSet
  else
    DataSource.DataSet := FDataSet;
end;

destructor TDAOPedido.Destroy;
begin
  FPedidos.DisposeOf;
  inherited;
end;

function TDAOPedido.Excluir: iDAOEntity<TPedidos>;
begin
  Result := Self;
  try
    FConexao
    .SQL('DELETE FROM PEDIDOS WHERE ID=:ID')
    .Params('ID',FPedidos.Id)
    .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
  end;
end;

function TDAOPedido.Excluir(Id: Integer): iDAOEntity<TPedidos>;
begin
  Result := Self;
  try
    FConexao
    .SQL('DELETE FROM PEDIDOS WHERE ID=:ID')
    .Params('ID',Id)
    .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
  end;
end;

function TDAOPedido.Inserir: iDAOEntity<TPedidos>;
begin
  Result := Self;
  try
    FConexao
      .SQL('INSERT INTO PEDIDOS (DESCRICAO) VALUES (:DESCRICAO)')
      .Params('DESCRICAO', FPedidos.Descricao)
      .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Erro ao tentar inserir os dados: '+ e.Message);
  end;
end;

function TDAOPedido.Listar : iDAOEntity<TPedidos>;
begin
  Result := Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM PEDIDOS')
      .Open
      .DataSet;
end;

function TDAOPedido.ListarPorId(Id: Variant): iDAOEntity<TPedidos>;
begin
  Result := Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM PEDIDOS WHERE ID=:ID')
      .Params('ID',FPedidos.Id)
      .Open.DataSet;
end;

class function TDAOPedido.New : iDAOEntity<TPedidos>;
begin
  Result := Self.Create;
end;

function TDAOPedido.This: TPedidos;
begin
  Result := FPedidos;
end;

end.
