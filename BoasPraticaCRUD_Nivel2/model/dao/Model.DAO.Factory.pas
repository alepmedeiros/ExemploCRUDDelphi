unit Model.DAO.Factory;

interface

uses
  Model.DAO.Interfaces,
  Model.Entidades.Pedidos,
  Model.Entidades.PedidosItens,
  Model.DAOPedidosItens,
  Model.DAOPedidos;

type
  TDAOFactory = class(TInterfacedObject, iDAOFactory)
    private
      FPedidos : iDAOEntity<TPedidos>;
      FPedidosItens : iDAOEntity<TPedidosItens>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOFactory;
      function Pedido : iDAOEntity<TPedidos>;
      function PedidoItens : iDAOEntity<TPedidosItens>;
  end;

implementation

constructor TDAOFactory.Create;
begin

end;

destructor TDAOFactory.Destroy;
begin

  inherited;
end;

class function TDAOFactory.New : iDAOFactory;
begin
  Result := Self.Create;
end;

function TDAOFactory.Pedido: iDAOEntity<TPedidos>;
begin
  if not Assigned(FPedidos) then
    FPedidos := TDAOPedido.Create;
  Result := FPedidos;
end;

function TDAOFactory.PedidoItens: iDAOEntity<TPedidosItens>;
begin
  if not Assigned(FPedidosItens) then
    FPedidosItens := TDAOPedidosItens.Create;
  Result := FPedidosItens;
end;

end.
