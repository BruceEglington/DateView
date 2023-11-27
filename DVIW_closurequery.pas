unit DVIW_closurequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompButton, IWCompLabel, IWCompEdit, IWCompListbox, IWCompCheckbox,
  IWVCLBaseControl, IWBaseHTMLControl;

type
  TISFClosureTemperatureQuery = class(TIWAppForm)
    iwbSubmit: TIWButton;
    rectLeft: TIWRectangle;
    iwcbIsotopeSystems: TIWCheckBox;
    iwlIsotopeSystems: TIWListbox;
    iwcbMaterial: TIWCheckBox;
    iwlMaterial: TIWListbox;
    lblError: TIWLabel;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ; 
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB_List_Combo, DVIW_closuretemperatures;




procedure TISFClosureTemperatureQuery.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwcbIsotopeSystems.Checked := UserSession.IncludeIsotopeSystemValues;
  iwcbMaterial.Checked := UserSession.IncludeMaterialValues;
  UpdateListBoxValues(iwlIsotopeSystems,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.IsotopeSystemValues);
  UpdateListBoxValues(iwlMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.MaterialValues);
end;

procedure TISFClosureTemperatureQuery.IWAppFormCreate(Sender: TObject);
begin
  ClearErrorMessages;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwcbIsotopeSystems.Checked := UserSession.IncludeIsotopeSystemValues;
  iwcbMaterial.Checked := UserSession.IncludeMaterialValues;
  UpdateListBoxValues(iwlIsotopeSystems,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.IsotopeSystemValues);
  UpdateListBoxValues(iwlMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.MaterialValues);
end;

procedure TISFClosureTemperatureQuery.iwbSubmitClick(Sender: TObject);
begin
  UserSession.IncludeIsotopeSystemValues := iwcbIsotopeSystems.Checked;
  UserSession.IncludeMaterialValues := iwcbMaterial.Checked;
  GetListBoxValues(iwlIsotopeSystems,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.IsotopeSystemValues);
  GetListBoxValues(iwlMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.MaterialValues);
  if (UserSession.IncludeIsotopeSystemValues and (UserSession.IsotopeSystemValues.Count = 0)) then UserSession.IncludeIsotopeSystemValues := false;
  if (UserSession.IncludeMaterialValues and (UserSession.MaterialValues.Count = 0)) then UserSession.IncludeMaterialValues := false;
  if Validate then
  begin
    dmDV.ConstructClosureTemperatureQuery;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFClosureTemperatures.Create(WebApplication).Show
  end;
end;

function TISFClosureTemperatureQuery.Validate: Boolean;
begin
  Result := true;
  ClearErrorMessages;
  if ((UserSession.IncludeIsotopeSystemValues = false) and (UserSession.IncludeMaterialValues)) then
  begin
    lblError.Caption := 'Selections have not been made';
    Result := false;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFClosureTemperatureQuery.ClearErrorMessages;
begin
  lblError.Caption := '';
end;

end.
