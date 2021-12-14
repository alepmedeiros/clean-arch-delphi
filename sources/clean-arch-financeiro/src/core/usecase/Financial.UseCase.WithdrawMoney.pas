unit Financial.UseCase.WithdrawMoney;

interface

uses
  System.SysUtils,
  Financial.Repository.Interfaces,
  Financial.Entities.Withdraw;

type
  TWithdrawMoney = class
  private
    FFinancialRepository: iFinancialRepository;
  public
    constructor Create(FinancialRepository: iFinancialRepository);
    procedure Execute(const aValue: Double);
  end;

implementation

{ TWithdrawMoney }

constructor TWithdrawMoney.Create(FinancialRepository: iFinancialRepository);
begin
  FFinancialRepository := FinancialRepository;
end;

procedure TWithdrawMoney.Execute(const aValue: Double);
var
  lWithdraw : TWithdraw;
begin
  lWithdraw := TWithdraw.Create;
  try
    lWithdraw.Value := aValue;

    lWithdraw.isBalance(FFinancialRepository.GetBalance);

    FFinancialRepository.SaveWithdrawal(lWithdraw);
  finally
    lWithdraw.DisposeOf;
  end;
end;

end.
