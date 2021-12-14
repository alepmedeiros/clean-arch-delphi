unit EstacionamentoController;

interface

uses
  Data.DB;

type
  TEstacionamentoController = class
  private
  public
    class procedure getEstacionamento(params: TParam; body: String);
  end;

implementation

uses
  EstacionamentoRepository,
  Estacionamento,
  EstacionamentoRepositorySQL;

{ TEstacionamentoController }

class procedure TEstacionamentoController.getEstacionamento(params: TParam;
  body: String);
begin

end;

end.
