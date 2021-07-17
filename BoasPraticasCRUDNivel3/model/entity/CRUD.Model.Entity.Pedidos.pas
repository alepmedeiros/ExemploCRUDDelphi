unit CRUD.Model.Entity.Pedidos;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDOS')]
  TPedidos = class
  private
    FDescricao: String;
    FId: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
  public
    [Campo('ID'), PK, AutoInc]
    property Id : Integer read FId write SetId;
    [Campo('DESCRICAO')]
    property Descricao : String read FDescricao write SetDescricao;
  end;

implementation

{ TPedidos }

procedure TPedidos.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPedidos.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
