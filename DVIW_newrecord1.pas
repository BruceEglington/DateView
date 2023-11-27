unit DVIW_newrecord1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle;

type
  TISFNewRecord1 = class(TIWAppForm)
    iwbNextStageOfQuery: TIWButton;
    IWText1: TIWText;
    iwcbContinent: TIWComboBox;
    IWLabel1: TIWLabel;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    TopBar: TISFTopBar;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  end;

implementation

uses DVIW_dm, ServerController, DVIW_newrecord2, DB_List_Combo, DVIW_uMain;

{$R *.dfm}


procedure TISFNewRecord1.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  SetComboBox(iwcbContinent,dmDV.cdsContinents,'Continent','ContinentID');
end;

procedure TISFNewRecord1.iwbNextStageOfQueryClick(Sender: TObject);
begin
  GetComboBoxValue(iwcbContinent,dmDV.cdsContinents,'Continent','ContinentID',UserSession.NewContinentID);
  dmDV.cdsContinents.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFNewRecord2.Create(WebApplication).Show;
end;

procedure TISFNewRecord1.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UpdateComboBoxValue(iwcbContinent,dmDV.cdsContinents,'Continent','ContinentID',UserSession.NewContinentID);
  end;
end;

procedure TISFNewRecord1.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
