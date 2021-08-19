unit CRUD.Model.Entity.Cliente;

interface

uses
  SimpleAttributes;

type
  [Tabela('Cliente')]
  TCliente = class
  private
    FId: Integer;
    FNome: String;
    FLogradouro: String;
    FBairro: String;
    FCep: String;
    FCidade: String;
    FEstado: String;
    FTelefone: String;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetEstado(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetTelefone(const Value: String);
  public
    [Campo('ID'), PK, AutoInc]
    property Id : Integer read FId write SetId;
    [Campo('NOME')]
    property Nome : String read FNome write SetNome;
    [Campo('TELEFONE')]
    property Telefone : String read FTelefone write SetTelefone;
    [Campo('Logradouro')]
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

{ TPessoa }

procedure TCliente.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TCliente.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCliente.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TCliente.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TCliente.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCliente.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCliente.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.

