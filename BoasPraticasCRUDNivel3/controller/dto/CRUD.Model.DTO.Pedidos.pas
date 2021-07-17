unit CRUD.Model.DTO.Pedidos;

interface

uses
  CRUD.Model.DTO.Interfaces,
  CRUD.Model.Entity.Pedidos,
  CRUD.Services.Generic;

type
  TPedidosDTO = class(TInterfacedObject, iPedidos)
    private
      FEntidade : TPedidos;
      FId : Integer;
      FDescricao : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPedidos;
      function Id(Value : Integer) : iPedidos; overload;
      function Id : Integer; overload;
      function Descricao(Value : String) : iPedidos; overload;
      function Descricao : String; overload;
  end;

implementation

{ TPedidosDTO }

constructor TPedidosDTO.Create;
begin
  FEntidade := TPedidos.Create;
end;

function TPedidosDTO.Descricao(Value: String): iPedidos;
begin
  Result := Self;
  FDescricao := Value;
end;

function TPedidosDTO.Descricao: String;
begin
  Result := FDescricao;
end;

destructor TPedidosDTO.Destroy;
begin
  FEntidade.DisposeOf;
  inherited;
end;

function TPedidosDTO.Id: Integer;
begin
  Result := FId;
end;

function TPedidosDTO.Id(Value: Integer): iPedidos;
begin
  Result := Self;
  FId := Value;
end;

class function TPedidosDTO.New: iPedidos;
begin
  Result := Self.Create;
end;

end.
