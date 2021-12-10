unit EstacionamentoAdapter;

interface

uses
  Estacionamento;

type
  TEstacionamentoAdapter = class
  private
  public
    class function Create(aCodigo: String; aCapacidade: Integer; aHoraAberto, aHoraFechado: TDateTime;
      aEspacosOcupados: Integer): TEstacionamento;
  end;

implementation

{ TEstacionamentoAdapter }

class function TEstacionamentoAdapter.Create(aCodigo: String; aCapacidade: Integer; aHoraAberto, aHoraFechado: TDateTime;
      aEspacosOcupados: Integer): TEstacionamento;
begin
  Result := TEstacionamento.Create(aCodigo, aCapacidade, aHoraAberto, aHoraFechado,
    aEspacosOcupados);
end;

end.
