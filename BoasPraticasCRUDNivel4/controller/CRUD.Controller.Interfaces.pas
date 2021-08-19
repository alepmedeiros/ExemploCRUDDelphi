unit CRUD.Controller.Interfaces;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client, CRUD.Controller.DTO.Interfaces;

type
  iController = interface
    function Cliente : iClienteDTO;
    function Endereco : iEnderecoDTO;
  end;

implementation

end.
