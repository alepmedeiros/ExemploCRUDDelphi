unit View.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Controller;

type
  TViewPedidos = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    edtId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    btnSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FController : TController;
  public
    { Public declarations }
  end;

var
  ViewPedidos: TViewPedidos;

implementation

{$R *.dfm}

procedure TViewPedidos.btnSalvarClick(Sender: TObject);
begin
  FController
    .DAOPedido
      .This(FController
            .Pedido
            .id(StrToInt(edtId.Text))
            .Descricao(edtDescricao.Text))
    .Atualizar;
    Close;
end;

procedure TViewPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController.Destroy;
end;

procedure TViewPedidos.FormCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

end.
