unit CRUD.Controller.Generic;

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
  FireDAC.Comp.Client,
  CRUD.Controller.Interfaces,
  CRUD.Services.Generic;

type
  TControllerGeneric<T : class, constructor> = class(TInterfacedObject, iControllerServices<T>)
    private
      [weak]
      FParent : iController;
      FService : iService<T>;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iControllerServices<T>;
      function This : iService<T>;
      function &End : iController;
  end;

implementation

function TControllerGeneric<T>.&End: iController;
begin
  Result := FParent;
end;

constructor TControllerGeneric<T>.Create(Parent : iController);
begin
  FParent := Parent;
  FService := TService<T>.New;
end;

destructor TControllerGeneric<T>.Destroy;
begin

  inherited;
end;

class function TControllerGeneric<T>.New(Parent : iController) : iControllerServices<T>;
begin
  Result := Self.Create(Parent);
end;

function TControllerGeneric<T>.This: iService<T>;
begin
  Result := FService;
end;

end.
