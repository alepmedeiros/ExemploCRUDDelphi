unit Model.Interfaces;

interface

uses
  Model.DAO.Interfaces;

type
  iModelInterface = interface
    function DAO : iDAOFactory;
  end;

implementation

end.
