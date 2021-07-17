program ExcemploCRUDN2;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {Form1},
  Model.Conexao.Firedac in 'model\conexao\Model.Conexao.Firedac.pas',
  Model.Conexao.Interfaces in 'model\conexao\Model.Conexao.Interfaces.pas',
  Model.DAO.Interfaces in 'model\dao\Model.DAO.Interfaces.pas',
  Model.DAOPedidos in 'model\dao\Model.DAOPedidos.pas',
  Model.DAOPedidosItens in 'model\dao\Model.DAOPedidosItens.pas',
  Model.Entidades.Pedidos in 'model\entidades\Model.Entidades.Pedidos.pas',
  Model.Entidades.PedidosItens in 'model\entidades\Model.Entidades.PedidosItens.pas',
  Controle.Controle in 'controle\Controle.Controle.pas',
  Controle.Entidades in 'controle\Controle.Entidades.pas',
  Controle.Interfaces in 'controle\Controle.Interfaces.pas',
  View.Editar in 'View.Editar.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
