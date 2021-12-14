unit Financial.Entities.Deposit;

interface

type
  TDeposit = class
  private
    FValue: Double;
  public
    property Value: Double read FValue write Value;
  end;

implementation

end.
