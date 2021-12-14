unit APIHorse;

interface

uses
  Horse,
  GBJSON.Helper,
  EstacionamentoRepository,
  ObterEstacionamento,
  Estacionamento,
  EstacionamentoRepositorySQL;

procedure getEstacionamento;

implementation

procedure getEstacionamento;
var
  lEstacionamentoRepositorySQL: iEstacionamentoRepository;
  lObterEstacionamento: TObterEstacionamento;
  lEstacionamento: TEstacionamento;
begin
  THorse.Get('/estacionamento/:codigo',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      lEstacionamentoRepositorySQL := TEstacionamentoRepositorySQL.New;
      lObterEstacionamento := TObterEstacionamento.Create(lEstacionamentoRepositorySQL);
      lEstacionamento := lObterEstacionamento.Execute(Req.Params['codigo']);
      Res.Send(lEstacionamento.ToJSONString);
    end);
  THorse.Listen(3000);
end;

end.
