unit Model.Entidade.Pedido;

interface

type
  TPedido = class
  private
    FDescricao: String;
    FId: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
  public
    property Id : Integer read FId write SetId;
    property Descricao : String read FDescricao write SetDescricao;
  end;

  TPedidoBuilder = class(TPedido)
    private
    public
      class function New : TPedidoBuilder;
      function id(Value : Integer) : TPedidoBuilder;
      function Descricao(Value : String) : TPedidoBuilder;
  end;

implementation

{ TPedido }

procedure TPedido.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPedido.SetId(const Value: Integer);
begin
  FId := Value;
end;

{ TBuilder }

function TPedidoBuilder.Descricao(Value: String): TPedidoBuilder;
begin
  Result := Self;
  Self.FDescricao := VAlue;
end;

function TPedidoBuilder.id(Value: Integer): TPedidoBuilder;
begin
  Result := Self;
  Self.FId := VAlue;
end;

class function TPedidoBuilder.New: TPedidoBuilder;
begin
  Result := Self.Create;
end;

end.
