unit Financial.Entities.OperationTypes;

interface

uses
  System.SysUtils,
  TypInfo;

type
  TOperationType = (opWithdraw, opDeposit);

  TOperationTypeHelper = record helper for TOperationType
    function ToString : String;
  end;

implementation

{ TOperationTypeHelper }

function TOperationTypeHelper.ToString: String;
var
  lEnumName : String;
begin
  lEnumName := GetEnumName(TypeInfo(TOperationType), Integer(Self));
  Result := Copy(lEnumName,3,Length(lEnumName));
end;

end.
