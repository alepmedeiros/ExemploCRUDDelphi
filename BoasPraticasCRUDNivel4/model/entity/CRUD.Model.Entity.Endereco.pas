unit CRUD.Model.Entity.Endereco;

interface

uses
  SimpleAttributes;

type
  [Tabela('ENDERECO')]
  TEndereco = class
  private
    FLogradouro: String;
    FBairro: String;
    FCep: String;
    FIdCliente: Integer;
    FCidade: String;
    FEstado: String;
    FId: Integer;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetEstado(const Value: String);
    procedure SetIdCliente(const Value: Integer);
    procedure SetLogradouro(const Value: String);
    procedure SetId(const Value: Integer);
  public
    [Campo('ID'), PK, AutoInc]
    property Id : Integer read FId write SetId;
    [Campo('ID_CLIENTE'), FK, NotNull]
    property IdCliente : Integer read FIdCliente write SetIdCliente;
    [Campo('LOGRADOURO')]
    property Logradouro : String read FLogradouro write SetLogradouro;
    [Campo('CEP')]
    property Cep : String read FCep write SetCep;
    [Campo('BAIRRO')]
    property Bairro : String read FBairro write SetBairro;
    [Campo('CIDADE')]
    property Cidade : String read FCidade write SetCidade;
    [Campo('ESTADO')]
    property Estado : String read FEstado write SetEstado;
  end;

implementation

{ TEndereco }

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TEndereco.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TEndereco.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TEndereco.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TEndereco.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

end.
