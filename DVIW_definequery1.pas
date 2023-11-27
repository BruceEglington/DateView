unit DVIW_definequery1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, DVIW_constants, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion,
  DVIW_definerawdatasamplequery, usrIW_dm, IWCompEdit;

type
  TISFDefineQuery1 = class(TIWAppForm)
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    iwrPage: TIWRegion;
    iwrRight: TIWRegion;
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
    iwrButtonsTop: TIWRegion;
    iwbNextStageOfQuery: TIWButton;
    iwbCancel: TIWButton;
    iwrAreas: TIWRegion;
    iwcbAreas: TIWCheckBox;
    iwlAreas: TIWListbox;
    iwlblError: TIWLabel;
    IWText1: TIWText;
    iwrSampleRange: TIWRegion;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweSampleTo: TIWEdit;
    iweSampleFrom: TIWEdit;
    lblFromErrorSamples: TIWLabel;
    lblToErrorSamples: TIWLabel;
    iwrReferenceRange: TIWRegion;
    IWLabel5: TIWLabel;
    iweReferenceFrom: TIWEdit;
    IWLabel6: TIWLabel;
    iweReferenceTo: TIWEdit;
    lblFromErrorRefs: TIWLabel;
    lblToErrorRefs: TIWLabel;
    IWLabel1: TIWLabel;
    iwcbIncludeUserOrgID: TIWCheckBox;
    iwrDomainRange: TIWRegion;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    iweDomainTo: TIWEdit;
    iweDomainFrom: TIWEdit;
    lblFromErrorDomains: TIWLabel;
    lblToErrorDomains: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses DVIW_dm, ServerController, DVIW_definequery2, DB_List_Combo,
  DVIW_uMain;

{$R *.dfm}


procedure TISFDefineQuery1.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlblError.Visible := false;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwcbAreas.Checked := UserSession.IncludeAreaValues;
  dmDV.qCountries.Close;
  dmDV.cdsCountries.Close;
  dmDV.qCountries.SQL.Clear;
  dmDV.qCountries.SQL.Add('select Country.CountryAbr, Country.Country, Country.CountryOffset,');
  dmDV.qCountries.SQL.Add('  Country.CountryOffset2, Country.CountryOffset3, Country.ContinentID,');
  dmDV.qCountries.SQL.Add('  Continent.Continent, Country.CountryHasRecords');
  dmDV.qCountries.SQL.Add('from Country, Continent');
  dmDV.qCountries.SQL.Add('where Country.ContinentID=Continent.ContinentID');
  dmDV.qCountries.SQL.Add('and Country.CountryHasRecords = '+''''+'Y'+'''');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qCountries.SQL.Add('AND ( COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qCountries.SQL.Add('OR COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qCountries.SQL.Add(' ) ');
  end;
  dmDV.qCountries.SQL.Add('order by Country.Country');
  //dmUser.SetDeveloperData('DefineQuery1');
  //dmUser.SetDeveloperData(dmDV.qCountries.SQL.Text);
  if ((UserSession.UnitSender = usDetailsEdit)
    or (UserSession.UnitSender = usDetails)
    or (UserSession.UnitSender = usProvinces)) then
  begin
    iwrSampleRange.Visible := false;
    iwrReferenceRange.Visible := false;
    iwrDomainRange.Visible := false;
    if (UserSession.IncludeReferenceValues) then
    begin
      iwrReferenceRange.Visible := true;
      lblFromErrorRefs.Visible := false;
      lblToErrorRefs.Visible := false;
      iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
      iweReferenceTo.Text := UserSession.ReferenceEndWith;
      if (Trim(UserSession.ReferenceStartFrom) = '') then UserSession.ReferenceStartFrom := '0';
      if (Trim(UserSession.ReferenceEndWith) = '') then UserSession.ReferenceEndWith := 'zz';
      iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
      iweReferenceTo.Text := UserSession.ReferenceEndWith;
    end;
  end;
  if ((UserSession.UnitSender=usIdentifyPeaks) or (UserSession.UnitSender=usShowDetrital)
       or (UserSession.UnitSender=usIndividualAgeHf)
       or (UserSession.UnitSender=usMultipleAgeHf)
       or (UserSession.UnitSender=usIndividualAgeChem)
       or (UserSession.UnitSender=usMultipleAgeChem)
       ) then
  begin
    //Samples
    iwrSampleRange.Visible := true;
    lblFromErrorSamples.Visible := false;
    lblToErrorSamples.Visible := false;
    if (Trim(UserSession.SampleStartFrom) = '') then UserSession.SampleStartFrom := '0';
    if (Trim(UserSession.SampleEndWith) = '') then UserSession.SampleEndWith := 'zz';
    iweSampleFrom.Text := UserSession.SampleStartFrom;
    iweSampleTo.Text := UserSession.SampleEndWith;
    //References
    iwrReferenceRange.Visible := true;
    lblFromErrorRefs.Visible := false;
    lblToErrorRefs.Visible := false;
    iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
    iweReferenceTo.Text := UserSession.ReferenceEndWith;
    if (Trim(UserSession.ReferenceStartFrom) = '') then UserSession.ReferenceStartFrom := '0';
    if (Trim(UserSession.ReferenceEndWith) = '') then UserSession.ReferenceEndWith := 'zz';
    iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
    iweReferenceTo.Text := UserSession.ReferenceEndWith;
    //Domains
    //iwrDomainRange.Visible := true;
    iwrDomainRange.Visible := (UserSession.IncludeProvinceValues or UserSession.IncludeTerraneValues);
    lblFromErrorDomains.Visible := false;
    lblToErrorDomains.Visible := false;
    if (Trim(UserSession.TerraneStartFrom) = '') then UserSession.TerraneStartFrom := '0';
    if (Trim(UserSession.TerraneEndWith) = '') then UserSession.TerraneEndWith := 'zz';
    iweDomainFrom.Text := UserSession.TerraneStartFrom;
    iweDomainTo.Text := UserSession.TerraneEndWith;
  end;
  if ((UserSession.UnitSender=usIdentifyPeaks) or (UserSession.UnitSender=usShowDetrital)
       or (UserSession.UnitSender=usIndividualAgeHf)
       or (UserSession.UnitSender=usMultipleAgeHf)
       )
  then iwrIncludes.Visible := false
  else iwrIncludes.Visible := true;
  //dmDV.cdsCountries.Open;
  UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
  if ((UserSession.UnitSender = usDetailsEdit)
    or (UserSession.UnitSender = usDetails)
    or (UserSession.UnitSender = usProvinces)) then
  begin
    iwrIncludes.Visible := true;
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
  end else
  begin
    iwrIncludes.Visible := false;
  end;
end;

procedure TISFDefineQuery1.iwbNextStageOfQueryClick(Sender: TObject);
begin
  UserSession.IncludeAreaValues := iwcbAreas.Checked;
  if UserSession.IncludeAreaValues then GetListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
  //dmUser.SetDeveloperData(dmDV.qCountries.SQL.Text);
  if ((UserSession.UnitSender=usIdentifyPeaks) or (UserSession.UnitSender=usShowDetrital)
       or (UserSession.UnitSender=usIndividualAgeHf)
       or (UserSession.UnitSender=usMultipleAgeHf)
       or (UserSession.UnitSender=usIndividualAgeChem)
       or (UserSession.UnitSender=usMultipleAgeChem)
       ) then
  begin
    //UserSession.IncludeProvinceValues := iwcbProvinces.Checked;
    //UserSession.IncludeTerraneValues := iwcbTerranes.Checked;
    Usersession.SampleStartFrom := Trim(iweSampleFrom.Text);
    Usersession.SampleEndWith := Trim(iweSampleTo.Text);
    UserSession.IncludeReferenceValues := iwcbReferences.Checked;
    Usersession.ReferenceStartFrom := Trim(iweReferenceFrom.Text);
    Usersession.ReferenceEndWith := Trim(iweReferenceTo.Text);
    Usersession.TerraneStartFrom := Trim(iweDomainFrom.Text);
    Usersession.TerraneEndWith := Trim(iweDomainTo.Text);
  end;
  if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
  begin
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
    if (UserSession.IncludeReferenceValues) then
    begin
      Usersession.ReferenceStartFrom := Trim(iweReferenceFrom.Text);
      Usersession.ReferenceEndWith := Trim(iweReferenceTo.Text);
    end;
  end;
  if ((UserSession.UnitSender = usProvinces)) then
  begin
    UserSession.IncludeProvinceValues := iwcbProvinces.Checked;
    UserSession.IncludeTerraneValues := iwcbTerranes.Checked;
  end;
  if Validate then
  begin
    if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
    begin
      dmDV.SubmitContAreaQuery;
    end;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ((UserSession.UnitSender=usDetailsEdit) or (UserSession.UnitSender=usDetails)) then
      TISFDefineQuery2.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usIdentifyPeaks) or (UserSession.UnitSender=usShowDetrital)) then
      TISFDefineRawDataSampleQuery.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usIndividualAgeHf) or (UserSession.UnitSender=usMultipleAgeHf)) then
      TISFDefineRawDataSampleQuery.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usIndividualAgeChem) or (UserSession.UnitSender=usMultipleAgeChem)) then
      TISFDefineRawDataSampleQuery.Create(WebApplication).Show;
  end;
