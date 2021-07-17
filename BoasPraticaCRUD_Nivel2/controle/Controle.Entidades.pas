unit Controle.Entidades;

interface

uses
  Controle.Interfaces,
  Model.DAO.Interfaces,
  Model.Entidades.Pedidos,
  Model.Entidades.PedidosItens,
  Model.DAOPedidosItens,
  Model.DAOPedidos;

type
  TControleEntidades = class(TInterfacedObject, iControleEntidades)
    private
      FPedidos : iDAOEntity<TPedidos>;
      FPedidosItens : iDAOEntity<TPedidosItens>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControleEntidades;
      function Pedidos : iDAOEntity<TPedidos>;
      function PedidosItens : iDAOEntity<TPedidosItens>;
  end;

implementation

constructor TControleEntidades.Create;
begin

end;

destructor TControleEntidades.Destroy;
begin

  inherited;
end;

class function TControleEntidades.New : iControleEntidades;
begin
  Result := Self.Create;
end;

function TControleEntidades.Pedidos: iDAOEntity<TPedidos>;
begin
  if not Assigned(FPedidos) then
    FPedidos := TDAOPedido.New;
  Result := FPedidos;
end;

function TControleEntidades.PedidosItens: iDAOEntity<TPedidosItens>;
begin
  if not Assigned(FPedidosItens) then
    FPedidosItens := TDAOPedidosItens.New;
  Result := FPedidosItens;
end;

end.
