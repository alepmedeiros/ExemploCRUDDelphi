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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  CRUD.Controller.Interfaces,
  Vcl.Buttons,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, CRUD.Controller;

type
  TForm1 = class(TForm)
    grdPedido: TDBGrid;
    grdPedidoItens: TDBGrid;
    dsPedido: TDataSource;
    dsPedidoItens: TDataSource;
    btnListar: TButton;
    edtpedido: TEdit;
    btnaddpedido: TSpeedButton;
    edtproduto: TEdit;
    edtquantidade: TEdit;
    btnaddproduto: TSpeedButton;
    btnExcluir: TButton;
    btnAtualizar: TButton;
    btnSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnaddpedidoClick(Sender: TObject);
    procedure btnaddprodutoClick(Sender: TObject);
    procedure grdPedidoCellClick(Column: TColumn);
    procedure grdPedidoItensCellClick(Column: TColumn);
  private
    FController : iController;
    procedure PreencherDataset;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnaddpedidoClick(Sender: TObject);
begin
  dsPedido.DataSet.Edit;
  dsPedido.DataSet.Append;
  dsPedido.DataSet.FieldByName('DESCRICAO').AsString := edtpedido.Text;
end;

procedure TForm1.btnaddprodutoClick(Sender: TObject);
var
  I:Integer;
begin
  I := dsPedidoItens.DataSet.FieldByName('ITEM').AsInteger +1;
  dsPedidoItens.DataSet.Edit;
  dsPedidoItens.DataSet.Append;
  dsPedidoItens.DataSet.FieldByName('ITEM').AsInteger := I;
  dsPedidoItens.DataSet.FieldByName('ID_PEDIDO').AsInteger :=
    dsPedido.DataSet.FieldByName('ID').AsInteger;
  dsPedidoItens.DataSet.FieldByName('PRODUTO').AsString := edtproduto.Text;
  dsPedidoItens.DataSet.FieldByName('QUANTIDADE').AsInteger := StrToInt(edtquantidade.Text);
end;

procedure TForm1.btnAtualizarClick(Sender: TObject);
begin
  if grdPedido.SelectedRows.CurrentRowSelected then
  begin
    FController.Pedidos.This.Entity.Id := dsPedido.DataSet.FieldByName('ID').AsInteger;
    FController.Pedidos.This.Entity.Descricao := edtpedido.Text;
    FController.Pedidos.This.Atualizar;
  end else begin
    FController.PedidoItens.This.Entity.Produto := edtproduto.Text;
    FController.PedidoItens.This.Entity.Quantidade := StrToInt(edtquantidade.Text);
    FController.PedidoItens.This.Atualizar;
  end;
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
  FController
    .Pedidos
      .This
        .Excluir('ID',dsPedido.DataSet.FieldByName('ID').AsString);
  PreencherDataset;
end;

procedure TForm1.btnListarClick(Sender: TObject);
begin
  PreencherDataset;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  dsPedido.DataSet.Filter := 'ID<0';
  dsPedido.DataSet.Filtered := True;

  FController.Pedidos.This.Entity.Descricao :=
    dsPedido.DataSet.FieldByName('DESCRICAO').AsString;
  FController.Pedidos.This.Inserir;

  dsPedido.DataSet := FController.Pedidos.This.Listar;
  dsPedido.DataSet.Last;

  dsPedidoItens.DataSet.Filter := 'ID_PEDIDO<0';
  dsPedidoItens.DataSet.Filtered := True;

  dsPedidoItens.DataSet.First;
  while not dsPedidoItens.DataSet.Eof do
  begin
    FController.PedidoItens.This.Entity.Item := dsPedidoItens.DataSet.FieldByName('ITEM').AsInteger;
    FController.PedidoItens.This.Entity.IdPedido := dsPedido.DataSet.FieldByName('ID').AsInteger;
    FController.PedidoItens.This.Entity.Produto := dsPedidoItens.DataSet.FieldByName('PRODUTO').AsString;
    FController.PedidoItens.This.Entity.Quantidade := dsPedidoItens.DataSet.FieldByName('QUANTIDADE').AsInteger;
    FController.PedidoItens.This.Inserir;
    dsPedidoItens.DataSet.Next;
  end;

  PreencherDataset;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  PreencherDataset;
end;

procedure TForm1.grdPedidoCellClick(Column: TColumn);
begin
  edtpedido.Text := dsPedido.DataSet.Fields[1].AsString;

  grdPedidoItens.SelectedRows.Clear;

  grdPedido.SelectedRows.CurrentRowSelected := True;

  FController.PedidoItens.This.ListarPorFiltro('ID_PEDIDO', dsPedido.DataSet.fields[0].AsInteger);
end;

procedure TForm1.grdPedidoItensCellClick(Column: TColumn);
begin
  edtproduto.Text := dsPedidoItens.DataSet.FieldByName('PRODUTO').AsString;
  edtquantidade.Text := dsPedidoItens.DataSet.FieldByName('QUANTIDADE').AsString;
  grdPedido.SelectedRows.Clear;
  grdPedidoItens.SelectedRows.CurrentRowSelected := True;
end;

procedure TForm1.PreencherDataset;
begin
  dsPedido.DataSet := FController.Pedidos.This.Listar;
  dsPedidoItens.DataSet := FController.PedidoItens.This
    .ListarPorFiltro('ID_PEDIDO',dsPedido.DataSet.FieldByName('ID').AsInteger);
end;

end.
