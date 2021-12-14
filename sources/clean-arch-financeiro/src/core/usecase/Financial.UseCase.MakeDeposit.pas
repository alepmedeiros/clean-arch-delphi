unit Financial.UseCase.MakeDeposit;

interface

uses
  System.SysUtils,
  Financial.Repository.Interfaces,
  Financial.Entities.Deposit;

type
  TMakeDeposit = class
  private
    FFinancialRepository: iFinancialrepository;
  public
    constructor Create(FinancialRepository: iFinancialrepository);
    procedure Execute(const aValue: Double);
  end;

implementation

{ TMakeDeposit }

constructor TMakeDeposit.Create(FinancialRepository: iFinancialrepository);
begin
  FFinancialRepository := FinancialRepository;
end;

procedure TMakeDeposit.Execute(const aValue: Double);
var
  lDeposit: TDeposit;
begin
  lDeposit := TDeposit.Create;
  try
    if not lDeposit.Validate(aValue) then
      raise EArgumentException.Create('Enter a valid deposit amount');

    lDeposit.Value := aValue;

    FFinancialRepository.SaveDeposit(lDeposit.Value);
  finally
    lDeposit.DisposeOf;
  end;
end;


end.
