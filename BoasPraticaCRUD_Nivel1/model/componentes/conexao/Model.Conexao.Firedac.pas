unit Model.Conexao.Firedac;

interface

uses
  System.SysUtils,
  System.Classes,
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.SQLite,
  Firedac.Phys.SQLiteDef,
  Firedac.Stan.ExprFuncs,
  Firedac.Phys.SQLiteWrapper.Stat,
  Firedac.VCLUI.Wait,
  Data.DB,
  Firedac.Comp.Client;

type
  TModelConexaoFiredac = class(TDataModule)
    FDConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelConexaoFiredac: TModelConexaoFiredac;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TModelConexaoFiredac.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Connected := True;
end;

procedure TModelConexaoFiredac.DataModuleDestroy(Sender: TObject);
begin
  FDConnection.DisposeOf;
end;

end.
