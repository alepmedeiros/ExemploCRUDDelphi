unit Model.DAO.Interfaces;

interface

uses
  Data.DB;

type
  iDAOEntity<T> = interface
    function Listar : iDAOEntity<T>;
    function ListarPorId(Id : Variant) : iDAOEntity<T>;
    function Excluir(Id : Integer) : iDAOEntity<T>; overload;
    function Excluir : iDAOEntity<T>; overload;
    function Atualizar : iDAOEntity<T>;
    function Inserir : iDAOEntity<T>;
    function DataSet(DataSource : TDataSource) : iDAOEntity<T>;
    function This : T;
  end;

implementation

end.
