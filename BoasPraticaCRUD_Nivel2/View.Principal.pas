unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Controle.Interfaces, Controle.Controle;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    edtDescricao: TEdit;
    btnAddPedido: TButton;
    Panel6: TPanel;
    grdPedido: TDBGrid;
    Panel7: TPanel;
    edtQuantidade: TEdit;
    edtProduto: TEdit;
    btnAddProduto: TButton;
    Panel8: TPanel;
    grdPedidoitens: TDBGrid;
    dsPedido: TDataSource;
    dsPedidoItens: TDataSource;
    btnCancelar: TButton;
    btnListar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure grdPedidoCellClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure grdPedidoitensCellClick(Column: TColumn);
    procedure grdPedidoDblClick(Sender: TObject);
  private
    FControle : iControle;
    procedure ListarTodos;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses View.Editar;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
  if grdPedido.SelectedRows.Count>0 then begin
    FControle
      .Entidades
      .Pedidos
        .This
          .Id(dsPedido.DataSet.FieldByName('ID').AsInteger)
        .&End
      .Excluir;
    grdPedido.SelectedRows.Clear;
  end else if grdPedidoitens.SelectedRows.Count>0 then begin
    FControle
      .Entidades
      .PedidosItens
        .This
          .Item(dsPedidoItens.DataSet.FieldByName('Item').AsInteger)
          .IdPedido(dsPedidoItens.DataSet.FieldByName('ID_Pedido').AsInteger)
        .&End
      .Excluir;
    grdPedidoitens.SelectedRows.Clear;
  end;
  ListarTodos;
end;

procedure TForm1.btnListarClick(Sender: TObject);
begin
  ListarTodos;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FControle := TControle.New;
end;

procedure TForm1.grdPedidoCellClick(Column: TColumn);
begin
  grdPedidoitens.SelectedRows.Clear;
  grdPedido.SelectedRows.CurrentRowSelected := True;
  FControle
    .Entidades
    .PedidosItens
    .ListarPorId(dsPedido.DataSet.FieldByName('ID').AsInteger)
    .DataSet(dsPedidoItens);
end;

procedure TForm1.grdPedidoDblClick(Sender: TObject);
var
  lEditar : TForm2;
begin
  lEditar := TForm2.Create(nil);
  try
    lEditar.dsPedidos := dsPedido;
    lEditar.dsPedidosItens := dsPedidoItens;
    lEditar.ShowModal;
    ListarTodos;
  finally
    lEditar.Destroy;
  end;
end;

procedure TForm1.grdPedidoitensCellClick(Column: TColumn);
begin
  grdPedido.SelectedRows.Clear;
  grdPedidoitens.SelectedRows.CurrentRowSelected := true;
end;

procedure TForm1.ListarTodos;
begin
  FControle.Entidades.Pedidos.Listar.DataSet(dsPedido);
  FControle.Entidades.PedidosItens.Listar.DataSet(dsPedidoItens);
end;

end.
