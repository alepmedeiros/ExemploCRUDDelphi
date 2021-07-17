unit Model.Entidade.PedidoItens;

interface

type
  TPedidoItens = class
  private
    FProduto: String;
    FItem: Integer;
    FQuantidade: Integer;
    FId_Pedido: Integer;
    procedure SetId_Pedido(const Value: Integer);
    procedure SetItem(const Value: Integer);
    procedure SetProduto(const Value: String);
    procedure SetQuantidade(const Value: Integer);
  public
    property Item : Integer read FItem write SetItem;
    property Id_Pedido : Integer read FId_Pedido write SetId_Pedido;
    property Produto : String read FProduto write SetProduto;
    property Quantidade : Integer read FQuantidade write SetQuantidade;
  end;

  TPedidoIntesBuilder = class(TPedidoItens)
  private
  public
    class function New : TPedidoIntesBuilder;
    function Item(Value : Integer) : TPedidoIntesBuilder;
    function IdPedido(Value : Integer) : TPedidoIntesBuilder;
    function Produto(Value : String) : TPedidoIntesBuilder;
    function Quantidade(Value : Integer) : TPedidoIntesBuilder;
  end;

implementation

{ TPedidoItens }

procedure TPedidoItens.SetId_Pedido(const Value: Integer);
begin
  FId_Pedido := Value;
end;

procedure TPedidoItens.SetItem(const Value: Integer);
begin
  FItem := Value;
end;

procedure TPedidoItens.SetProduto(const Value: String);
begin
  FProduto := Value;
end;

procedure TPedidoItens.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

{ TBuilder }

function TPedidoIntesBuilder.IdPedido(Value: Integer): TPedidoIntesBuilder;
begin
  Result := Self;
  Self.FId_Pedido := Value;
end;

function TPedidoIntesBuilder.Item(Value: Integer): TPedidoIntesBuilder;
begin
  Result := Self;
  Self.FItem := Value;
end;

class function TPedidoIntesBuilder.New: TPedidoIntesBuilder;
begin
  Result := Self.Create;
end;

function TPedidoIntesBuilder.Produto(Value: String): TPedidoIntesBuilder;
begin
  Result := Self;
  Self.FProduto := Value;
end;

function TPedidoIntesBuilder.Quantidade(Value: Integer): TPedidoIntesBuilder;
begin
  Result := Self;
  Self.FQuantidade := Value;
end;

end.
