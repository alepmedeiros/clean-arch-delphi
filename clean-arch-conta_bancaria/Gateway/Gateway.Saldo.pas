unit Gateway.Saldo;

interface

uses
  Intf.Connection;

type
  TSaldoGateway = class
  private
    FDBConnection: IDBConnection;
  public
    constructor Create(aDBConnection: IDBConnection);
    function RetornarSaldo: double;
  end;

implementation

uses
  UseCase.ConsultarSaldo, Defs.Types, Gateway.Persistence;

{ TSaldoGateway }

constructor TSaldoGateway.Create(aDBConnection: IDBConnection);
begin
  FDBConnection := aDBConnection;
end;

function TSaldoGateway.RetornarSaldo: double;
var
  PersistenceGateway: TPersistenceGateway;
  SaldoUseCase: TConsultarSaldoUseCase;
begin
  PersistenceGateway := TPersistenceGateway.Create(FDBConnection);

  SaldoUseCase := TConsultarSaldoUseCase.Create(PersistenceGateway);
  try
    result := SaldoUseCase.Execute;
  finally
    SaldoUseCase.Free;
  end;
end;

end.
