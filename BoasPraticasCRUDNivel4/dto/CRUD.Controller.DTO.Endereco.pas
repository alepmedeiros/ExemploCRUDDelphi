unit CRUD.Controller.DTO.Endereco;

interface

uses
  CRUD.Model.Entity.Endereco,
  CRUD.Controller.DTO.Interfaces,
  CRUD.Services.Generic;

type
  TEnderecoDTO = class(TInterfacedObject, iEnderecoDTO)
    private
      FEntity : TEndereco;
      FService : iService<TEndereco>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEnderecoDTO;
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

function TEnderecoDTO.Bairro(Value: String): iEnderecoDTO;
begin
  Result := Self;
  FEntity.Bairro := Value;
end;

function TEnderecoDTO.Bairro: String;
begin
    Result := FEntity.Bairro;
end;

function TEnderecoDTO.Build: iService<TEndereco>;
begin
    Result := FService;
end;

function TEnderecoDTO.Cep(Value: String): iEnderecoDTO;
begin
  Result := Self;
  FEntity.Cep := Value;
end;

function TEnderecoDTO.Cidade(Value: String): iEnderecoDTO;
begin
  Result := Self;
  FEntity.Cidade := Value;
end;

constructor TEnderecoDTO.Create;
begin
  FEntity := TEndereco.Create;
  FService := TService<TEndereco>.New(FEntity);
end;

destructor TEnderecoDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TEnderecoDTO.Estado: String;
begin
  Result := FEntity.Estado;
end;

function TEnderecoDTO.Estado(Value: String): iEnderecoDTO;
begin
  Result := Self;
  FEntity.Estado := Value;
end;

function TEnderecoDTO.IdCliente(Value: Integer): iEnderecoDTO;
begin
  Result := Self;
  FEntity.IdCliente := Value;
end;

function TEnderecoDTO.Logradouro(Value: String): iEnderecoDTO;
begin
  Result := Self;
  FEntity.Logradouro := Value;
end;

class function TEnderecoDTO.New : iEnderecoDTO;
begin
  Result := Self.Create;
end;

function TEnderecoDTO.Cep: String;
begin
  Result := FEntity.Cep;
end;

function TEnderecoDTO.Cidade: String;
begin
  Result := FEntity.Cidade;
end;

function TEnderecoDTO.IdCliente: Integer;
begin
  Result := FEntity.IdCliente;
end;

function TEnderecoDTO.Logradouro: String;
begin
  Result := FEntity.Logradouro;
end;

end.
