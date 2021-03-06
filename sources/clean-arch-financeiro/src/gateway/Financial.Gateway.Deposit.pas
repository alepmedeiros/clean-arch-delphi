unit Financial.Gateway.Deposit;

interface

uses
  Financial.Gateway.Interfaces,
  Financial.UseCase.MakeDeposit,
  Financial.Gateway.RepositoryFiredac,
  Financial.UseCase.IncludeHistory,
  Financial.Repository.Interfaces,
  Financial.Entities.OperationTypes;

type
  TGatewayDeposit = class
  private
    FGateway: iGateway;
  public
    constructor Create(Gateway: iGateway);
    procedure Deposit(const aValue: Double);
  end;

implementation

{ TGatewayDeposit }

constructor TGatewayDeposit.Create(Gateway: iGateway);
begin
  FGateway := Gateway;
end;

procedure TGatewayDeposit.Deposit(const aValue: Double);
var
  lFinacialRepository: iFinancialRepository;
  lDepositUseCase: TMakeDeposit;
  lHistoryUseCase: TIncludeHistory;
begin
  lFinacialRepository := TFinancialRepositoryFiredac.New(FGateway);

  lDepositUseCase := TMakeDeposit.Create(lFinacialRepository);
  lHistoryUseCase := TIncludeHistory.Create(lFinacialRepository);
  try
    lDepositUseCase.Execute(aValue);
    lHistoryUseCase.Execute(opDeposit, aValue);
  finally
    lDepositUseCase.DisposeOf;
    lHistoryUseCase.DisposeOf;
  end;
end;

end.
