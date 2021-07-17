unit Model.Query.Firedac;

interface

uses
  System.SysUtils,
  System.Classes,
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Param,
  Firedac.Stan.Error,
  Firedac.DatS,
  Firedac.Phys.Intf,
  Firedac.DApt.Intf,
  Firedac.Stan.Async,
  Firedac.DApt,
  Data.DB,
  Firedac.Comp.DataSet,
  Firedac.Comp.Client,
  Model.Conexao.Firedac;

type
  TModelQueryFiredac = class(TDataModule)
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FConexao : TModelConexaoFiredac;
    FSQL : String;
  public
    function SQL(Value : String) : TModelQueryFiredac;
    function ExecutaComando : TModelQueryFiredac;
    function DataSet : TDataSet;
  end;

var
  ModelQueryFiredac: TModelQueryFiredac;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TModelQueryFiredac.DataModuleCreate(Sender: TObject);
begin
  FConexao := TModelConexaoFiredac.Create(nil);
  FDQuery.Connection := FConexao.FDConnection;
end;

procedure TModelQueryFiredac.DataModuleDestroy(Sender: TObject);
begin
  FDQuery.DisposeOf;
  FConexao.Destroy;
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  FDQuery.SQL.Clear;
  FDQuery.Open(FSQL);
  Result := FDQuery;
end;

function TModelQueryFiredac.ExecutaComando: TModelQueryFiredac;
begin
  Result := Self;
  try
    FConexao.FDConnection.StartTransaction;
      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add(FSQL);
      FDQuery.ExecSQL;
    FConexao.FDConnection.Commit;
  except
    FConexao.FDConnection.Rollback;
    raise Exception.Create('Erro ao registrar os dados');
  end;
end;

function TModelQueryFiredac.SQL(Value: String): TModelQueryFiredac;
begin
  Result := Self;
  FSQL := Value;
end;

end.
