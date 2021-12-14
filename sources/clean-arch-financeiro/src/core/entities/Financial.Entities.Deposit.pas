unit Financial.Entities.Deposit;

interface

uses
  System.SysUtils;

type
  TDeposit = class
  private
    FValue: Double;
    procedure SetValue(const Value: Double);
  public
    property Value: Double read FValue write SetValue;
  end;

implementation

{ TDeposit }


{ TDeposit }

procedure TDeposit.SetValue(const Value: Double);
begin
  if (Value <= 0) then
    raise EArgumentException.Create('Enter a valid deposit amount');
  FValue := Value;
end;

end.
