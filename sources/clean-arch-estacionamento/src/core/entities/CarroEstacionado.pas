unit CarroEstacionado;

interface

uses
  System.RegularExpressions,
  System.SysUtils;

type
  TCarroEstacionado = class
  private
    FCodigo : String;
    FPlaca : String;
    FData : TDateTime;
    procedure SetData(const Value: TDateTime);
    procedure SetCodigo(const Value: String);
    procedure SetPlaca(const Value: String);
  public
    constructor Create(aCodigo: String; aPlaca: String; aData: TDateTime);
    property Codigo : String read FCodigo write SetCodigo;
    property Placa : String read FPlaca write SetPlaca;
    property Data : TDateTime read FData write SetData;
  end;

implementation

{ TCarroEstacionado }

constructor TCarroEstacionado.Create(aCodigo, aPlaca: String; aData: TDateTime);
begin
  if not TRegEx.IsMatch(aPlaca, '\w[A-Z]{1,3}-[0-9]{1,4}') then
    raise Exception.Create('Invalid Plate');

  FCodigo := aCodigo;
  FPlaca := aPlaca;
  FData := aData;
end;

procedure TCarroEstacionado.SetCodigo(const Value: String);
begin
  FCodigo := Value;
end;

procedure TCarroEstacionado.SetPlaca(const Value: String);
begin
  FPlaca := Value;
end;

procedure TCarroEstacionado.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

end.
