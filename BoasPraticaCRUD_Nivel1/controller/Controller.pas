unit Controller;

interface

uses
  Model.DAOPedido, Model.DAOPedidoItens, Model.Entidade.Pedido,
  Model.Entidade.PedidoItens;

type
  TController = class
  private
    FDAOPedido : TModelDAOPedido;
    FDAOPedidoItens : TModelDAOPedidoItens;
  public
    constructor Create;
    destructor Destroy; override;
    function Pedido : TPedidoBuilder;
    function PedidoItens : TPedidoIntesBuilder;
    function DAOPedido : TModelDAOPedido;
    function DAOPedidoItens : TModelDAOPedidoItens;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

function TController.DAOPedido: TModelDAOPedido;
begin
  FDAOPedido := TModelDAOPedido.Create;
  Result := FDAOPedido;
end;

function TController.DAOPedidoItens: TModelDAOPedidoItens;
begin
  FDAOPedidoItens := TModelDAOPedidoItens.Create;
  Result := FDAOPedidoItens;
end;

destructor TController.Destroy;
begin
  if Assigned(FDAOPedido) then
    FDAOPedido.DisposeOf;
  if Assigned(FDAOPedidoItens) then
    FDAOPedidoItens.DisposeOf;
  inherited;
end;

function TController.Pedido: TPedidoBuilder;
begin
  Result := TPedidoBuilder.New;
end;

function TController.PedidoItens: TPedidoIntesBuilder;
begin
  Result := TPedidoIntesBuilder.New;
end;

end.
