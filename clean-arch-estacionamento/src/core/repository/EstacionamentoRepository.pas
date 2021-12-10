unit EstacionamentoRepository;

interface

uses
  JSON,
  Estacionamento;

type
  iEstacionamentoRepository = interface
    function ObterEstacionamento(aCode: String): TEstacionamento;
    procedure SalvarCarroEstacionado(aCodigo, aPlaca: String; aData: TDateTime);
  end;

implementation

end.
