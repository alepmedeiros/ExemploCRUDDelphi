program BoasPraticasCRUD_N3;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {Form1},
  CRUD.Model.Entity.Pedidos in 'model\entity\CRUD.Model.Entity.Pedidos.pas',
  CRUD.Model.Entity.PedidoItens in 'model\entity\CRUD.Model.Entity.PedidoItens.pas',
  CRUD.Resources.Interfaces in 'resources\CRUD.Resources.Interfaces.pas',
  CRUD.Resources.Conexao in 'resources\CRUD.Resources.Conexao.pas',
  CRUD.Services.Generic in 'services\CRUD.Services.Generic.pas',
  CRUD.Controller.Interfaces in 'controller\CRUD.Controller.Interfaces.pas',
  CRUD.Controller.Generic in 'controller\CRUD.Controller.Generic.pas',
  CRUD.Controller in 'controller\CRUD.Controller.pas',
  CRUD.Controller.DTO.Cliente in 'controller\dto\CRUD.Controller.DTO.Cliente.pas',
  CRUD.Controller.DTO.Interfaces in 'controller\dto\CRUD.Controller.DTO.Interfaces.pas',
  CRUD.Model.Entity.Cliente in 'model\entity\CRUD.Model.Entity.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
