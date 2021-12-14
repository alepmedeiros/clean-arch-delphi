unit Financial.Controller;

interface

uses
  Financial.Gateway.Deposit,
  Financial.Gateway.Interfaces,
  Financial.Infra.Database, Financial.Gateway.Withdraw,
  Financial.Gateway.Balance;

type
  TController = class
  private
    FConnection: iGateway;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Saccade(aValue: Double);
    procedure MakeDeposit(aValue: Double);
    function ReturnBalance : Double;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FConnection := TConnection.New;
end;

destructor TController.Destroy;
begin

  inherited;
end;

procedure TController.MakeDeposit(aValue: Double);
var
  lGatewayDeposit: TGatewayDeposit;
begin
  lGatewayDeposit := TGatewayDeposit.Create(FConnection);

  lGatewayDeposit.Deposit(aValue);
end;

function TController.ReturnBalance: Double;
var
  lGatewayBalance : TGatewayBalance;
begin
  lGatewayBalance := TGatewayBalance.Create(FConnection);

  Result := lGatewayBalance.ReturnBalance;
end;

procedure TController.Saccade(aValue: Double);
var
  lGatewayWithdraw: TGatewayWithdraw;
begin
  lGatewayWithdraw := TGatewayWithdraw.Create(FConnection);

  lGatewayWithdraw.ToWithdraw(aValue);
end;

end.
