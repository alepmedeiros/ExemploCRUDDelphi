unit CRUD.Controller.DTO.Cliente;

interface

uses
  CRUD.Model.Entity.Cliente,
  CRUD.Controller.DTO.Interfaces, CRUD.Services.Generic;

type
  TClienteDTO = class(TInterfacedObject, iClienteDTO)
    private
      FEntity : TCliente;
      FService : iService<TCliente>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iClienteDTO;
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

function TClienteDTO.Bairro(Value: String): iClienteDTO;
begin
  Result := Self;
  FEntity.Bairro := Value;
end;

function TClienteDTO.Cep(Value: String): iClienteDTO;
begin
  Result := Self;
  FEntity.Cep := Value;
end;

function TClienteDTO.Cidade(Value: String): iClienteDTO;
begin
  Result := Self;
  FEntity.Cidade := Value;
end;

function TClienteDTO.Build: iService<TCliente>;
begin
  Result := FService;
end;

constructor TClienteDTO.Create;
begin
  FEntity := TCliente.Create;
  FService := TService<TCliente>.New;
end;

destructor TClienteDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TClienteDTO.Estado(Value: String): iClienteDTO;
begin
  Result := Self;
  FEntity.Estado := Value;
end;

function TClienteDTO.Logradouro(Value: String): iClienteDTO;
begin
  Result := Self;
  FEntity.Logradouro := Value;
end;

class function TClienteDTO.New : iClienteDTO;
begin
  Result := Self.Create;
end;

function TClienteDTO.Nome(Value: String): iClienteDTO;
begin
  Result := Self;
  FEntity.Nome := Value;
end;

function TClienteDTO.Telefone(Value: String): iClienteDTO;
begin
  Result := Self;
  FEntity.Telefone := Value;
end;

end.
