unit Financial.Gateway.RepositoryFiredac;

interface

uses
  System.SysUtils,
  Financial.Repository.Interfaces,
  Financial.Entities.Withdraw,
  Financial.Entities.Deposit,
  Financial.Entities.Historic,
  Financial.Gateway.Interfaces;

type
  TFinancialRepositoryFiredac = class(TInterfacedObject, iFinancialRepository)
  private
    FGateway: iGateway;
  public
    constructor Create(Gateway: iGateway);
    destructor Destroy; override;
    class function New(Gateway: iGateway): iFinancialRepository;
    procedure SaveWithdrawal(aWithdraw: TWithdraw);
    procedure SaveDeposit(aDeposit: TDeposit);
    procedure SaveHistory(aHistory: THistoric);
    function GetBalance: Double;
  end;

implementation

constructor TFinancialRepositoryFiredac.Create(Gateway: iGateway);
begin
  FGateway := Gateway;
end;

destructor TFinancialRepositoryFiredac.Destroy;
begin

  inherited;
end;

function TFinancialRepositoryFiredac.GetBalance: Double;
var
  lCommand: String;
begin
  Result := FGateway.GetValue('SELECT COALESCE(BALANCE,0) FROM ACCOUNT');
end;

class function TFinancialRepositoryFiredac.New(Gateway: iGateway)
  : iFinancialRepository;
begin
  Result := Self.Create(Gateway);
end;

procedure TFinancialRepositoryFiredac.SaveDeposit(aDeposit: TDeposit);
var
  lCommand: TStringBuilder;
begin
  lCommand:= TStringBuilder.Create;
  try
    lCommand
      .Append('UPDATE ACCOUNT SET BALANCE = BALANCE + ')
      .Append(aDeposit.Value)
      .Append(' WHERE ID = 1');

    FGateway.Execute(lCommand.ToString);
  finally
    lCommand.DisposeOf;
  end;
end;

procedure TFinancialRepositoryFiredac.SaveHistory(aHistory: THistoric);
var
  lCommand: TStringBuilder;
begin
  lCommand := TStringBuilder.Create;
  try
    lCommand
      .Append('INSERT INTO HISTORY VALUES ')
      .AppendFormat('(%s, %s)',
    [QuotedStr(aHistory.EnvetDate),
    QuotedStr(aHistory.Description.QuotedString)]);

    FGateway.Execute(lCommand.ToString);
  finally
    lCommand.DisposeOf;
  end;
end;

procedure TFinancialRepositoryFiredac.SaveWithdrawal(aWithdraw: TWithdraw);
var
  lCommand: TStringBuilder;
begin
  lCommand := TStringBuilder.Create;
  try
    lCommand
      .Append('UPDATE ACCOUNT SET BALANCE = BALANCE - ')
      .Append(aWithdraw.Value)
      .Append(' WHERE ID = 1');

    FGateway.Execute(lCommand.ToString);
  finally

  end;
end;

end.
