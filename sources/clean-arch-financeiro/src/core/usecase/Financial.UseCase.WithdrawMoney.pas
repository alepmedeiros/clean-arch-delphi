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
    procedure Validade(const aWithdraw: TWithdraw);
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

    Validade(lWithdraw);

    FFinancialRepository.SaveWithdrawal(lWithdraw);
  finally
    lWithdraw.DisposeOf;
  end;
end;

procedure TWithdrawMoney.Validade(const aWithdraw: TWithdraw);
begin
  if (aWithdraw.Value <= 0) then
    raise EArgumentException.Create('Enter a valid amount for the withdrawal.');

  if (FFinancialRepository.GetBalance < aWithdraw.Value) then
    raise EInvalidOp.Create('There is not enough balance for this withdrawal.');
end;

end.
