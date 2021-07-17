unit Model.Conexao.Interfaces;

interface

uses
  Data.DB,
  System.Classes;

type
  iConexao = interface
    function Params (Param : String; Value : Variant) : iConexao; overload;
    function DataSet(DataSource : TDataSource) : iConexao; overload;
    function DataSet : TDataSet; overload;
    function ExecSQL : iConexao;
    function Open : iConexao;
    function SQL (Value : String) : iConexao;
  end;

implementation

end.
