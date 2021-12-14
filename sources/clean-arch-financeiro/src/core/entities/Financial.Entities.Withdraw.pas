unit Financial.Entities.Withdraw;

interface

type
  TWithdraw = class
  private
    FValue: Double;
  public
    function isValue(const Value: Double) : Boolean;
    function isBalance(const Value: Double) : Boolean;

    property Value: Double read FValue write FValue;
  end;

implementation

{ TWithdraw }


function TWithdraw.isBalance(const Value: Double): Boolean;
begin
  Result := (Value > FValue);
end;

function TWithdraw.isValue(const Value: Double): Boolean;
begin
  Result := (Value > 0);
end;

end.
