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
    lDeposit.Value := aValue;

    FFinancialRepository.SaveDeposit(lDeposit);
  finally
    lDeposit.DisposeOf;
  end;
end;


end.
