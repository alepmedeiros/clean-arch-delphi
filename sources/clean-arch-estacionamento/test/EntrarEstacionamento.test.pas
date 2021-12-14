unit EntrarEstacionamento.test;

interface

uses
  DUnitX.TestFramework,
  EntrarEstacionamento,
  Estacionamento,
  EstacionamentoRepositoryMemory,
  EstacionamentoRepositorySQL,
  EstacionamentoRepository,
  ObterEstacionamento,
  System.SysUtils;

type
  [TestFixture]
  TEnterParkinLot = class
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveEntrarEstacionamento;

    [Test]
    procedure DeveObterEstacionamento;

    [Test]
    procedure DeveEstarFechado;

    [Test]
    procedure DeveEstaCheio;
  end;

implementation

procedure TEnterParkinLot.Setup;
begin
end;

procedure TEnterParkinLot.DeveEstarFechado;
var
  lEntrarEstacionamento : TEntrarEstacionamento;
  lEstacionamento,
  lEstacionamentoAntesEntrar,
  lEstacionamentoDepoisdeEntrar : TEstacionamento;
  lEstacionamentoRepositoryMemory,
  lEstacionamentoRepositorySQL : iEstacionamentoRepository;
  lObterEstacionamento : TObterEstacionamento;
begin
  lEstacionamentoRepositoryMemory := TEstacionamentoRepositoryMemory.New;

  lEntrarEstacionamento := TEntrarEstacionamento.Create(lEstacionamentoRepositoryMemory);
  lObterEstacionamento := TObterEstacionamento.Create(lEstacionamentoRepositoryMemory);

  lEstacionamentoAntesEntrar := lObterEstacionamento.Execute('shopping');
  Assert.AreEqual(lEstacionamentoAntesEntrar.EspacosOcupados,0);

  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0001',23);

  lEntrarEstacionamento.DisposeOf;
  lEstacionamento.DisposeOf;
end;

procedure TEnterParkinLot.DeveEstaCheio;
var
  lEntrarEstacionamento : TEntrarEstacionamento;
  lEstacionamento,
  lEstacionamentoAntesEntrar,
  lEstacionamentoDepoisdeEntrar : TEstacionamento;
  lEstacionamentoRepositoryMemory : iEstacionamentoRepository;
  lObterEstacionamento : TObterEstacionamento;
begin
  lEstacionamentoRepositoryMemory := TEstacionamentoRepositoryMemory.New;

  lEntrarEstacionamento := TEntrarEstacionamento.Create(lEstacionamentoRepositoryMemory);
  lObterEstacionamento := TObterEstacionamento.Create(lEstacionamentoRepositoryMemory);

  lEstacionamentoAntesEntrar := lObterEstacionamento.Execute('shopping');
  Assert.AreEqual(lEstacionamentoAntesEntrar.EspacosOcupados,0);

  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0001',10);
  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0002',10);
  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0003',10);
  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0004',10);
  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0005',10);
  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0006',10);

  lEntrarEstacionamento.DisposeOf;
  lEstacionamento.DisposeOf;
end;

procedure TEnterParkinLot.DeveEntrarEstacionamento;
var
  lEntrarEstacionamento : TEntrarEstacionamento;
  lEstacionamento,
  lEstacionamentoAntesEntrar,
  lEstacionamentoDepoisdeEntrar : TEstacionamento;
  lEstacionamentoRepositoryMemory,
  lEstacionamentoRepositorySQL : iEstacionamentoRepository;
  lObterEstacionamento : TObterEstacionamento;
begin
  lEstacionamentoRepositoryMemory := TEstacionamentoRepositoryMemory.New;
  lEstacionamentoRepositorySQL := TEstacionamentoRepositorySQL.New;

  lEntrarEstacionamento := TEntrarEstacionamento.Create(lEstacionamentoRepositorySQL);
  lObterEstacionamento := TObterEstacionamento.Create(lEstacionamentoRepositorySQL);

  lEstacionamentoAntesEntrar := lObterEstacionamento.Execute('shopping');
  Assert.AreEqual(lEstacionamentoAntesEntrar.EspacosOcupados,0);

  lEstacionamento := lEntrarEstacionamento.Execute('shopping', 'MMM-0001',8);
  lEstacionamentoDepoisdeEntrar := lObterEstacionamento.Execute('shopping');
  Assert.AreEqual(lEstacionamentoDepoisdeEntrar.EspacosOcupados,0);

  lEntrarEstacionamento.DisposeOf;
  lEstacionamento.DisposeOf;
end;

procedure TEnterParkinLot.DeveObterEstacionamento;
var
  lEntrarEstacionamento : TEntrarEstacionamento;
  lEstacionamento,
  lEstacionamentoAntesEntrar,
  lEstacionamentoDepoisdeEntrar : TEstacionamento;
  lEstacionamentoRepositoryMemory,
  lEstacionamentoRepositorySQL : iEstacionamentoRepository;
  lObterEstacionamento : TObterEstacionamento;
begin
  lEstacionamentoRepositoryMemory := TEstacionamentoRepositoryMemory.New;
  lEstacionamentoRepositorySQL := TEstacionamentoRepositorySQL.New;

  lObterEstacionamento := TObterEstacionamento.Create(lEstacionamentoRepositorySQL);

  lEstacionamento := lObterEstacionamento.Execute('shopping');

  Assert.AreEqual(lEstacionamento.Codigo,'shopping');
end;

procedure TEnterParkinLot.TearDown;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TEnterParkinLot);

end.
