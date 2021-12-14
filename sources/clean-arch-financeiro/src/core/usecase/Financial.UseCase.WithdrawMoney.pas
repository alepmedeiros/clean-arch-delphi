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
    if not lWithdraw.isValue(aValue) then
      raise EArgumentException.Create('Enter a valid amount for the withdrawal.');

    lWithdraw.Value := aValue;

    if not lWithdraw.isBalance(FFinancialRepository.GetBalance) then
      raise EInvalidOp.Create('There is not enough balance for this withdrawal.');

    FFinancialRepository.SaveWithdrawal(lWithdraw.Value);
  finally
    lWithdraw.DisposeOf;
  end;
end;

end.
