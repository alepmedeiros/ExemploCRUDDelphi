unit CRUD.Controller;

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
  CRUD.Controller.Interfaces,
  CRUD.Controller.Generic,
  CRUD.Model.Entity.Pedidos,
  CRUD.Model.Entity.PedidoItens;

type
  TController = class(TInterfacedObject, iController)
    private
      FPedidos : iControllerServices<TPedidos>;
      FPedidoItens : iControllerServices<TPedidoItens>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function Pedidos : iControllerServices<TPedidos>;
      function PedidoItens : iControllerServices<TPedidoItens>;
  end;

implementation

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New : iController;
begin
  Result := Self.Create;
end;

function TController.PedidoItens: iControllerServices<TPedidoItens>;
begin
  if not Assigned(FPedidoItens) then
    FPedidoItens := TControllerGeneric<TPedidoItens>.New(Self);
  Result := FPedidoItens;
end;

function TController.Pedidos: iControllerServices<TPedidos>;
begin
  if not Assigned(FPedidos) then
    FPedidos := TControllerGeneric<TPedidos>.New(Self);
  Result := FPedidos;
end;

end.
