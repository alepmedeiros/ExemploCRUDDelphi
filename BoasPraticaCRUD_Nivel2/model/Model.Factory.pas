unit Model.Factory;

interface

uses
  Model.Interfaces,
  Model.DAO.Factory,
  Model.DAO.Interfaces;

type
  TModelFactory = class(TInterfacedObject, iModelInterface)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelInterface;
      function DAO : iDAOFactory;
  end;

implementation

constructor TModelFactory.Create;
begin

end;

function TModelFactory.DAO: iDAOFactory;
begin
  Result := TDAOFactory.New;
end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

class function TModelFactory.New : iModelInterface;
begin
  Result := Self.Create;
end;

end.
