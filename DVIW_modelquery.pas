unit DVIW_modelquery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompButton, IWCompLabel, IWCompEdit, IWCompListbox, IWCompCheckbox,
  IWVCLBaseControl, IWBaseHTMLControl;

type
  TISFModelQuery = class(TIWAppForm)
    iwbSubmit: TIWButton;
    rectLeft: TIWRectangle;
    iwcbIsoSystem: TIWComboBox;
    IWLabel4: TIWLabel;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitClick(Sender: TObject);
  public
  protected
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB_List_Combo, DVIW_models;




procedure TISFModelQuery.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  UpdateComboBoxValue(iwcbIsoSystem,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.Parameter2Chosen);
end;

procedure TISFModelQuery.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  UpdateComboBoxValue(iwcbIsoSystem,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.Parameter2Chosen);
end;

procedure TISFModelQuery.iwbSubmitClick(Sender: TObject);
begin
  GetComboBoxValue(iwcbIsoSystem,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.Parameter2Chosen);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.UnitSender = 'Models') then
    begin
      TISFModels.Create(WebApplication).Show;
    end;
end;


end.
