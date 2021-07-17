unit Model.Factory.Entidades;

interface

uses
  Model.Entidade.Pedido,
  Model.Entidade.PedidoItens;

type
  TModelFactoryEntidades = class
  private
    FPedido : TPedido;
    FPedidoItens : TPedidoItens;
  public
    constructor Create;
    destructor Destroy; override;
    function Pedidos : TPedido;
    function PedidoItens : TPedidoItens;
  end;

implementation

{ TModelFactoryEntidades }

constructor TModelFactoryEntidades.Create;
begin

end;

destructor TModelFactoryEntidades.Destroy;
begin
  FPedido.DisposeOf;
  FPedidoItens.DisposeOf;
  inherited;
end;

function TModelFactoryEntidades.PedidoItens: TPedidoItens;
begin
  FPedidoItens := TPedidoItens.Create;
  Result := FPedidoItens;
end;

function TModelFactoryEntidades.Pedidos: TPedido;
begin
  FPedido := TPedido.Create;
  Result := FPedido;
end;

end.
