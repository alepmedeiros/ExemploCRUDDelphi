unit CRUD.Model.DTO.PedidoItens;

interface

uses
  CRUD.Model.DTO.Interfaces,
  CRUD.Model.Entity.PedidoItens;

type
  TPedidoItensDTO = class(TInterfacedObject, iPedidoItens)
    private
      FEntidade : TPedidoItens;
      FItem : Integer;
      FIdPedido : Integer;
      FProduto : String;
      FQuantidade : Integer;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPedidoItens;
      function Item(Value : Integer) : iPedidoItens; overload;
      function Item : Integer; overload;
      function IdPedido(Value : Integer) : iPedidoItens; overload;
      function IdPedido : Integer; overload;
      function Produto(Value : String) : iPedidoItens; overload;
      function Produto : String; overload;
      function Quantidade(Value : Integer) : iPedidoItens; overload;
      function Quantidade : Integer; overload;
  end;

implementation

{ TPedidoItensDTO }

constructor TPedidoItensDTO.Create;
begin
  FEntidade := TPedidoItens.Create;
end;

destructor TPedidoItensDTO.Destroy;
begin
  FEntidade.DisposeOf;
  inherited;
end;

function TPedidoItensDTO.IdPedido: Integer;
begin
  Result := FIdPedido;
end;

function TPedidoItensDTO.IdPedido(Value: Integer): iPedidoItens;
begin
  Result := Self;
  FIdPedido := Value;
end;

function TPedidoItensDTO.Item(Value: Integer): iPedidoItens;
begin
  Result := Self;
  FItem := Value;
end;

function TPedidoItensDTO.Item: Integer;
begin
  Result := FItem;
end;

class function TPedidoItensDTO.New: iPedidoItens;
begin
  Result := Self.Create;
end;

function TPedidoItensDTO.Produto(Value: String): iPedidoItens;
begin
  Result := Self;
  FProduto := Value;
end;

function TPedidoItensDTO.Produto: String;
begin
  Result := FProduto;
end;

function TPedidoItensDTO.Quantidade(Value: Integer): iPedidoItens;
begin
  Result := Self;
  FQuantidade := Value;
end;

function TPedidoItensDTO.Quantidade: Integer;
begin
  Result := FQuantidade;
end;

end.
