unit Model.DAOPedidoItens;

interface

uses
  Model.Query.Firedac, Data.DB, Model.Entidade.PedidoItens;

type
  TModelDAOPedidoItens = class
  private
    FQuery : TModelQueryFiredac;
    FPedidoItens : TPedidoItens;
    FSQL : String;
    FDataSet : TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    function Listar : TModelDAOPedidoItens;
    function ListarPorId(Id : Integer) : TModelDAOPedidoItens;
    function Inserir : TModelDAOPedidoItens;
    function Atualizar : TModelDAOPedidoItens;
    function Excluir : TModelDAOPedidoItens;
    function DataSet(Value : TDataSource) : TModelDAOPedidoItens;
    function This(Value : TPedidoIntesBuilder) : TModelDAOPedidoItens;
  end;

implementation

uses
  System.SysUtils;

{ TModelDAOPedidoItens }

function TModelDAOPedidoItens.Atualizar: TModelDAOPedidoItens;
begin
  Result := Self;
  try
    FSQL := '';
    FSQL := 'UPDATE PEDIDOITENS SET '+
            'PRODUTO='+QuotedStr('%s')+
            ',QUANTIDADE=%d'+
            ' WHERE ID_PEDIDO=%d'+
            ' AND ITEM=%d';
    FQuery
      .SQL(Format(FSQL,[FPedidoItens.Produto,FPedidoItens.Quantidade,
              FPedidoItens.Id_Pedido, FPedidoItens.Item]))
      .ExecutaComando;
  except
    raise Exception.Create('Erro ao tentar atualizar o registro');
  end;
end;

constructor TModelDAOPedidoItens.Create;
begin
  FQuery := TModelQueryFiredac.Create(nil);
end;

function TModelDAOPedidoItens.DataSet(Value : TDataSource) : TModelDAOPedidoItens;
begin
  Result := Self;
  if Assigned(FDataSet) then
    Value.DataSet := FDataSet
  else
    Value.DataSet := FQuery.DataSet;
end;

destructor TModelDAOPedidoItens.Destroy;
begin
  inherited;
  FQuery.Destroy;
  FPedidoItens.DisposeOf;
end;

function TModelDAOPedidoItens.Excluir: TModelDAOPedidoItens;
begin
  Result := Self;
  try
    FSQL := '';
    FSQL := 'DELETE FROM PEDIDOITENS WHERE ID_PEDIDO=%D AND ITEM=%D';
    FQuery
      .SQL(Format(FSQL,[FPedidoItens.Id_Pedido,FPedidoItens.Item]))
      .ExecutaComando;
  except
    raise Exception.Create('Erro ao tentar excluir o Pedido');
  end;
end;

function TModelDAOPedidoItens.Inserir: TModelDAOPedidoItens;
begin
  Result := Self;
  try
    FSQL := '';
    FSQL := 'INSERT INTO PEDIDOITENS VALUES '+
            '(%d,%d,'+QuotedStr('%s')+',%d)';
    FQuery
      .SQL(Format(FSQL,[FPedidoItens.Item,FPedidoItens.Id_Pedido,
                  FPedidoItens.Produto,FPedidoItens.Quantidade]))
      .ExecutaComando;
  except
    raise Exception.Create('Erro ao tentar incluir um Pedido');
  end;
end;

function TModelDAOPedidoItens.Listar: TModelDAOPedidoItens;
begin
  Result := Self;
  FSQL := '';
  FSQL := 'SELECT * FROM PEDIDOITENS';
  FDataSet := FQuery
                .SQL(FSQL)
                .DataSet;
end;

function TModelDAOPedidoItens.ListarPorId(Id: Integer): TModelDAOPedidoItens;
begin
  Result := Self;
  FSQL := '';
  FSQL := 'SELECT * FROM PEDIDOITENS WHERE ID_PEDIDO=%d';
  FDataSet := FQuery
                .SQL(Format(FSQL,[Id]))
                .DataSet;
end;

function TModelDAOPedidoItens.This(Value : TPedidoIntesBuilder) : TModelDAOPedidoItens;
begin
  FPedidoItens := Value;
end;

end.
