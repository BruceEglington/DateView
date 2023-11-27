unit DVIW_definequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TISFDefineQuery = class(TIWAppForm)
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    IWRegion3: TIWRegion;
    IWRegion2: TIWRegion;
    iwbNextStageOfQuery: TIWButton;
    iwbCancel: TIWButton;
    IWRegion1: TIWRegion;
    iwcbContinents: TIWCheckBox;
    iwlContinents: TIWListbox;
    IWText1: TIWText;
    iwlblError: TIWLabel;
    iwrIncludes: TIWRegion;
    IWText2: TIWText;
    iwcbUnits: TIWCheckBox;
    iwcbLithologies: TIWCheckBox;
    iwcbInterpretations: TIWCheckBox;
    iwcbMaterial: TIWCheckBox;
    iwcbIsotopeSystems: TIWCheckBox;
    iwcbApproaches: TIWCheckBox;
    iwcbTechniques: TIWCheckBox;
    iwcbMethods: TIWCheckBox;
    iwcbWhoFor: TIWCheckBox;
    iwcbValidation: TIWCheckBox;
    iwcbUsersContributed: TIWCheckBox;
    iwcbBoundaryPos: TIWCheckBox;
    iwcbBoundaries: TIWCheckBox;
    iwcbChemTypes: TIWCheckBox;
    iwcbGroupingList: TIWCheckBox;
    iwcbOrogenicPeriods: TIWCheckBox;
    iwcbLIPS: TIWCheckBox;
    iwcbTerranes: TIWCheckBox;
    iwcbProvinces: TIWCheckBox;
    iwcbReferences: TIWCheckBox;
    iwcbIncludeUserOrgID: TIWCheckBox;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses DVIW_dm, ServerController, DVIW_definequery1, DB_List_Combo,
  DVIW_provinces, DVIW_constants, DVIW_uMain;

{$R *.dfm}


procedure TISFDefineQuery.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlblError.Visible := false;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwcbContinents.Checked := true;
  {
  iwcbContinents.Checked := UserSession.IncludeContinentValues;
  }
  UpdateListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  iwcbUnits.Checked := UserSession.IncludeUnitValues;
  iwcbLithologies.Checked := UserSession.IncludeLithologyValues;
  iwcbMethods.Checked := UserSession.IncludeMethodValues;
  iwcbMaterial.Checked := UserSession.IncludeMaterialValues;
  iwcbIsotopeSystems.Checked := UserSession.IncludeIsotopeSystemValues;
  iwcbApproaches.Checked := UserSession.IncludeApproachValues;
  iwcbTechniques.Checked := UserSession.IncludeTechniqueValues;
  iwcbInterpretations.Checked := UserSession.IncludeInterpretationValues;
  iwcbReferences.Checked := UserSession.IncludeReferenceValues;
  iwcbProvinces.Checked := UserSession.IncludeProvinceValues;
  iwcbTerranes.Checked := UserSession.IncludeTerraneValues;
  iwcbLIPS.Checked := UserSession.IncludeLIPValues;
  iwcbOrogenicPeriods.Checked := UserSession.IncludeOrogenicPeriodValues;
  iwcbChemTypes.Checked := UserSession.IncludeChemicalTypeValues;
  iwcbGroupingList.Checked := UserSession.IncludeGroupValues;
  iwcbBoundaries.Checked := UserSession.IncludeBoundaryValues;
  iwcbBoundaryPos.Checked := UserSession.IncludeBoundaryPositionValues;
  iwcbValidation.Checked := UserSession.IncludeValidationValues;
  iwcbWhoFor.Checked := UserSession.IncludeWhoForValues;
  iwcbUsersContributed.Checked := UserSession.IncludeUsersContributedValues;
  iwcbIncludeUserOrgID.Checked := UserSession.IncludeUserOrgID;
end;

procedure TISFDefineQuery.iwbNextStageOfQueryClick(Sender: TObject);
begin
  UserSession.IncludeContinentValues := iwcbContinents.Checked;
  GetListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  UserSession.IncludeUnitValues := iwcbUnits.Checked;
  UserSession.IncludeLithologyValues := iwcbLithologies.Checked;
  UserSession.IncludeMethodValues := iwcbMethods.Checked;
  UserSession.IncludeMaterialValues := iwcbMaterial.Checked;
  UserSession.IncludeIsotopeSystemValues := iwcbIsotopeSystems.Checked;
  UserSession.IncludeApproachValues := iwcbApproaches.Checked;
  UserSession.IncludeTechniqueValues := iwcbTechniques.Checked;
  UserSession.IncludeInterpretationValues := iwcbInterpretations.Checked;
  UserSession.IncludeProvinceValues := iwcbProvinces.Checked;
  UserSession.IncludeTerraneValues := iwcbTerranes.Checked;
  UserSession.IncludeLIPValues := iwcbLIPS.Checked;
  UserSession.IncludeOrogenicPeriodValues := iwcbOrogenicPeriods.Checked;
  UserSession.IncludeChemicalTypeValues := iwcbChemTypes.Checked;
  UserSession.IncludeGroupValues := iwcbGroupingList.Checked;
  UserSession.IncludeBoundaryValues := iwcbBoundaries.Checked;
  UserSession.IncludeBoundaryPositionValues := iwcbBoundaryPos.Checked;
  UserSession.IncludeValidationValues := iwcbValidation.Checked;
  UserSession.IncludeWhoForValues := iwcbWhoFor.Checked;
  UserSession.IncludeUserOrgID := iwcbIncludeUserOrgID.Checked;
  if Validate then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ((UserSession.UnitSender=usDetailsEdit) or (UserSession.UnitSender=usDetails)
       or (UserSession.UnitSender=usIdentifyPeaks)
       or (UserSession.UnitSender=usShowDetrital)
       or (UserSession.UnitSender=usIndividualAgeHf)
       or (UserSession.UnitSender=usMultipleAgeHf)
       or (UserSession.UnitSender=usIndividualAgeChem)
       or (UserSession.UnitSender=usMultipleAgeChem)
       )
    then TISFDefineQuery1.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usProvinces))
    then TISFProvinces.Create(WebApplication).Show;
  end;
end;

procedure TISFDefineQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    iwcbContinents.Checked := UserSession.IncludeContinentValues;
    //UpdateListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  end;
end;

function TISFDefineQuery.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if ((UserSession.ContinentValues.Count = 0) and UserSession.IncludeContinentValues) then
  begin
    UserSession.IncludeContinentValues := false;
    Result := false;
    iwlblError.Visible := true;
  end;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFDefineQuery.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
