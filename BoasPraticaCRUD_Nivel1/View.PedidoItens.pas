unit View.PedidoItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Controller;

type
  TViewPedidoItens = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    edtPedido: TLabeledEdit;
    edtProduto: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    btnSalvar: TButton;
    edtItem: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
  private
    FController : TController;
  public
    { Public declarations }
  end;

var
  ViewPedidoItens: TViewPedidoItens;

implementation

{$R *.dfm}

procedure TViewPedidoItens.btnSalvarClick(Sender: TObject);
begin
  FController
    .DAOPedidoItens
      .This(FController
            .PedidoItens
            .Item(StrToInt(edtItem.Text))
            .IdPedido(StrToInt(edtPedido.Text))
            .Produto(edtProduto.Text)
            .Quantidade(StrToInt(edtQuantidade.Text)))
    .Atualizar;
    Close;
end;

procedure TViewPedidoItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController.Destroy;
end;

procedure TViewPedidoItens.FormCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

end.
