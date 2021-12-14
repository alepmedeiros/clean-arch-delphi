unit Financial.Gateway.Interfaces;

interface

type
  iGateway = interface
    procedure Execute(const aComando: string);
    function GetValue(const aComando: string): Variant;
  end;

implementation

end.
