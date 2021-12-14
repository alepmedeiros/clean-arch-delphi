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
      procedure SaveWithdrawal(Value: Double);
      procedure SaveDeposit(Value: Double);
      procedure SaveHistory(aEventDate, aDescription: String);
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

procedure TFinancialRepositoryTxT.SaveDeposit(Value: Double);
begin

end;

procedure TFinancialRepositoryTxT.SaveHistory(aEventDate, aDescription: String);
begin

end;

procedure TFinancialRepositoryTxT.SaveWithdrawal(Value: Double);
begin

end;

end.
