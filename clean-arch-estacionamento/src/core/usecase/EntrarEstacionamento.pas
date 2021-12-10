unit EntrarEstacionamento;

interface

uses
  System.SysUtils,
  Estacionamento,
  EstacionamentoRepository,
  CarroEstacionado;

type
  TEntrarEstacionamento = class
  private
    FEstacionamentoRepository : iEstacionamentoRepository;
    FEstacionamento: TEstacionamento;
    FCarroEstacionado : TCarroEstacionado;
  public
    constructor Create(aEstacionamentoRepository: iEstacionamentoRepository);
    function Execute(aCodigo: String; aPlaca: String; aData: TDateTime): TEstacionamento;
  end;

implementation

{ TEntrarEstacionamento }

constructor TEntrarEstacionamento.Create(aEstacionamentoRepository: iEstacionamentoRepository);
begin
  FEstacionamentoRepository  := aEstacionamentoRepository;
end;

function TEntrarEstacionamento.Execute(aCodigo: String; aPlaca: String; aData: TDateTime): TEstacionamento;
begin
  FEstacionamento := FEstacionamentoRepository.ObterEstacionamento(aCodigo);
  FCarroEstacionado := TCarroEstacionado.Create(aCodigo,aPlaca,aData);

  if not FEstacionamento.isOpen(FCarroEstacionado.Data) then
    Writeln('O estacionamento está fechado');

  if FEstacionamento.isFull then
    Writeln('O estacionamento está cheio');

  FEstacionamentoRepository.SalvarCarroEstacionado(FCarroEstacionado.Codigo,
    FCarroEstacionado.Placa,FCarroEstacionado.Data);
  result := FEstacionamento;
end;

end.
