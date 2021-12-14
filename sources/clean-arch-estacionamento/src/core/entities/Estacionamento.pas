unit Estacionamento;

interface

type
  TEstacionamento = class
  private
    FCodigo: String;
    FHoraAberto: TDateTime;
    FCapacidade: Integer;
    FHoraFechado: TDateTime;
    FEspacosOcupados: Integer;
    procedure SetCapacidade(const Value: Integer);
    procedure SetHoraFechado(const Value: TDateTime);
    procedure SetCodigo(const Value: String);
    procedure SetHoraAberto(const Value: TDateTime);
    procedure SetEspacosOcupados(const Value: Integer);
  public
    constructor Create(aCodigo: String; aCapacidade: Integer;
      aHoraAberto, aHoraFechado: TDateTime; aEspacosOcupados: Integer);
    function isOpen(aData: TDateTime): Boolean;
    function isFull: Boolean;

    property Codigo: String read FCodigo write SetCodigo;
    property Capacidade: Integer read FCapacidade write SetCapacidade;
    property HoraAberto: TDateTime read FHoraAberto write SetHoraAberto;
    property HoraFechado: TDateTime read FHoraFechado write SetHoraFechado;
    property EspacosOcupados: Integer read FEspacosOcupados
      write SetEspacosOcupados;
  end;

implementation

{ TEstacionamento }

constructor TEstacionamento.Create(aCodigo: String; aCapacidade: Integer;
  aHoraAberto, aHoraFechado: TDateTime; aEspacosOcupados: Integer);
begin
  FCodigo := aCodigo;
  FCapacidade := aCapacidade;
  FHoraAberto := aHoraAberto;
  FHoraFechado := aHoraFechado;
  FEspacosOcupados := aEspacosOcupados;
end;

function TEstacionamento.isFull: Boolean;
begin
  Result := (FCapacidade = FEspacosOcupados);
end;

function TEstacionamento.isOpen(aData: TDateTime): Boolean;
begin
  Result := ((aData >= FHoraAberto) and (aData <= FHoraFechado));
end;

procedure TEstacionamento.SetCapacidade(const Value: Integer);
begin
  FCapacidade := Value;
end;

procedure TEstacionamento.SetHoraFechado(const Value: TDateTime);
begin
  FHoraFechado := Value;
end;

procedure TEstacionamento.SetCodigo(const Value: String);
begin
  FCodigo := Value;
end;

procedure TEstacionamento.SetEspacosOcupados(const Value: Integer);
begin
  FEspacosOcupados := Value;
end;

procedure TEstacionamento.SetHoraAberto(const Value: TDateTime);
begin
  FHoraAberto := Value;
end;

end.
