unit Financial.Entities.Withdraw;

interface

uses
  System.SysUtils;

type
  TWithdraw = class
  private
    FValue: Double;
    procedure SetValue(const Value: Double);
  public
    procedure isBalance(const Value: Double);
    property Value: Double read FValue write SetValue;
  end;

implementation

{ TWithdraw }

procedure TWithdraw.isBalance(const Value: Double);
begin
  if (Value < FValue) then
    raise EInvalidOp.Create('There is not enough balance for this withdrawal.');
end;

procedure TWithdraw.SetValue(const Value: Double);
begin
  if (Value <= 0) then
    raise EArgumentException.Create('Enter a valid amount for the withdrawal.');
  FValue := Value;
end;

end.
