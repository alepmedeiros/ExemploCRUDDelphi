unit CRUD.Model.DTO.Interfaces;

interface

uses
  CRUD.Services.Generic,
  CRUD.Model.Entity.Pedidos,
  CRUD.Model.Entity.PedidoItens;

type
  iPedidos = interface
    function Id(Value : Integer) : iPedidos; overload;
    function Id : Integer; overload;
    function Descricao(Value : String) : iPedidos; overload;
    function Descricao : String; overload;
  end;

  iPedidoItens = interface
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

end.
