unit Financial.Gateway.Withdraw;

interface

uses
  Financial.Gateway.Interfaces,
  Financial.Repository.Interfaces,
  Financial.UseCase.IncludeHistory,
  Financial.Gateway.RepositoryFiredac,
  Financial.Entities.OperationTypes,
  Financial.UseCase.WithdrawMoney;

type
  TGatewayWithdraw = class
  private
    FGateway: iGateway;
  public
    constructor Create(Gateway: iGateway);
    procedure ToWithdraw(const aValue: Double);
  end;

implementation

{ TGatewayWithdraw }

constructor TGatewayWithdraw.Create(Gateway: iGateway);
begin
  FGateway := Gateway;
end;

procedure TGatewayWithdraw.ToWithdraw(const aValue: Double);
var
  lFinacialRepository: iFinancialRepository;
  lWithdrawUseCase: TWithdrawMoney;
  lHistoryUseCase: TIncludeHistory;
begin
  lFinacialRepository := TFinancialRepositoryFiredac.New(FGateway);

  lWithdrawUseCase := TWithdrawMoney.Create(lFinacialRepository);
  lHistoryUseCase := TIncludeHistory.Create(lFinacialRepository);
  try
    lWithdrawUseCase.Execute(aValue);
    lHistoryUseCase.Execute(opWithdraw, aValue);
  finally
    lWithdrawUseCase.DisposeOf;
    lHistoryUseCase.DisposeOf;
  end;
end;

end.
