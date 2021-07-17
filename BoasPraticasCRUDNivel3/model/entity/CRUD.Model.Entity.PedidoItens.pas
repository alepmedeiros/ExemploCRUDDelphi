unit CRUD.Model.Entity.PedidoItens;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDOITENS')]
  TPedidoItens = class
  private
    FProduto: String;
    FItem: Integer;
    FQuantidade: Integer;
    FIdPedido: Integer;
    procedure SetIdPedido(const Value: Integer);
    procedure SetItem(const Value: Integer);
    procedure SetProduto(const Value: String);
    procedure SetQuantidade(const Value: Integer);
  public
    [Campo('ITEM')]
    property Item : Integer read FItem write SetItem;
    [Campo('ID_PEDIDO'), FK]
    property IdPedido : Integer read FIdPedido write SetIdPedido;
    [Campo('PRODUTO')]
    property Produto : String read FProduto write SetProduto;
    [Campo('QUANTIDADE')]
    property Quantidade : Integer read FQuantidade write SetQuantidade;
  end;

implementation

{ TPedidoItens }

procedure TPedidoItens.SetIdPedido(const Value: Integer);
begin
  FIdPedido := Value;
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

end.
