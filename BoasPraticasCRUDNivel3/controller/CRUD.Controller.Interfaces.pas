unit CRUD.Controller.Interfaces;

interface

uses
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
  FireDAC.Comp.Client,
  CRUD.Services.Generic,
  CRUD.Model.Entity.Pedidos,
  CRUD.Model.Entity.PedidoItens;

type
  iControllerServices<T : class> = interface;

  iController = interface
    function Pedidos : iControllerServices<TPedidos>;
    function PedidoItens : iControllerServices<TPedidoItens>;
  end;

  iControllerServices<T : class> = interface
    function This : iService<T>;
    function &End : iController;
  end;

implementation

end.
