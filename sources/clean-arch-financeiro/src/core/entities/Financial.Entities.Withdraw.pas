unit Financial.Entities.Withdraw;

interface

type
  TWithdraw = class
  private
    FValue: Double;
  public
    property Value: Double read FValue write FValue;
  end;

implementation

end.
