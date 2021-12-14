unit Financial.Gateway.RepositoryTxt;

interface

uses
  Financial.Repository.Interfaces, Financial.Entities.Withdraw,
  Financial.Entities.Deposit, Financial.Entities.Historic;

type
  TFinancialRepositoryTxT = class(TInterfacedObject, iFinancialRepository)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFinancialRepository;
      procedure SaveWithdrawal(aWithdraw: TWithdraw);
      procedure SaveDeposit(aDeposit: TDeposit);
      procedure SaveHistory(aHistory: THistoric);
      function GetBalance: Double;
  end;

implementation

constructor TFinancialRepositoryTxT.Create;
begin

end;

destructor TFinancialRepositoryTxT.Destroy;
begin

  inherited;
end;

function TFinancialRepositoryTxT.GetBalance: Double;
begin

end;

class function TFinancialRepositoryTxT.New : iFinancialRepository;
begin
  Result := Self.Create;
end;

procedure TFinancialRepositoryTxT.SaveDeposit(aDeposit: TDeposit);
begin

end;

procedure TFinancialRepositoryTxT.SaveHistory(aHistory: THistoric);
begin

end;

procedure TFinancialRepositoryTxT.SaveWithdrawal(aWithdraw: TWithdraw);
begin

end;

end.
