unit Financial.Repository.Interfaces;

interface

uses
  Financial.Entities.Withdraw,
  Financial.Entities.Deposit,
  Financial.Entities.Historic;

type
  iFinancialRepository = interface
    procedure SaveWithdrawal(Value: Double);
    procedure SaveDeposit(Value: Double);
    procedure SaveHistory(aEventDate, aDescription: String);
    function GetBalance: Double;
  end;

implementation

end.