end;

procedure TISFDefineQuery1.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    iwcbAreas.Checked := UserSession.IncludeAreaValues;
    //UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
  end;
end;

function TISFDefineQuery1.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if ((UserSession.AreaValues.Count = 0) and UserSession.IncludeAreaValues) then
  begin
    UserSession.IncludeAreaValues := false;
    Result := false;
    iwlblError.Visible := true;
  end;
  if ((UserSession.UnitSender=usIdentifyPeaks) or (UserSession.UnitSender=usShowDetrital)
       or (UserSession.UnitSender=usIndividualAgeHf)
       or (UserSession.UnitSender=usMultipleAgeHf)
       or (UserSession.UnitSender=usIndividualAgeChem)
       or (UserSession.UnitSender=usMultipleAgeChem)
       ) then
  begin
    if (Trim(iweSampleFrom.Text) = '') then
    begin
      lblFromErrorSamples.Caption := '''Samples ranging from'' requires a value.';
      Result := false;
    end;
    if (Trim(iweSampleTo.Text) = '') then
    begin
      lblToErrorSamples.Caption := '''Samples ranging to'' requires a value.';
      Result := false;
    end;
    if (Trim(iweReferenceFrom.Text) = '') then
    begin
      lblFromErrorRefs.Caption := '''References ranging from'' requires a value.';
      Result := false;
    end;
    if (Trim(iweReferenceTo.Text) = '') then
    begin
      lblToErrorRefs.Caption := '''References ranging to'' requires a value.';
      Result := false;
    end;
    if (UserSession.IncludeProvinceValues or UserSession.IncludeTerraneValues) then
    begin
      if (Trim(iweDomainFrom.Text) = '') then
      begin
        lblFromErrorDomains.Caption := '''Domains ranging from'' requires a value.';
        Result := false;
      end;
      if (Trim(iweDomainTo.Text) = '') then
      begin
        lblToErrorDomains.Caption := '''Domains ranging to'' requires a value.';
        Result := false;
      end;
    end;
  end;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFDefineQuery1.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
