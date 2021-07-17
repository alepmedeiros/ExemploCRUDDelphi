unit Model.DAOPedidosItens;

interface

uses
  Model.DAO.Interfaces,
  Model.Entidades.PedidosItens,
  Data.DB, Model.Conexao.Interfaces, Model.Conexao.Firedac;

type
  TDAOPedidosItens = class(TInterfacedObject, iDAOEntity<TPedidosItens>)
    private
      FPedidosItens : TPedidosItens;
      FConexao : iConexao;
      FDataSet : TDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TPedidosItens>;
      function Listar : iDAOEntity<TPedidosItens>;
      function ListarPorId(Id : Variant) : iDAOEntity<TPedidosItens>;
      function Excluir(Id : Integer) : iDAOEntity<TPedidosItens>; overload;
      function Excluir : iDAOEntity<TPedidosItens>; overload;
      function Atualizar : iDAOEntity<TPedidosItens>;
      function Inserir : iDAOEntity<TPedidosItens>;
      function DataSet(DataSource : TDataSource) : iDAOEntity<TPedidosItens>;
      function This : TPedidosItens;
  end;

implementation

uses
  System.SysUtils;

function TDAOPedidosItens.Atualizar: iDAOEntity<TPedidosItens>;
begin
  Result := Self;
  try
    FConexao
      .SQL('UPDATE PEDIDOITENS SET PRODUTO=:PRODUTO, QUANTIDADE=:QUANTIDADE '+
          'WHERE ITEM=:ITEM AND ID_PEDIDO=:IDPEDIDO')
      .Params('PRODUTO', FPedidosItens.Produto)
      .Params('QUANTIDADE',FPedidosItens.Quantidade)
      .Params('ITEM',FPedidosItens.Item)
      .Params('IDPEDIDO',FPedidosItens.IdPedido)
      .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar atualizar os registro: '+e.Message);
  end;
end;

constructor TDAOPedidosItens.Create;
begin
  FConexao := TModelConexao.New;
  FPedidosItens := TPedidosItens.Create(Self);
end;

function TDAOPedidosItens.DataSet(
  DataSource: TDataSource): iDAOEntity<TPedidosItens>;
begin
  Result := Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet := FConexao.DataSet
  else
    DataSource.DataSet := FDataSet;
end;

destructor TDAOPedidosItens.Destroy;
begin
  FPedidosItens.DisposeOf;
  inherited;
end;

function TDAOPedidosItens.Excluir: iDAOEntity<TPedidosItens>;
begin
  Result := Self;
  try
    FConexao
      .SQL('DELETE FROM PEDIDOITENS WHERE ITEM=:ITEM AND ID_PEDIDO=:IDPEDIDO')
      .Params('ITEM',FPedidosItens.Item)
      .Params('IDPEDIDO',FPedidosItens.IdPedido)
      .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar excluir o registro: '+e.Message);
  end;
end;

function TDAOPedidosItens.Excluir(Id: Integer): iDAOEntity<TPedidosItens>;
begin
  Result := Self;
  try
    FConexao
      .SQL('DELETE FROM PEDIDOITENS WHERE ID=:ID')
      .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar excluir o registro: '+e.Message);
  end;
end;

function TDAOPedidosItens.Inserir: iDAOEntity<TPedidosItens>;
begin
  Result := Self;
  try
    FConexao
      .SQL('INSERT INTO PEDIDOITENS (ITEM,ID_PEDIDO, PRODUTO, QUANTIDADE) VALUES '+
            '(:ITEM,:ID_PEDIDO,:PRODUTO,:QUANTIDADE)')
      .Params('ITEM',FPedidosItens.Item)
      .Params('ID_PEDIDO', FPedidosItens.IdPedido)
      .Params('PRODUTO',FPedidosItens.Produto)
      .Params('QUANTIDADE',FPedidosItens.Quantidade)
      .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar inserir o registro: '+e.Message);
  end;
end;

function TDAOPedidosItens.Listar: iDAOEntity<TPedidosItens>;
begin
  Result := Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM PEDIDOITENS')
      .Open.DataSet;
end;

function TDAOPedidosItens.ListarPorId(Id: Variant): iDAOEntity<TPedidosItens>;
begin
  Result := Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM PEDIDOITENS WHERE ID_PEDIDO=:ID')
      .Params('ID',id)
      .Open.DataSet;
end;

class function TDAOPedidosItens.New : iDAOEntity<TPedidosItens>;
begin
  Result := Self.Create;
end;

function TDAOPedidosItens.This: TPedidosItens;
begin
  Result := FPedidosItens;
end;

end.
