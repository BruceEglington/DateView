unit DVIW_datalookups;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle;

type
  TISFDataLookups = class(TIWAppForm)
    rectLeft: TIWRectangle;
    IWLabel3: TIWLabel;
    iwlModels: TIWLink;
    IWLabel16: TIWLabel;
    iwlStandards: TIWLink;
    IWLabel1: TIWLabel;
    TopBar: TISFTopBar;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwlModelsClick(Sender: TObject);
    procedure iwlStandardsClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, DVIW_modelquery, DVIW_standards;

{$R *.dfm}


procedure TISFDataLookups.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

procedure TISFDataLookups.iwlModelsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'Models';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFModelQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;


procedure TISFDataLookups.iwlStandardsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'Standards';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFStandards.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

end.
