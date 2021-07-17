unit Controle.Interfaces;

interface

uses
  Model.DAO.Interfaces, Model.Entidades.PedidosItens, Model.Entidades.Pedidos;

type
  iControleEntidades = interface;

  iControle = interface
    function Entidades : iControleEntidades;
  end;

  iControleEntidades = interface
    function Pedidos : iDAOEntity<TPedidos>;
    function PedidosItens : iDAOEntity<TPedidosItens>;
  end;

implementation

end.
