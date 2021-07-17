program BoasPraticasCRUDN1;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {ViewPrincipal},
  Model.DAOPedido in 'model\DAO\Model.DAOPedido.pas',
  Model.Entidade.Pedido in 'model\entidade\Model.Entidade.Pedido.pas',
  Model.Entidade.PedidoItens in 'model\entidade\Model.Entidade.PedidoItens.pas',
  Model.DAOPedidoItens in 'model\DAO\Model.DAOPedidoItens.pas',
  Model.Query.Firedac in 'model\componentes\acesso\Model.Query.Firedac.pas' {ModelQueryFiredac: TDataModule},
  Model.Conexao.Firedac in 'model\componentes\conexao\Model.Conexao.Firedac.pas' {ModelConexaoFiredac: TDataModule},
  Controller in 'controller\Controller.pas',
  View.Pedido in 'View.Pedido.pas' {ViewPedidos},
  View.PedidoItens in 'View.PedidoItens.pas' {ViewPedidoItens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
