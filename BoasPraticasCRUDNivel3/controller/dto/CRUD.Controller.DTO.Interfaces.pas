unit CRUD.Controller.DTO.Interfaces;

interface

uses
  CRUD.Services.Generic,
  CRUD.Model.Entity.Cliente;

type
  iClienteDTO = interface
    function Nome(Value : String) : iClienteDTO;
    function Telefone(Value : String) : iClienteDTO;
    function Logradouro(Value : String) : iClienteDTO;
    function Cep(Value : String) : iClienteDTO;
    function Bairro(Value : String) : iClienteDTO;
    function Cidade(Value : String) : iClienteDTO;
    function Estado(Value : String) : iClienteDTO;
    function Build : iService<TCliente>;
  end;

implementation

end.
