unit ArshinLoader;

interface
uses
  System.SysUtils, System.Classes, System.JSON, System.Net.HttpClient, System.Net.URLClient;
type
  TArshinLoader = class
  private
    FHttpClient: THttpClient;
    const BaseURL = 'https://fgis.gost.ru/fundmetrology/eapi/';
    function DoRequest(const AURL: string): string;
    function GetVerificationDataString(AYear: Integer; const ADocNum: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    function GetVerificationData(AYear: Integer; const ADocNum: string): TJSONObject;
  end;
implementation
constructor TArshinLoader.Create;
begin
  FHttpClient := THttpClient.Create;
  FHttpClient.ContentType := 'application/json';
end;
destructor TArshinLoader.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;
function TArshinLoader.DoRequest(const AURL: string): string;
var
  Response: IHTTPResponse;
begin
  try
    Response := FHttpClient.Get(AURL);
    if Response.StatusCode = 200 then
      Result := Response.ContentAsString(TEncoding.UTF8)
    else
      raise Exception.CreateFmt('Ошибка HTTP: %d %s', [Response.StatusCode, Response.StatusText]);
  except
    on E: Exception do
      raise Exception.CreateFmt('Ошибка при выполнении запроса: %s', [E.Message]);
  end;
end;
function TArshinLoader.GetVerificationDataString(AYear: Integer; const ADocNum: string): string;
var
  URL: string;
begin
  URL := Format('%svri?year=%d&search=%s', [BaseURL, AYear, ADocNum]);
  Result := DoRequest(URL);
end;
function TArshinLoader.GetVerificationData(AYear: Integer; const ADocNum: string): TJSONObject;
var
  ResponseStr: string;
begin
  ResponseStr := GetVerificationDataString(AYear, ADocNum);
  Result := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
end;
end.

