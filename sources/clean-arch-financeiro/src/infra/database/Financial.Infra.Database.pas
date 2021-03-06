unit Financial.Infra.Database;

interface

uses
  System.SysUtils,
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.SQLite,
  Firedac.Phys.SQLiteDef,
  Firedac.Stan.ExprFuncs,
  Firedac.Phys.SQLiteWrapper.Stat,
  Firedac.VCLUI.Wait,
  Firedac.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Data.DB,
  Financial.Gateway.Interfaces;

type
  TConnection = class(TInterfacedObject, iGateway)
  private
    FConnection : TFDConnection;
    FQuery : TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iGateway;
    procedure Execute(const aCommand: String);
    function GetValue(const aCommand: String) : Variant;
  end;

implementation

{ TConnection }

constructor TConnection.Create;
begin
  try
    FConnection := TFDConnection.Create(nil);
    FQuery := TFDQuery.Create(nil);
    FQuery.Connection := FConnection;
    FConnection.Params.Clear;
    FConnection.Params.Add('DriverID=SQLite');
    FConnection.Params.Add('DataBase=C:\MyRepository\clean-arch-delphi-live\sources\clean-arch-financeiro\database\dados.sdb');
    FConnection.Params.Add('LockingMode=Normal');
    FConnection.LoginPrompt := False;

    FConnection.Connected := True;
  except
    raise EArgumentException.Create('Error connecting to database');
  end;
end;

destructor TConnection.Destroy;
begin
  FConnection.DisposeOf;
  FQuery.DisposeOf;
  inherited;
end;

procedure TConnection.Execute(const aCommand: String);
begin
  try
    FQuery.SQL.Clear;
    FQuery.SQL.Add(aCommand);
    FQuery.ExecSQL;
  except on E : Exception do
    raise EArgumentException.Create('Error persisting command. ' + E.Message);
  end;
end;

function TConnection.GetValue(const aCommand: String): Variant;
begin
  try
    FQuery.SQL.Clear;
    FQuery.Open(aCommand);
    Result := FQuery.Fields[0].AsVariant;
  except on E : Exception do
    raise EArgumentException.Create('Error executing commando. ' + E.Message);
  end;
end;

class function TConnection.New: iGateway;
begin
  Result := Self.Create;
end;

end.
