unit DVIW_newrecord3;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompGrids, IWDBGrids, IWCompRectangle;

type
  TISFNewRecord3 = class(TIWAppForm)
    iwbSubmitQuery: TIWButton;
    iwcbUnit: TIWComboBox;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iwcbLithology: TIWComboBox;
    IWLabel5: TIWLabel;
    iwcbMaterial: TIWComboBox;
    IWLabel6: TIWLabel;
    iwcbIsotopeSystem: TIWComboBox;
    IWLabel7: TIWLabel;
    iwcbApproach: TIWComboBox;
    IWLabel8: TIWLabel;
    iwcbTechnique: TIWComboBox;
    IWLabel9: TIWLabel;
    iwcbMethod: TIWComboBox;
    iweDate: TIWEdit;
    iweDatePError: TIWEdit;
    IWLabel10: TIWLabel;
    IWLabel11: TIWLabel;
    iweDateMError: TIWEdit;
    IWLabel12: TIWLabel;
    iwcbNewAgeUnit: TIWComboBox;
    IWLabel13: TIWLabel;
    iwcbInterpretation: TIWComboBox;
    IWLabel14: TIWLabel;
    iwcbRating: TIWComboBox;
    IWLabel1: TIWLabel;
    iwcbReference: TIWComboBox;
    iwlWhoFor: TIWListbox;
    lblStratigraphicUnitError: TIWLabel;
    lblLithologyError: TIWLabel;
    lblMaterialError: TIWLabel;
    lblIsoSystemError: TIWLabel;
    lblApproachError: TIWLabel;
    lblTechniqueError: TIWLabel;
    lblMethodError: TIWLabel;
    lblinterpretationError: TIWLabel;
    lblRatingError: TIWLabel;
    lblAgeUnitsError: TIWLabel;
    lblReferenceError: TIWLabel;
    lblWhoForError: TIWLabel;
    IWLabel2: TIWLabel;
    lblDatesError: TIWLabel;
    rectLeft: TIWRectangle;
    iwCancel: TIWButton;
    IWLabel15: TIWLabel;
    iwcbLaboratory: TIWComboBox;
    IWLabel16: TIWLabel;
    iwcbSample: TIWComboBox;
    IWLabel17: TIWLabel;
    iwcbProvince: TIWComboBox;
    IWLabel18: TIWLabel;
    iwcbTerrane: TIWComboBox;
    iwcbIncludeProvince: TIWCheckBox;
    iwcbIncludeTerrane: TIWCheckBox;
    TopBar: TISFTopBar;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ;
  end;

implementation

uses DVIW_dm, ServerController, DVIW_constants,
  DVIW_detailsedit, DB_List_Combo, DVIW_uMain, usrIW_dm;

{$R *.dfm}


