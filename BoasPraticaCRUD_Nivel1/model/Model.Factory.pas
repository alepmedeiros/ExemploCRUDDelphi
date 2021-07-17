unit Model.Factory;

interface

uses
  Model.DAOPedido,
  Model.DAOPedidoItens;

type
  TModelFactory = class
  private
    FDAOPedido      : TModelDAOPedido;
    FDAOPedidoItens : TModelDAOPedidoItens;
  public
    constructor Create
    destructor Destroy; override;
    function DAOPedido : TModelDAOPedido;
    function DAOPedidoItens : TModelDAOPedidoItens;
  end;

implementation

{ TModelFactory }

constructor TModelFactory.Create;
begin

end;

function TModelFactory.DAOPedido: TModelDAOPedido;
begin
  FDAOPedido := TModelDAOPedido.Create(FEntidade.Pedidos);
  Result := FDAOPedido
end;

function TModelFactory.DAOPedidoItens: TModelDAOPedidoItens;
begin
  FDAOPedidoItens := TModelDAOPEdidoItens.Create(FEntidade.PedidoItens);
  Result := FDAOPedidoItens;
end;

destructor TModelFactory.Destroy;
begin
  FEntidade.DisposeOf;
  FDAOPedido.DisposeOf;
  FDAOPedidoItens.DisposeOf;
  inherited;
end;

function TModelFactory.Entidades: TModelFactoryEntidades;
begin
  FEntidade := TModelFactoryEntidades.Create;
end;

end.
