unit View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Controller,
  Vcl.Buttons,
  System.Generics.Collections, View.Pedido, View.PedidoItens;

type
  TViewPrincipal = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsPedido: TDataSource;
    dsPedidoItens: TDataSource;
    btnEcluir: TButton;
    btnListar: TButton;
    Panel4: TPanel;
    edtDescricao: TLabeledEdit;
    Panel5: TPanel;
    edtProduto: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    btnAddPedido: TSpeedButton;
    btnAddPedidoItens: TSpeedButton;
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEcluirClick(Sender: TObject);
    procedure btnAddPedidoClick(Sender: TObject);
    procedure btnAddPedidoItensClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    FController : TController;
    procedure ListarDados(Value : Integer = 0);
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.btnAddPedidoClick(Sender: TObject);
begin
  FController.DAOPedido
    .This(FController
          .Pedido
          .Descricao(edtDescricao.Text))
    .Inserir;
  ListarDados;
end;

procedure TViewPrincipal.btnAddPedidoItensClick(Sender: TObject);
var
  I:Integer;
begin
  dsPedidoItens.DataSet.Last;
  I := dsPedidoItens.DataSet.FieldByName('Item').AsInteger+1;
  FController
    .DAOPedidoItens
    .This(
      FController
      .PedidoItens
      .Item(I)
      .IdPedido(DBGrid1.DataSource.DataSet.FieldByName('Id').AsInteger)
      .Produto(edtProduto.Text)
      .Quantidade(StrToInt(edtQuantidade.Text))).Inserir;
  ListarDados(dsPedido.DataSet.FieldByName('ID').AsInteger);
end;

procedure TViewPrincipal.btnEcluirClick(Sender: TObject);
begin
  if DBGrid1.SelectedRows.Count>0 then begin
    FController
      .DAOPedido
      .This(FController
              .Pedido
                  .id(DBGrid1.DataSource.DataSet.FieldByName('Id').AsInteger))
      .Excluir;
    DBGrid1.SelectedRows.Clear;
  end
  else if DBGrid2.SelectedRows.Count>0 then begin
    FController
      .DAOPedidoItens
      .This(FController
              .PedidoItens
                  .IdPedido(DBGrid2.DataSource.DataSet.FieldByName('Id_pedido').AsInteger)
                  .Item(DBGrid2.DataSource.DataSet.FieldByName('Item').AsInteger))
      .Excluir;
    DBGrid2.SelectedRows.Clear;
  end;
  ListarDados;
end;

procedure TViewPrincipal.btnListarClick(Sender: TObject);
begin
  ListarDados;
end;

procedure TViewPrincipal.DBGrid1CellClick(Column: TColumn);
begin
  DBGrid1.SelectedRows.CurrentRowSelected := true;
  edtDescricao.Text := DBGrid1.DataSource.DataSet.FieldByName('Descricao').AsString;
  FController
    .DAOPedidoItens
      .ListarPorId(DBGrid1.DataSource.DataSet.FieldByName('Id').AsInteger)
      .DataSet(dsPedidoItens);
end;

procedure TViewPrincipal.DBGrid1DblClick(Sender: TObject);
var
  vPedido : TViewPedidos;
begin
  vPedido := TViewPedidos.Create(nil);
  try
    vPedido.edtId.Text := DBGrid1.DataSource.DataSet.FieldByName('Id').AsString;
    vPedido.edtDescricao.Text := DBGrid1.DataSource.DataSet.FieldByName('Descricao').AsString;
    vPedido.ShowModal;
    ListarDados;
  finally
    vPedido.Destroy;
  end;
end;

procedure TViewPrincipal.DBGrid2CellClick(Column: TColumn);
begin
  DBGrid2.SelectedRows.CurrentRowSelected := true;
  edtProduto.Text := DBGrid2.DataSource.DataSet.FieldByName('Produto').AsString;
  edtQuantidade.Text := DBGrid2.DataSource.DataSet.FieldByName('Quantidade').AsString;
end;

procedure TViewPrincipal.DBGrid2DblClick(Sender: TObject);
var
  vPedidoItens : TViewPedidoItens;
begin
  vPedidoItens := TViewPedidoItens.Create(nil);
  try
    vPedidoItens.edtItem.Text := DBGrid2.DataSource.DataSet.FieldByName('Item').AsString;
    vPedidoItens.edtPedido.Text := DBGrid2.DataSource.DataSet.FieldByName('Id_Pedido').AsString;
    vPedidoItens.edtProduto.Text := DBGrid2.DataSource.DataSet.FieldByName('Produto').AsString;
    vPedidoItens.edtQuantidade.Text := DBGrid2.DataSource.DataSet.FieldByName('Quantidade').AsString;
    vPedidoItens.ShowModal;
    ListarDados;
  finally
    vPedidoItens.Destroy;
  end;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController.Destroy;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

procedure TViewPrincipal.ListarDados(Value : Integer = 0);
begin
  FController
    .DAOPedido
    .Listar
      .DataSet(dsPedido);
  if Value > 0 then
    FController
      .DAOPedidoItens
        .ListarPorId(Value)
        .DataSet(dsPedidoItens)
  else
    FController
      .DAOPedidoItens
      .Listar
        .DataSet(dsPedidoItens);
end;

end.
