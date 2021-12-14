unit Financial.Entities.Historic;

interface

type
  THistoric = class
  private
    FEnvetDate: String;
    FDescription: String;
  public
    property EnvetDate: String read FEnvetDate write FEnvetDate;
    property Description: String read FDescription write FDescription;
  end;

implementation

end.
