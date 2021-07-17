unit View.Editar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Controle.Interfaces, Controle.Controle;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    edtDescricao: TEdit;
    Panel5: TPanel;
    edtQuantidade: TEdit;
    edtProduto: TEdit;
    Panel6: TPanel;
    lvPedidoItens: TListView;
    dsPedidosItens: TDataSource;
    dsPedidos: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure lvPedidoItensDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FControle : iControle;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  FControle
    .Entidades
    .Pedidos
      .This
        .Id(dsPedidos.DataSet.FieldByName('Id').AsInteger)
        .Descricao(edtDescricao.Text)
      .&End
    .Atualizar;

    FControle
      .Entidades
      .PedidosItens
        .This
          .Item(lvPedidoItens.Items[lvPedidoItens.ItemIndex].Caption.ToInteger)
          .IdPedido(dsPedidos.DataSet.FieldByName('ID').AsInteger)
          .Produto(edtProduto.Text)
          .Quantidade(StrToInt(edtQuantidade.Text))
        .&End
      .Atualizar;
    Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FControle := TControle.Create;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  itens : TListItem;
begin
  edtDescricao.Text := dsPedidos.DataSet.FieldByName('Descricao').AsString;

  if Assigned(dsPedidosItens) then begin
    lvPedidoItens.Clear;
    while not dsPedidosItens.DataSet.Eof do begin
      itens := lvPedidoItens.Items.Add;
      itens.Caption := dsPedidosItens.DataSet.FieldByName('Item').AsString;
      itens.SubItems.Add(dsPedidosItens.DataSet.FieldByName('Produto').AsString);
      itens.SubItems.Add(dsPedidosItens.DataSet.FieldByName('Quantidade').AsString);
      dsPedidosItens.DataSet.Next;
    end;
  end;
end;

procedure TForm2.lvPedidoItensDblClick(Sender: TObject);
begin
  edtProduto.Text := lvPedidoItens.Items[lvPedidoItens.ItemIndex].SubItems[0];
  edtQuantidade.Text := lvPedidoItens.Items[lvPedidoItens.ItemIndex].SubItems[1];
end;

end.
