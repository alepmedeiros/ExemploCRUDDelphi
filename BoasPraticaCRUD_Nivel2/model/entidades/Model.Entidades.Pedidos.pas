unit Model.Entidades.Pedidos;

interface

uses
  Model.DAO.Interfaces;

type
  TPedidos = class
  private
    [weak]
    FParent : iDAOEntity<TPedidos>;
    FDescricao: String;
    FId: Integer;
  public
    constructor Create(Parent : iDAOEntity<TPedidos>);
    destructor Destroy; override;
    function Id(Value : Integer) : TPedidos; overload;
    function Id : Integer; overload;
    function Descricao(Value : String) : TPedidos; overload;
    function Descricao : String; overload;
    function &End : iDAOEntity<TPedidos>;
  end;

implementation

{ TPedidos }

function TPedidos.&End: iDAOEntity<TPedidos>;
begin
  Result := FParent;
end;

constructor TPedidos.Create(Parent: iDAOEntity<TPedidos>);
begin
  FParent := Parent;
end;

function TPedidos.Descricao(Value: String): TPedidos;
begin
  Result := Self;
  FDescricao := Value;
end;

function TPedidos.Descricao: String;
begin
  Result := FDescricao;
end;

destructor TPedidos.Destroy;
begin
  inherited;
end;

function TPedidos.Id(Value: Integer): TPedidos;
begin
  Result := Self;
  FId := Value;
end;

function TPedidos.Id: Integer;
begin
  Result := FId;
end;

end.
