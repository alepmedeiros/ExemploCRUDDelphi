unit Model.DAOPedido;

interface

uses
  Model.Query.Firedac, Data.DB, Model.Entidade.Pedido;

type
  TModelDAOPedido = class
  private
    FQuery : TModelQueryFiredac;
    FPedido : TPedido;
    FSQL : String;
    FDataSet : TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    function Listar : TModelDAOPedido;
    function Inserir : TModelDAOPedido;
    function Atualizar : TModelDAOPedido;
    function Excluir : TModelDAOPedido;
    function DataSet(Value : TDataSource) : TModelDAOPedido;
    function This(Value : TPedido) : TModelDAOPedido;
  end;

implementation

uses
  System.SysUtils;

{ TModelDAOPedido }

function TModelDAOPedido.Atualizar: TModelDAOPedido;
begin
  Result := Self;
  try
    FSQL := '';
    FSQL := 'UPDATE PEDIDOS SET DESCRICAO='+QuotedStr('%s')+' WHERE ID=%d';
    FQuery
      .SQL(Format(FSQL,[FPedido.Descricao,FPedido.Id]))
      .ExecutaComando;
  except
    raise Exception.Create('Erro ao tentar atualizar o registro');
  end;
end;

constructor TModelDAOPedido.Create;
begin
  FQuery := TModelQueryFiredac.Create(nil);
end;

function TModelDAOPedido.DataSet(Value : TDataSource) : TModelDAOPedido;
begin
  Result := Self;
  if Assigned(FDataSet) then
    Value.DataSet := FDataSet
  else
    Value.DataSet := FQuery.DataSet;
end;

destructor TModelDAOPedido.Destroy;
begin
  inherited;
  FQuery.DEstroy;
  FPedido.DisposeOf;
end;

function TModelDAOPedido.Excluir: TModelDAOPedido;
begin
  Result := Self;
  try
    FSQL := '';
    FSQL := 'DELETE FROM PEDIDOS WHERE ID=%D';
    FQuery
      .SQL(Format(FSQL,[FPedido.Id]))
      .ExecutaComando;
  except
    raise Exception.Create('Erro ao tentar excluir o Pedido');
  end;
end;

function TModelDAOPedido.Inserir: TModelDAOPedido;
begin
  Result := Self;
  try
    FSQL := '';
    FSQL := 'INSERT INTO PEDIDOS (DESCRICAO) VALUES ('+QuotedStr('%s')+')';
    FQuery
      .SQL(Format(FSQL,[FPedido.Descricao]))
      .ExecutaComando;
  except
    raise Exception.Create('Erro ao tentar incluir um Pedido');
  end;
end;

function TModelDAOPedido.Listar: TModelDAOPedido;
begin
  Result := Self;
  FSQL := '';
  FSQL := 'SELECT * FROM PEDIDOS';
  FDataSet := FQuery
                .SQL(FSQL)
                .DataSet;
end;

function TModelDAOPedido.This (Value : TPedido) : TModelDAOPedido;
begin
  FPedido := Value;
end;

end.
