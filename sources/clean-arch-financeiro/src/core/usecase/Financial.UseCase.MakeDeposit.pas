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
    procedure Validade(const aDeposit: TDeposit);
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
    lDeposit.Value := aValue;

    Validade(lDeposit);

    FFinancialRepository.SaveDeposit(lDeposit);
  finally
    lDeposit.DisposeOf;
  end;
end;

procedure TMakeDeposit.Validade(const aDeposit: TDeposit);
begin
  if (aDeposit.Value <= 0) then
    raise EArgumentException.Create('Enter a valid deposit amount');
end;

end.
