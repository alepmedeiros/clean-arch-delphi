unit ObterEstacionamento;

interface

uses
  EstacionamentoRepository,
  Estacionamento;

type
  TObterEstacionamento = class
  private
    FEstacionamentoRepository: iEstacionamentoRepository;
  public
    constructor Create(aEstacionamentoRepository: iEstacionamentoRepository);
    function Execute(aCodigo: String): TEstacionamento; overload;
  end;

implementation

{ TObterEstacionamento }

constructor TObterEstacionamento.Create(aEstacionamentoRepository
  : iEstacionamentoRepository);
begin
  FEstacionamentoRepository := aEstacionamentoRepository;
end;

function TObterEstacionamento.Execute(aCodigo: String): TEstacionamento;
begin
  result := FEstacionamentoRepository.ObterEstacionamento(aCodigo);
end;

end.
