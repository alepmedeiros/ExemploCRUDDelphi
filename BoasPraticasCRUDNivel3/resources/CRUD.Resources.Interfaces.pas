unit CRUD.Resources.Interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    function Connect : TCustomConnection;
  end;

implementation

end.
