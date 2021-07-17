unit Model.DAO;

interface

uses
  Data.DB,
  Model.Query.Firedac;

type
  TDAO<T : class> = class
  private
    FParent : T;
  protected
    FQuery : TModelQueryFiredac;
    function Listar : TDAO<T>; virtual; abstract;
    function Inserir : TDAO<T>; virtual; abstract;
    function Atualizar : TDAO<T>; virtual; abstract;
    function Excluir : TDAO<T>; virtual; abstract;
    function DataSet(Value : TDataSource) : TDAO<T>; virtual; abstract;
    function This(Value : T) : TDAO<T>; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TDAO<T> }

constructor TDAO<T>.Create;
begin
  FQuery := TModelQueryFiredac.Create(nil);
end;

destructor TDAO<T>.Destroy;
begin
  FQuery.Destroy;
  inherited;
end;

end.
