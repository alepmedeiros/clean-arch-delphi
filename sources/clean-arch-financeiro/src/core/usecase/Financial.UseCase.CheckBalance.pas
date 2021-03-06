unit Financial.UseCase.CheckBalance;

interface

uses
  Financial.Repository.Interfaces;

type
  TCheckBalance = class
  private
    FFinacialRepository: iFinancialRepository;
  public
    constructor Create(FinacialRepository: iFinancialRepository);
    function Execute : Double;
  end;

implementation

{ TCheckBalance }

constructor TCheckBalance.Create(FinacialRepository: iFinancialRepository);
begin
  FFinacialRepository := FinacialRepository;
end;

function TCheckBalance.Execute: Double;
begin
  FFinacialRepository.GetBalance;
end;

end.
