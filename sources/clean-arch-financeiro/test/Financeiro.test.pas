unit Financeiro.test;

interface

uses
  Financial.Controller,
  DUnitX.TestFramework;

type
  [TestFixture]
  TFinanceirotest = class
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure MakeWorthlessDeposit;

    [Test]
    procedure CashOut;
  end;

implementation

procedure TFinanceirotest.CashOut;
var
  lController: TController;
begin
  lController := TController.Create;
  try
    lController.Saccade(100);
  finally
    lController.DisposeOf;
  end;
end;

procedure TFinanceirotest.MakeWorthlessDeposit;
var
  lController : TController;
begin
  lController := TController.Create;
  try
    lController.MakeDeposit(10);
  finally
    lController.DisposeOf;
  end;
end;

procedure TFinanceirotest.Setup;
begin
end;

procedure TFinanceirotest.TearDown;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TFinanceirotest);

end.
