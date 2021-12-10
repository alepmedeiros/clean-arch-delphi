unit database;

interface

uses
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
  Data.DB;

type
  TConexao = class
  private
    FConexao : TFDConnection;
    FQuery : TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    function OneOrNone(aSQL : String; const aArq: Array of const) : TDataSet;
    procedure None(aSQL: String; const aArq: Array of const);
  end;

implementation

uses
  System.SysUtils;

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
  FConexao.Params.Clear;
  FConexao.Params.Add('DriverID=SQLite');
  FConexao.Params.Add('DataBase=C:\MyRepository\clean-architecture-delphi-live\database\dados.sdb');
  FConexao.Params.Add('LockingMode=Normal');
  FConexao.Connected := True;
end;

destructor TConexao.Destroy;
begin
  FConexao.DisposeOf;
  FQuery.DisposeOf;
  inherited;
end;

procedure TConexao.None(aSQL: String; const aArq: array of const);
begin
  try
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(Format(aSQL,aArq));
    FQuery.ExecSQL;
  except
    raise Exception.Create('Erro ao executar sql');
  end;
end;

function TConexao.OneOrNone(aSQL: String; const aArq: array of const): TDataSet;
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Format(aSQL,aArq));
  FQuery.Open;
  Result := FQuery;
end;

end.

