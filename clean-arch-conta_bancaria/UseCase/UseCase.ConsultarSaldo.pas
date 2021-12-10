unit UseCase.ConsultarSaldo;

interface

uses
  Intf.Persistence;

type
  TConsultarSaldoUseCase = class
  private
    FPersistence: IPersistence;
  public
    constructor Create(aPersistence: IPersistence);
    function Execute: double;
  end;

implementation

uses
  System.SysUtils;

{ TConsultarSaldoUseCase }

constructor TConsultarSaldoUseCase.Create(aPersistence: IPersistence);
begin
  FPersistence := aPersistence;
end;

function TConsultarSaldoUseCase.Execute: double;
begin
  result := FPersistence.ObterSaldo;
end;

end.
