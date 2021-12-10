unit EstacionamentoRepositoryMemory;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  EstacionamentoRepository,
  Estacionamento,
  JSON,
  CarroEstacionado,
  EstacionamentoAdapter;

type
  TEstacionamentoRepositoryMemory = class(TInterfacedObject,
    iEstacionamentoRepository)
  private
    FEstacionamento, FEstacionamentoData: TEstacionamento;
    FCarroEstacionado: TObjectList<TCarroEstacionado>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iEstacionamentoRepository;
    function ObterEstacionamento(aCodigo: String): TEstacionamento;
    procedure SalVarCarroEstacionado(aCodigo, aPlaca: String; aData: TDateTime);
  end;

implementation

constructor TEstacionamentoRepositoryMemory.Create;
begin
  FCarroEstacionado := TObjectList<TCarroEstacionado>.Create;
end;

destructor TEstacionamentoRepositoryMemory.Destroy;
begin
  inherited;
end;

function TEstacionamentoRepositoryMemory.ObterEstacionamento(aCodigo: String)
  : TEstacionamento;
var
  lEspacosOcupados: Integer;
begin
  FEstacionamentoData := TEstacionamento.Create(aCodigo, 5,
    StrToDate('10/12/2021 08:00'), StrToDate('10/12/2021 22:00'), 0);
  lEspacosOcupados := FCarroEstacionado.Count;
  FEstacionamento := TEstacionamentoAdapter.Create(FEstacionamentoData.Codigo,
    FEstacionamentoData.Capacidade, FEstacionamentoData.HoraAberto,
    FEstacionamentoData.HoraFechado, lEspacosOcupados);
  Result := FEstacionamento;
end;

class function TEstacionamentoRepositoryMemory.New: iEstacionamentoRepository;
begin
  Result := Self.Create;
end;

procedure TEstacionamentoRepositoryMemory.SalvarCarroEstacionado(aCodigo, aPlaca: String;
  aData: TDateTime);
begin
  FCarroEstacionado.Add(TCarroEstacionado.Create(aCodigo, aPlaca, aData));
end;

end.
