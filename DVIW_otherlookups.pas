unit DVIW_otherlookups;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle;

type
  TISFOtherLookups = class(TIWAppForm)
    rectLeft: TIWRectangle;
    iwlInterpretations: TIWLink;
    IWLabel1: TIWLabel;
    iwlMethods: TIWLink;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iwlAreas: TIWLink;
    IWLabel4: TIWLabel;
    iwlTechniques: TIWLink;
    IWLabel5: TIWLabel;
    iwlLithologies: TIWLink;
    IWLabel6: TIWLabel;
    iwlMaterials: TIWLink;
    IWLabel7: TIWLabel;
    iwlIsoSystems: TIWLink;
    IWLabel8: TIWLabel;
    iwlPrefLevels: TIWLink;
    IWLabel9: TIWLabel;
    iwlLaboratories: TIWLink;
    IWLabel10: TIWLabel;
    iwlProvinces: TIWLink;
    IWLabel11: TIWLabel;
    iwlTerranes: TIWLink;
    IWLabel12: TIWLabel;
    iwlChemTypes: TIWLink;
    IWLabel13: TIWLabel;
    iwlOrogenic: TIWLink;
    IWLabel14: TIWLabel;
    iwlBoundaries: TIWLink;
    IWLabel15: TIWLabel;
    iwlApproaches: TIWLink;
    IWLabel16: TIWLabel;
    iwlClosureTemperatures: TIWLink;
    IWLabel17: TIWLabel;
    iwlPlates: TIWLink;
    IWLabel18: TIWLabel;
    iwlPoles: TIWLink;
    IWLabel19: TIWLabel;
    iwlUserGroups: TIWLink;
    IWLabel20: TIWLabel;
    iwlUserWhoFor: TIWLink;
    IWLabel21: TIWLabel;
    iwlLIPs: TIWLink;
    IWLabel22: TIWLabel;
    TopBar: TISFTopBar;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwlAreasClick(Sender: TObject);
    procedure iwlApproachesClick(Sender: TObject);
    procedure iwlInterpretationsClick(Sender: TObject);
    procedure iwlMaterialsClick(Sender: TObject);
    procedure iwlMethodsClick(Sender: TObject);
    procedure iwlBoundariesClick(Sender: TObject);
    procedure iwlChemTypesClick(Sender: TObject);
    procedure iwlIsoSystemsClick(Sender: TObject);
    procedure iwlLaboratoriesClick(Sender: TObject);
    procedure iwlLithologiesClick(Sender: TObject);
    procedure iwlOrogenicClick(Sender: TObject);
    procedure iwlTechniquesClick(Sender: TObject);
    procedure iwlProvincesClick(Sender: TObject);
    procedure iwlPrefLevelsClick(Sender: TObject);
    procedure iwlTerranesClick(Sender: TObject);
    procedure iwlClosureTemperaturesClick(Sender: TObject);
    procedure iwlPlatesClick(Sender: TObject);
    procedure iwlPolesClick(Sender: TObject);
    procedure iwlUserGroupsClick(Sender: TObject);
    procedure iwlUserWhoForClick(Sender: TObject);
    procedure iwlLIPsClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, DVIW_area, DVIW_approaches, DVIW_interpretations,
  DVIW_material, DVIW_methods, DVIW_boundaries, DVIW_chemtypes,
  DVIW_isosystems, DVIW_laboratories, DVIW_lithologies,
  DVIW_orogenicperiods, DVIW_techniques, DVIW_preflevels, DVIW_provinces,
  DVIW_terranes, DVIW_closurequery, DVIW_constants,
  DVIW_definequery, DVIW_usergroups, DVIW_userwhofor, DVIW_LIPs;

{$R *.dfm}


procedure TISFOtherLookups.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

procedure TISFOtherLookups.iwlAreasClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAreas.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlApproachesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFApproaches.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlInterpretationsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFInterpretations.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlMaterialsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMaterial.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlMethodsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMethods.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlBoundariesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFBoundaries.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlChemTypesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFChemTypes.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlIsoSystemsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoSystems.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlLaboratoriesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLaboratories.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlLIPsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLIPS.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlLithologiesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLithologies.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlOrogenicClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFOrogenicPeriods.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlTechniquesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFTechniques1.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlProvincesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usProvinces;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
    {
    TISFProvinces.Create(WebApplication).Show;
    }
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlPrefLevelsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFPrefLevels.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlTerranesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFTerranes.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlUserGroupsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUserGroups.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlUserWhoForClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUserWhoFor.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlClosureTemperaturesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFClosuretemperatureQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFOtherLookups.iwlPlatesClick(Sender: TObject);
begin
  {
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFPlates.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
  }
end;

procedure TISFOtherLookups.iwlPolesClick(Sender: TObject);
begin
  {
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFPoles.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
  }
end;

end.
