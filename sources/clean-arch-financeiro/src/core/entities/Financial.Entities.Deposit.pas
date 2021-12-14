unit Financial.Entities.Deposit;

interface

type
  TDeposit = class
  private
    FValue: Double;
  public
    function Validate(const Value: Double) : Boolean;

    property Value: Double read FValue write FValue;
  end;

implementation

{ TDeposit }


function TDeposit.Validate(const Value: Double): Boolean;
begin
  Result := (Value > 0);
end;

{ TDeposit }

end.
