program BoasPraticasCRUD_N4;

uses
  Vcl.Forms,
  CRUD.Model.Entity.Cliente in 'model\entity\CRUD.Model.Entity.Cliente.pas',
  CRUD.Resources.Interfaces in 'resources\CRUD.Resources.Interfaces.pas',
  CRUD.Resources.Conexao in 'resources\CRUD.Resources.Conexao.pas',
  CRUD.Services.Generic in 'services\CRUD.Services.Generic.pas',
  CRUD.view.Editar in 'view\CRUD.view.Editar.pas' {frmEditar},
  CRUD.View.Principal in 'view\CRUD.View.Principal.pas' {frmListarClientes},
  CRUD.Controller.DTO.Cliente in 'dto\CRUD.Controller.DTO.Cliente.pas',
  CRUD.Controller in 'controller\CRUD.Controller.pas',
  CRUD.Controller.Interfaces in 'controller\CRUD.Controller.Interfaces.pas',
  CRUD.Controller.DTO.Interfaces in 'dto\CRUD.Controller.DTO.Interfaces.pas',
  CRUD.Controller.DTO.Endereco in 'dto\CRUD.Controller.DTO.Endereco.pas',
  CRUD.Model.Entity.Endereco in 'model\entity\CRUD.Model.Entity.Endereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmListarClientes, frmListarClientes);
  Application.CreateForm(TfrmListarClientes, frmListarClientes);
  Application.Run;
end.