procedure TISFNewRecord3.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  ClearErrorMessages;
  dmDV.qUsersWhoFor.Close;
  dmDV.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.qReferences.Close;
  dmDV.qReferences.SQL.Clear;
  dmDV.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmDV.qReferences.SQL.Add('  CONTINENT.CONTINENT');
  dmDV.qReferences.SQL.Add('FROM SOURCELIST,CONTINENT');
  dmDV.qReferences.SQL.Add('WHERE CONTINENT.CONTINENTID = SOURCELIST.CONTINENTID');
  dmDV.qReferences.SQL.Add('AND (SOURCELIST.CONTINENTID = '+''''+UserSession.NewContinentID+'''');
  dmDV.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedContinentID+''''+')');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT >= :ReferenceStartsWith');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT <= :ReferenceEndsWith');
  dmDV.qReferences.SQL.Add('ORDER BY SOURCELIST.SOURCESHORT');
  //dmUser.SetDeveloperData(dmDV.qReferences.SQL.Text);
  dmDV.qReferences.ParamByName('ReferenceStartsWith').AsString := UserSession.ReferenceStartFrom;
  dmDV.qReferences.ParamByName('ReferenceEndsWith').AsString := UserSession.ReferenceEndWith;
  dmDV.qUnitArea.Close;
  dmDV.qUnitArea.SQL.Clear;
  dmDV.qUnitArea.SQL.Add('SELECT DISTINCT SUITECOUNTRY.UNITID, SUITECOUNTRY.COUNTRYABR, SUITE.UNITNAME');
  dmDV.qUnitArea.SQL.Add('FROM SUITECOUNTRY,SUITE, COUNTRY,CONTINENT');
  dmDV.qUnitArea.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qUnitArea.SQL.Add('AND COUNTRY.COUNTRYABR = SUITECOUNTRY.COUNTRYABR');
  dmDV.qUnitArea.SQL.Add('AND SUITE.UNITID = SUITECOUNTRY.UNITID');
  dmDV.qUnitArea.SQL.Add('AND CONTINENT.CONTINENTID = '+''''+UserSession.NewContinentID+'''');
  dmDV.qUnitArea.SQL.Add('AND COUNTRY.COUNTRYABR = '+''''+UserSession.NewAreaID+'''');
  dmDV.qUnitArea.SQL.Add('AND SUITE.UNITNAME >= :UnitStartsWith');
  dmDV.qUnitArea.SQL.Add('AND SUITE.UNITNAME <= :UnitEndsWith');
  dmDV.qUnitArea.SQL.Add('ORDER BY SUITE.UNITNAME');
  //dmUser.SetDeveloperData(dmDV.qUnitArea.SQL.Text);
  dmDV.qUnitArea.ParamByName('UnitStartsWith').AsString := UserSession.UnitStartFrom;
  dmDV.qUnitArea.ParamByName('UnitEndsWith').AsString := UserSession.UnitEndWith;
    //Provinces
    dmDV.qProvinces.Close;
    dmDV.qProvinces.SQL.Clear;
    dmDV.qProvinces.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID, DOMAINS.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qProvinces.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL <= 2');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINNAME >= :ProvinceStartsWith');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINNAME <= :ProvinceEndsWith');
    dmDV.qProvinces.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    //dmUser.SetDeveloperData(dmDV.qProvinces.SQL.Text);
    dmDV.qProvinces.ParamByName('ProvinceStartsWith').AsString := UserSession.ProvinceStartFrom;
    dmDV.qProvinces.ParamByName('ProvinceEndsWith').AsString := UserSession.ProvinceEndWith;
    //Terranes
    dmDV.qTerranes.Close;
    dmDV.qTerranes.SQL.Clear;
    dmDV.qTerranes.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID, DOMAINS.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qTerranes.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL > 2');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINNAME >= :TerraneStartsWith');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINNAME <= :TerraneEndsWith');
    dmDV.qTerranes.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    //dmUser.SetDeveloperData(dmDV.qTerranes.SQL.Text);
    dmDV.qTerranes.ParamByName('TerraneStartsWith').AsString := UserSession.TerraneStartFrom;
    dmDV.qTerranes.ParamByName('TerraneEndsWith').AsString := UserSession.TerraneEndWith;
    //Samples
    dmDV.qSamples.Close;
    dmDV.qSamples.SQL.Clear;
    dmDV.qSamples.SQL.Add('SELECT DISTINCT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
    dmDV.qSamples.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('AND SMPLOC.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qSamples.SQL.Add('AND SMPLOC.SAMPLENO >= :SampleStartsWith');
    dmDV.qSamples.SQL.Add('AND SMPLOC.SAMPLENO <= :SampleEndsWith');
    dmDV.qSamples.SQL.Add('AND SMPLOC.COUNTRYABR = '+''''+UserSession.NewAreaID+'''');
    dmDV.qSamples.SQL.Add('ORDER BY SMPLOC.SAMPLENO');
    //dmUser.SetDeveloperData(dmDV.qSamples.SQL.Text);
    dmDV.qSamples.ParamByName('SampleStartsWith').AsString := UserSession.SampleStartFrom;
    dmDV.qSamples.ParamByName('SampleEndsWith').AsString := UserSession.SampleEndWith;
  dmDV.cdsUsersWhoFor.Close;
  dmDV.cdsReferences.Close;
  dmDV.cdsUnitArea.Close;
  dmDV.cdsLithol.Close;
  dmDV.cdsApproach.Close;
  dmDV.cdsMaterial.Close;
  dmDV.cdsMethods.Close;
  dmDV.cdsIsoSystems.Close;
  dmDV.cdsTechniques.Close;
  dmDV.cdsInterpretations.Close;
  dmDV.cdsPrefLevels.Close;
  dmDV.cdsAgeUnits.Close;
  dmDV.cdsProvinces.Close;
  dmDV.cdsTerranes.Close;
  dmDV.cdsSamples.Close;
  dmDV.cdsLaboratories.Close;
  dmDV.cdsUsersWhoFor.Open;
  dmDV.cdsReferences.Open;
  dmDV.cdsUnitArea.Open;
  dmDV.cdsLithol.Open;
  dmDV.cdsApproach.Open;
  dmDV.cdsMaterial.Open;
  dmDV.cdsMethods.Open;
  dmDV.cdsIsoSystems.Open;
  dmDV.cdsTechniques.Open;
  dmDV.cdsInterpretations.Open;
  dmDV.cdsPrefLevels.Open;
  dmDV.cdsAgeUnits.Open;
  dmDV.cdsProvinces.Open;
  dmDV.cdsTerranes.Open;
  dmDV.cdsSamples.Open;
  dmDV.cdsLaboratories.Open;
  dmDV.cdsLaboratories.Open;
  if (UserSession.WhoForValues.Count = 0) then UserSession.WhoForValues.Add('PUBL');
  if (UserSession.NewAgeUnit = '') then UserSession.NewAgeUnit := 'Ma';
  iweDate.Text := FloatToStr(UserSession.NewAge);
  iweDatePError.Text := FloatToStr(UserSession.NewAgePError);
  iweDateMError.Text := FloatToStr(UserSession.NewAgeMError);
  UpdateComboBoxValue(iwcbUnit,dmDV.cdsUnitArea,'UnitName','UnitID',UserSession.NewUnitID);
  UpdateComboBoxValue(iwcbLithology,dmDV.cdsLithol,'Lithology','Lithology',UserSession.NewLithologyID);
  UpdateComboBoxValue(iwcbMethod,dmDV.cdsMethods,'MethodName','MethodAbr',UserSession.NewMethodID);
  UpdateComboBoxValue(iwcbMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.NewMaterialID);
  UpdateComboBoxValue(iwcbIsotopeSystem,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.NewIsotopeSystemID);
  UpdateComboBoxValue(iwcbApproach,dmDV.cdsApproach,'ApproachDescription','ApproachAbr',UserSession.NewApproachID);
  UpdateComboBoxValue(iwcbTechnique,dmDV.cdsTechniques,'Technique','TechAbr',UserSession.NewTechniqueID);
  UpdateComboBoxValue(iwcbInterpretation,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.NewInterpretationID);
  UpdateComboBoxValue(iwcbRating,dmDV.cdsPrefLevels,'PrefShort','PrefLevelNo',UserSession.NewRatingNum);
  UpdateComboBoxValue(iwcbNewAgeUnit,dmDV.cdsAgeUnits,'AgeUnits','AgeUnits',UserSession.NewAgeUnit);
  UpdateComboBoxValue(iwcbReference,dmDV.cdsReferences,'SOURCESHORT','SOURCENUM',UserSession.NewReferenceID);
  UpdateListBoxValues(iwlWhoFor,dmDV.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.WhoForValues);

  UpdateComboBoxValue(iwcbLaboratory,dmDV.cdsLaboratories,'LaboratoryName','LaboratoryAbr',UserSession.NewLaboratory);
  UpdateComboBoxValue(iwcbSample,dmDV.cdsSamples,'SampleNo','SampleNo',UserSession.NewSample);
  UpdateComboBoxValue(iwcbProvince,dmDV.cdsProvinces,'DOMAINNAME','DOMAINID',UserSession.NewProvince);
  UpdateComboBoxValue(iwcbTerrane,dmDV.cdsTerranes,'DOMAINNAME','DOMAINID',UserSession.NewTerrane);
end;

procedure TISFNewRecord3.iwbSubmitQueryClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  //dmUser.SetDeveloperData('Starting submit for NewRecord');
  GetComboBoxValue(iwcbUnit,dmDV.cdsUnitArea,'UnitName','UnitID',UserSession.NewUnitID);
  GetComboBoxValue(iwcbLithology,dmDV.cdsLithol,'Lithology','Lithology',UserSession.NewLithologyID);
  GetComboBoxValue(iwcbMethod,dmDV.cdsMethods,'MethodName','MethodAbr',UserSession.NewMethodID);
  GetComboBoxValue(iwcbMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.NewMaterialID);
  GetComboBoxValue(iwcbIsotopeSystem,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.NewIsotopeSystemID);
  GetComboBoxValue(iwcbApproach,dmDV.cdsApproach,'ApproachDescription','ApproachAbr',UserSession.NewApproachID);
  GetComboBoxValue(iwcbTechnique,dmDV.cdsTechniques,'Technique','TechAbr',UserSession.NewTechniqueID);
  GetComboBoxValue(iwcbInterpretation,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.NewInterpretationID);
  GetComboBoxValue(iwcbRating,dmDV.cdsPrefLevels,'PrefShort','PrefLevelNo',UserSession.NewRatingNum);
  GetComboBoxValue(iwcbNewAgeUnit,dmDV.cdsAgeUnits,'AgeUnits','AgeUnits',UserSession.NewAgeUnit);
  GetComboBoxValue(iwcbReference,dmDV.cdsReferences,'SOURCESHORT','SOURCENUM',UserSession.NewReferenceID);
  GetListBoxValues(iwlWhoFor,dmDV.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.WhoForValues);
  GetComboBoxValue(iwcbLaboratory,dmDV.cdsLaboratories,'LaboratoryName','LaboratoryAbr',UserSession.NewLaboratory);
  GetComboBoxValue(iwcbSample,dmDV.cdsSamples,'SampleNo','SampleNo',UserSession.NewSample);
  //dmUser.SetDeveloperData('Submit for NewRecord 2');
  if iwcbIncludeProvince.Checked then
    GetComboBoxValue(iwcbProvince,dmDV.cdsProvinces,'DOMAINNAME','DOMAINID',UserSession.NewProvince)
  else UserSession.NewProvince := 'Undefined';
  if iwcbIncludeTerrane.Checked then
    GetComboBoxValue(iwcbTerrane,dmDV.cdsTerranes,'DOMAINNAME','DOMAINID',UserSession.NewTerrane)
  else UserSession.NewTerrane := 'Undefined';
  if (UserSession.NewRatingNum = '') then UserSession.NewRatingNum := '1';
  if (UserSession.PreferenceLevelValue = '') then UserSession.PreferenceLevelValue := '1';
  //dmUser.SetDeveloperData('Submit for NewRecord 2');
  if Validate then
  begin
    if ((Trim(iwcbLaboratory.Text) = '') or (Trim(iwcbLaboratory.Text) = 'nd')) then UserSession.NewLaboratory := 'nd';
    if ((Trim(iwcbSample.Text) = '') or (Trim(iwcbSample.Text) = 'New')) then UserSession.NewSample := 'New';
    if ((Trim(iwcbProvince.Text) = '') or (Trim(iwcbProvince.Text) = 'Undefined')) then UserSession.NewProvince := 'Undefined';
    if ((Trim(iwcbTerrane.Text) = '') or (Trim(iwcbTerrane.Text) = 'Undefined')) then UserSession.NewTerrane := 'Undefined';
    UserSession.NewAge := StrToFloat(iweDate.Text);
    UserSession.NewAgePError := StrToFloat(iweDatePError.Text);
    UserSession.NewAgeMError := StrToFloat(iweDateMError.Text);
    dmDV.cdsAgeUnits.Close;
    dmDV.cdsApproach.Close;
    dmDV.cdsUnits.Close;
    dmDV.cdsCountries.Close;
    dmDV.cdsLithol.Close;
    dmDV.cdsMaterial.Close;
    dmDV.cdsIsoSystems.Close;
    dmDV.cdsPrefLevels.Close;
    dmDV.cdsTechniques.Close;
    dmDV.cdsMethods.Close;
    dmDV.cdsReferences.Close;
    dmDV.cdsRefTypes.Close;
    dmDV.cdsLaboratories.Close;
    dmDV.cdsImageTypes.Close;
    dmDV.cdsBoundaryPositions.Close;
    dmDV.cdsBoundaries.Close;
    dmDV.cdsProvinces.Close;
    dmDV.cdsTerranes.Close;
    dmDV.cdsGroupingList.Close;
    dmDV.cdsChemTypes.Close;
    dmDV.cdsOrogenicPeriods.Close;
    dmDV.cdsWhoFor.Close;
    dmDV.cdsValidationStatus.Close;
    dmDV.cdsSamples.Close;
    dmDV.cdsYesNo.Close;
    //dmUser.SetDeveloperData('Submit for NewRecord 3');
    dmDV.SubmitNewRecord2(WasSuccessful);
    UserSession.WhereAmI := 'After SubmitNewRecord';
    if WasSuccessful then
    begin
      WebApplication.ShowMessage('Please be sure to check the decay constant values and uncertainties assumed');
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFDetailsEdit.Create(WebApplication).Show;
    end;
  end;
end;

procedure TISFNewRecord3.IWAppFormRender(Sender: TObject);
begin
  iwcbProvince.Enabled := iwcbIncludeProvince.Checked;
  iwcbTerrane.Enabled := iwcbIncludeTerrane.Checked;
end;

function TISFNewRecord3.Validate: Boolean;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iwcbUnit.Text) = '') then
  begin
    lblStratigraphicUnitError.Caption := '''Strat. Unit'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbLithology.Text) = '') then
  begin
    lblLithologyError.Caption := '''Lithology'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbMaterial.Text) = '') then
  begin
    lblMaterialError.Caption := '''Material analysed'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbIsotopeSystem.Text) = '') then
  begin
    lblIsoSystemError.Caption := '''Isotope system'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbApproach.Text) = '') then
  begin
    lblApproachError.Caption := '''Approach'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbTechnique.Text) = '') then
  begin
    lblTechniqueError.Caption := '''Technique'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbMethod.Text) = '') then
  begin
    lblMethodError.Caption := '''Method'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbInterpretation.Text) = '') then
  begin
    lblInterpretationError.Caption := '''Interpretation'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbRating.Text) = '') then
  begin
    lblRatingError.Caption := '''Rating'' requires a value.';
    Result := false;
  end;
  if (Trim(iweDate.Text) = '') then
  begin
    lblDatesError.Caption := 'All fields for ''age and uncertainties'' require values.';
    Result := false;
  end;
  if (Trim(iweDatePError.Text) = '') then
  begin
    lblDatesError.Caption := 'All fields for ''age and uncertainties'' require values.';
    Result := false;
  end;
  if (Trim(iweDateMError.Text) = '') then
  begin
    lblDatesError.Caption := 'All fields for ''age and uncertainties'' require values.';
    Result := false;
  end;
  if (Trim(iwcbNewAgeUnit.Text) = '') then
  begin
    lblAgeUnitsError.Caption := '''Age units'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbReference.Text) = '') then
  begin
    lblReferenceError.Caption := '''Reference'' requires a value.';
    Result := false;
  end;
  if (UserSession.WhoForValues.Count = 0) then
  begin
    lblWhoForError.Caption := '''Accessable by'' requires a value.';
    Result := false;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFNewRecord3.ClearErrorMessages;
begin
  lblStratigraphicUnitError.Caption := '';
  lblLithologyError.Caption := '';
  lblMaterialError.Caption := '';
  lblIsoSystemError.Caption := '';
  lblApproachError.Caption := '';
  lblTechniqueError.Caption := '';
  lblMethodError.Caption := '';
  lblInterpretationError.Caption := '';
  lblRatingError.Caption := '';
  lblDatesError.Caption := '';
  lblAgeUnitsError.Caption := '';
  lblReferenceError.Caption := '';
  lblWhoForError.Caption := '';
end;

procedure TISFNewRecord3.iwCancelClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
