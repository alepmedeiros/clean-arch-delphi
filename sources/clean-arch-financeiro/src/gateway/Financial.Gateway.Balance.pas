unit Financial.Gateway.Balance;

interface

uses
  Financial.Gateway.Interfaces, Financial.Repository.Interfaces,
  Financial.UseCase.CheckBalance, Financial.Gateway.RepositoryFiredac;

type
  TGatewayBalance = class
  private
    FGateway: iGateway;
  public
    constructor Create(Gateway: iGateway);
    function ReturnBalance : Double;
  end;

implementation

{ TGatewayBalance }

constructor TGatewayBalance.Create(Gateway: iGateway);
begin
  FGateway:= Gateway;
end;

function TGatewayBalance.ReturnBalance: Double;
var
  lFinancialRepository: iFinancialRepository;
  lBalanceUseCase: TCheckBalance;
begin
  lFinancialRepository := TFinancialRepositoryFiredac.New(FGateway);

  lBalanceUseCase := TCheckBalance.Create(lFinancialRepository);
  try
    Result := lBalanceUseCase.Execute;
  finally
    lBalanceUseCase.DisposeOf;
  end;
end;

end.
