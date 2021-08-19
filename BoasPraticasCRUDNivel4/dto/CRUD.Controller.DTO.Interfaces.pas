unit CRUD.Controller.DTO.Interfaces;

interface

uses
  CRUD.Services.Generic,
  CRUD.Model.Entity.Cliente, CRUD.Model.Entity.Endereco;

type
  iClienteDTO = interface
    function Id(Value : Integer)  : iClienteDTO; overload;
    function Id : Integer; overload;
    function Nome(Value : String) : iClienteDTO; overload;
    function Nome : String; overload;
    function Telefone(Value : String) : iClienteDTO; overload;
    function Telefone : String; overload;
    function Build : iService<TCliente>;
  end;

  iEnderecoDTO = interface
    function IdCliente(Value : Integer) : iEnderecoDTO; overload;
    function IdCliente : Integer; overload;
    function Logradouro(Value : String) : iEnderecoDTO; overload;
    function Logradouro : String; overload;
    function Cep(Value : String) : iEnderecoDTO; overload;
    function Cep : String; overload;
    function Bairro(Value : String) : iEnderecoDTO; overload;
    function Bairro : String; overload;
    function Cidade(Value : String) : iEnderecoDTO; overload;
    function Cidade : String; overload;
    function Estado(Value : String) : iEnderecoDTO; overload;
    function Estado : String; overload;
    function Build : iService<TEndereco>;
  end;

implementation

end.
