unit DVIW_calcGDUpdfs;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  DVIW_dm, DVIW_constants;

type
  TISFCalculateGDUPDFS = class(TIWAppForm)
    procedure IWAppFormShow(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
    procedure MyCalculate;
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient,  DVIW_uMain;


procedure TISFCalculateGDUPDFS.IWAppFormCreate(Sender: TObject);
begin
  //
end;

procedure TISFCalculateGDUPDFS.IWAppFormShow(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.IsDeveloper then
    begin
      MyCalculate;
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFCalculateGDUPDFS.MyCalculate;
begin
  dmDV.cdsGDUs.Close;
  if UserSession.LoggedIn then
  begin
    if UserSession.IsDeveloper then
    begin
      dmDV.CalculateGDUPDFS(WasSuccessful);
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

end.
