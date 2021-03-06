unit Financial.UseCase.IncludeHistory;

interface

uses
  System.SysUtils,
  Financial.Repository.Interfaces,
  Financial.Entities.OperationTypes,
  Financial.Entities.Historic;

type
  TIncludeHistory = class
  private
    FFinancialRepository: iFinancialRepository;
  public
    constructor Create(FinancialRepository: iFinancialRepository);
    procedure Execute(const aOperationType: TOperationType;
      const aValue: Double);
  end;

implementation

{ TIncludeHistory }

constructor TIncludeHistory.Create(FinancialRepository: iFinancialRepository);
begin
  FFinancialRepository := FinancialRepository;
end;

procedure TIncludeHistory.Execute(const aOperationType: TOperationType;
  const aValue: Double);
var
  lHistoric: THistoric;
begin
  lHistoric := THistoric.Create;
  try
    lHistoric.EnvetDate := FormatDateTime('dd/mm/yyyy', now);
    lHistoric.Description :=
      Format('a %s operation in the amount of %.2f as corried out',
      [aOperationType.ToString, aValue]);

    FFinancialRepository.SaveHistory(lHistoric.EnvetDate,lHistoric.Description);
  finally
    lHistoric.DisposeOf;
  end;
end;

end.
