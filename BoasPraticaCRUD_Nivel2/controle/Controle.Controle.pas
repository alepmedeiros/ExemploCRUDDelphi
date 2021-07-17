unit Controle.Controle;

interface

uses
  Controle.Interfaces,
  Controle.Entidades;

type
  TControle = class(TInterfacedObject, iControle)
    private
      FEntidades : iControleEntidades;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControle;
      function Entidades : iControleEntidades;
  end;

implementation

constructor TControle.Create;
begin

end;

destructor TControle.Destroy;
begin

  inherited;
end;

function TControle.Entidades: iControleEntidades;
begin
  if not Assigned(FEntidades) then
    FEntidades := TControleEntidades.New;
  Result := FEntidades;
end;

class function TControle.New : iControle;
begin
  Result := Self.Create;
end;

end.
