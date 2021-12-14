unit EstacionamentoRepositorySQL;

interface

uses
  System.SysUtils,
  JSON,
  Data.DB,
  EstacionamentoAdapter,
  EstacionamentoRepository,
  Estacionamento,
  database;

type
  TEstacionamentoRepositorySQL = class(TInterfacedObject,
    iEstacionamentoRepository)
  private
    FDatabase: TConexao;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iEstacionamentoRepository;
    function ObterEstacionamento(aCodigo: String): TEstacionamento;
    procedure SalvarCarroEstacionado(aCodigo, aPlaca: String; aData: TDateTime);
  end;

implementation

constructor TEstacionamentoRepositorySQL.Create;
begin
  FDatabase := TConexao.Create;
end;

destructor TEstacionamentoRepositorySQL.Destroy;
begin

  inherited;
end;

function TEstacionamentoRepositorySQL.ObterEstacionamento(aCodigo: String): TEstacionamento;
var
  lEstacionamento: TDataSet;
begin
  lEstacionamento := FDatabase.OneOrNone
    ('select pl.*, (select count(*) from parked_car pc where pc.code=pl.code) as occupied_spaces from parking_lot pl where pl.code = '
    + QuoTedStr('%s'), [aCodigo]);
  Result := TEstacionamentoAdapter.Create(lEstacionamento.FieldByName('code')
    .AsString, lEstacionamento.FieldByName('capacity').AsInteger,
    lEstacionamento.FieldByName('openhour').AsInteger,
    lEstacionamento.FieldByName('closehour').AsInteger,
    lEstacionamento.FieldByName('occupied_spaces').AsInteger);
end;

class function TEstacionamentoRepositorySQL.New: iEstacionamentoRepository;
begin
  Result := Self.Create;
end;

procedure TEstacionamentoRepositorySQL.SalvarCarroEstacionado(aCodigo, aPlaca: String; aData: TDateTime);
begin
  FDatabase.None('insert into parked_car values (' + QuoTedStr('%s') + ',' +
    QuoTedStr('%s') + ',%d)', [aCodigo, aPlaca, aData]);
end;

end.
