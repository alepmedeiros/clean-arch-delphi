unit Financial.Repository.Interfaces;

interface

uses
  Financial.Entities.Withdraw,
  Financial.Entities.Deposit,
  Financial.Entities.Historic;

type
  iFinancialRepository = interface
    procedure SaveWithdrawal(aWithdraw: TWithdraw);
    procedure SaveDeposit(aDeposit: TDeposit);
    procedure SaveHistory(aHistory: THistoric);
    function GetBalance: Double;
  end;

implementation

end.
