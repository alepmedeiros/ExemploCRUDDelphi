unit Model.Entidades.PedidosItens;

interface

uses
  Model.DAO.Interfaces;

type
  TPedidosItens = class
  private
    [weak]
    FParent : iDAOEntity<TPedidosItens>;
    FProduto: String;
    FItem: Integer;
    FQuantidade: Integer;
    FIdPedido: Integer;
  public
    constructor Create(Parent : iDAOEntity<TPedidosItens>);
    destructor Destroy; override;
    function Item(Value : Integer) : TPedidosItens; overload;
    function Item : Integer; overload;
    function IdPedido(Value : Integer) : TPedidosItens; overload;
    function IdPedido : Integer; overload;
    function Produto(Value : String) : TPedidosItens; overload;
    function Produto : String; overload;
    function Quantidade(Value : Integer) : TPedidosItens; overload;
    function Quantidade : Integer; overload;
    function &End : iDAOEntity<TPedidosItens>;
  end;

implementation

{ TPedidosItens }

constructor TPedidosItens.Create(Parent: iDAOEntity<TPedidosItens>);
begin
  FParent := Parent;
end;

destructor TPedidosItens.Destroy;
begin

  inherited;
end;

function TPedidosItens.&End: iDAOEntity<TPedidosItens>;
begin
  Result := FParent;
end;

function TPedidosItens.IdPedido(Value: Integer): TPedidosItens;
begin
  Result := Self;
  FIdPedido := Value;
end;

function TPedidosItens.IdPedido: Integer;
begin
  Result := FIdPedido;
end;

function TPedidosItens.Item: Integer;
begin
  Result := FItem;
end;

function TPedidosItens.Item(Value: Integer): TPedidosItens;
begin
  Result := Self;
  FItem := Value;
end;

function TPedidosItens.Produto: String;
begin
  Result := FProduto;
end;

function TPedidosItens.Produto(Value: String): TPedidosItens;
begin
  Result := Self;
  FProduto := Value;
end;

function TPedidosItens.Quantidade(Value: Integer): TPedidosItens;
begin
  Result := Self;
  FQuantidade := Value;
end;

function TPedidosItens.Quantidade: Integer;
begin
  Result := FQuantidade;
end;

end.
