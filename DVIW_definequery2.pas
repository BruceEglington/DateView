unit DVIW_definequery2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TISFDefineQuery2 = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwrLeftBar: TIWRegion;
    iwrRightChannel: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwbSubmitQuery: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbCancel: TIWButton;
    IWText1: TIWText;
    iwcbGoDirectToGraphs: TIWCheckBox;
    iwrEpsilon: TIWRegion;
    iwrLithologies: TIWRegion;
    iwrUnits: TIWRegion;
    iwlUnits: TIWListbox;
    iwcbUnits: TIWCheckBox;
    IWButton8: TIWButton;
    iwlLithologies: TIWListbox;
    iwcbLithologies: TIWCheckBox;
    iwlblErrorTop: TIWLabel;
    iwrBoundaryPositions: TIWRegion;
    iwrBoundaries: TIWRegion;
    iwrUserGroups: TIWRegion;
    iwrChemicalAssociations: TIWRegion;
    iwrOrogenicPeriods: TIWRegion;
    iwrLIPs: TIWRegion;
    iwrTerranes: TIWRegion;
    iwrProvinces: TIWRegion;
    iwrReferences: TIWRegion;
    iwrRatingDateRange: TIWRegion;
    iwrInterpretations: TIWRegion;
    iwrTechniques: TIWRegion;
    iwrApproaches: TIWRegion;
    iwrIsotopeSystems: TIWRegion;
    iwrMaterialAnalysed: TIWRegion;
    iwrMethodologies: TIWRegion;
    iwlMethods: TIWListbox;
    iwcbMethods: TIWCheckBox;
    IWButton7: TIWButton;
    iwlMaterial: TIWListbox;
    iwcbMaterial: TIWCheckBox;
    iwlIsotopeSystems: TIWListbox;
    iwcbIsotopeSystems: TIWCheckBox;
    iwlApproaches: TIWListbox;
    iwcbApproaches: TIWCheckBox;
    IWButton6: TIWButton;
    iwlTechniques: TIWListbox;
    iwcbTechniques: TIWCheckBox;
    iwlInterpretations: TIWListbox;
    iwcbInterpretations: TIWCheckBox;
    iwcbDCWith: TIWCheckBox;
    iwcbDCWithout: TIWCheckBox;
    IWButton5: TIWButton;
    IWLabel2: TIWLabel;
    iwcbMSWD: TIWCheckBox;
    iwcbAgeUnits: TIWComboBox;
    iwcbIncludeAgeUnits: TIWCheckBox;
    iweToDate: TIWEdit;
    iwcbToDate: TIWCheckBox;
    iweFromDate: TIWEdit;
    iwcbFromDate: TIWCheckBox;
    iwcbPreferenceLevel: TIWComboBox;
    IWLabel1: TIWLabel;
    iwlReferences: TIWListbox;
    iwcbReferences: TIWCheckBox;
    IWButton4: TIWButton;
    iwlProvinces: TIWListbox;
    iwcbProvinces: TIWCheckBox;
    iwlTerranes: TIWListbox;
    iwcbTerranes: TIWCheckBox;
    iwlLIPS: TIWListbox;
    iwcbLIPS: TIWCheckBox;
    IWButton3: TIWButton;
    iwlOrogenicPeriods: TIWListbox;
    iwcbOrogenicPeriods: TIWCheckBox;
    iwlChemTypes: TIWListbox;
    iwcbChemTypes: TIWCheckBox;
    iwlGroupingList: TIWListbox;
    iwcbGroupingList: TIWCheckBox;
    IWButton2: TIWButton;
    iwlBoundaries: TIWListbox;
    iwcbBoundaries: TIWCheckBox;
    iwlBoundaryPos: TIWListbox;
    iwcbBoundaryPos: TIWCheckBox;
    iwrCoordinates: TIWRegion;
    iwrWhoFor: TIWRegion;
    iwrOrderBy: TIWRegion;
    iwrValidation: TIWRegion;
    IWButton1: TIWButton;
    iwlValidation: TIWListbox;
    iwcbValidation: TIWCheckBox;
    iwrgOrderBy: TIWRadioGroup;
    IWLabel4: TIWLabel;
    IWButton9: TIWButton;
    iwlWhoFor: TIWListbox;
    iwcbWhoFor: TIWCheckBox;
    iwlNegativeWS: TIWLabel;
    iwlPositiveEN: TIWLabel;
    iweNELon: TIWEdit;
    iweSWLon: TIWEdit;
    iwlSWLon: TIWLabel;
    iwlNELon: TIWLabel;
    iweNELat: TIWEdit;
    iweSWLat: TIWEdit;
    iwlSWLat: TIWLabel;
    iwlNELat: TIWLabel;
    iwcbCoordinates: TIWCheckBox;
    iwlblErrorEpsilonTo: TIWLabel;
    iweToEpsilon: TIWEdit;
    iwcbToEpsilon: TIWCheckBox;
    iwlblErrorEpsilonFrom: TIWLabel;
    iweFromEpsilon: TIWEdit;
    iwcbFromEpsilon: TIWCheckBox;
    iwrContributors: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwlUsersContributed: TIWListbox;
    iwcbUsersContributed: TIWCheckBox;
    iwlblErrorBottom: TIWLabel;
    iwbSubmitQuery2: TIWButton;
    iwrRecordID: TIWRegion;
    iweRecordIDFrom: TIWEdit;
    iwcbRecordIDrange: TIWCheckBox;
    iwrAccount: TIWRegion;
    iwrgAccountMatch: TIWRadioGroup;
    iwcbIncludeUserOrgID: TIWCheckBox;
    IWLabel3: TIWLabel;
    IWLabel5: TIWLabel;
    iweRecordIDTo: TIWEdit;
    IWLabel6: TIWLabel;
    iwcbIncludeIgneous: TIWCheckBox;
    iwcbIncludeSedimentary: TIWCheckBox;
    iwcbIncludeMetamorphicAndOther: TIWCheckBox;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbClearCheckboxesClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses DVIW_dm, ServerController, DVIW_frGrid, DVIW_constants, DB_List_Combo,
  DVIW_uMain, AllSorts, DVIW_selectgraph, usrIW_dm;

{$R *.dfm}


procedure TISFDefineQuery2.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwlblErrorEpsilonFrom.Visible := false;
  iwlblErrorEpsilonTo.Visible := false;
  //References
  if (Trim(UserSession.ReferenceStartFrom) = '') then UserSession.ReferenceStartFrom := '0';
  if (Trim(UserSession.ReferenceEndWith) = '') then UserSession.ReferenceEndWith := 'zz';
  dmDV.qReferences.Close;
  //dmDV.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'A';
  //dmDV.qReferences.ParamByName('LASTREFERENCE').AsString := 'zzz';
  dmDV.qReferences.ParamByName('FIRSTREFERENCE').AsString := UserSession.ReferenceStartFrom;
  dmDV.qReferences.ParamByName('LASTREFERENCE').AsString := UserSession.ReferenceEndWith;
  iwrCoordinates.Visible := UserSession.CanView;
  iwcbFromEpsilon.Visible := UserSession.CanView;
  iweFromEpsilon.Visible := UserSession.CanView;
  iwcbToEpsilon.Visible := UserSession.CanView;
  iweToEpsilon.Visible := UserSession.CanView;
  //iwcbWhoFor.Visible := UserSession.IsDeveloper;
  //iwlWhoFor.Visible := UserSession.IsDeveloper;
  iwrUnits.Visible := UserSession.IncludeUnitValues;
  iwrLithologies.Visible := UserSession.IncludeLithologyValues;
  iwcbIncludeIgneous.Checked := UserSession.IncludeIgneous;
  iwcbIncludeSedimentary.Checked := UserSession.IncludeSedimentary;
  iwcbIncludeMetamorphicAndOther.Checked := UserSession.IncludeMetamorphicAndOther;
  iwrMethodologies.Visible := UserSession.IncludeMethodValues;
  iwrMaterialAnalysed.Visible := UserSession.IncludeMaterialValues;
  iwrIsotopeSystems.Visible := UserSession.IncludeIsotopeSystemValues;
  iwrApproaches.Visible := UserSession.IncludeApproachValues;
  iwrTechniques.Visible := UserSession.IncludeTechniqueValues;
  iwrInterpretations.Visible := UserSession.IncludeInterpretationValues;
  iwrReferences.Visible := UserSession.IncludeReferenceValues;
  iwrProvinces.Visible := UserSession.IncludeProvinceValues;
  iwrTerranes.Visible := UserSession.IncludeTerraneValues;
  iwrLIPs.Visible := UserSession.IncludeLIPValues;
  iwrOrogenicPeriods.Visible := UserSession.IncludeOrogenicPeriodValues;
  iwrChemicalAssociations.Visible := UserSession.IncludeChemicalTypeValues;
  iwrUserGroups.Visible := UserSession.IncludeGroupValues;
  iwrBoundaries.Visible := UserSession.IncludeBoundaryValues;
  iwrBoundaryPositions.Visible := UserSession.IncludeBoundaryPositionValues;
  iwrValidation.Visible := UserSession.IncludeValidationValues;
  iwrWhoFor.Visible := UserSession.IncludeWhoForValues;
  iwrContributors.Visible := UserSession.IncludeUsersContributedValues;
  iwrAccount.Visible := UserSession.IncludeUserOrgID;
  //iwrRecordID.Visible := UserSession.IncludeUsersContributedValues;
  iwcbGoDirectToGraphs.Checked := UserSession.GoDirectToGraphs;
  if (UserSession.IncludeUnitValues) then iwcbUnits.Checked := UserSession.IncludeUnitValues;
  if (UserSession.IncludeLithologyValues) then iwcbLithologies.Checked := UserSession.IncludeLithologyValues;
  if (UserSession.IncludeMethodValues) then iwcbMethods.Checked := UserSession.IncludeMethodValues;
  if (UserSession.IncludeMaterialValues) then iwcbMaterial.Checked := UserSession.IncludeMaterialValues;
  if (UserSession.IncludeIsotopeSystemValues) then iwcbIsotopeSystems.Checked := UserSession.IncludeIsotopeSystemValues;
  if (UserSession.IncludeApproachValues) then iwcbApproaches.Checked := UserSession.IncludeApproachValues;
  if (UserSession.IncludeTechniqueValues) then iwcbTechniques.Checked := UserSession.IncludeTechniqueValues;
  if (UserSession.IncludeInterpretationValues) then iwcbInterpretations.Checked := UserSession.IncludeInterpretationValues;
  if (UserSession.IncludeReferenceValues) then iwcbReferences.Checked := UserSession.IncludeReferenceValues;
  if (UserSession.IncludeProvinceValues) then iwcbProvinces.Checked := UserSession.IncludeProvinceValues;
  if (UserSession.IncludeTerraneValues) then iwcbTerranes.Checked := UserSession.IncludeTerraneValues;
  if (UserSession.IncludeLIPValues) then iwcbLIPS.Checked := UserSession.IncludeLIPValues;
  if (UserSession.IncludeOrogenicPeriodValues) then iwcbOrogenicPeriods.Checked := UserSession.IncludeOrogenicPeriodValues;
  if (UserSession.IncludeChemicalTypeValues) then iwcbChemTypes.Checked := UserSession.IncludeChemicalTypeValues;
  if (UserSession.IncludeGroupValues) then iwcbGroupingList.Checked := UserSession.IncludeGroupValues;
  if (UserSession.IncludeBoundaryValues) then iwcbBoundaries.Checked := UserSession.IncludeBoundaryValues;
  if (UserSession.IncludeBoundaryPositionValues) then iwcbBoundaryPos.Checked := UserSession.IncludeBoundaryPositionValues;
  if (UserSession.IncludeValidationValues) then iwcbValidation.Checked := UserSession.IncludeValidationValues;
  if (UserSession.IncludeWhoForValues) then iwcbWhoFor.Checked := UserSession.IncludeWhoForValues;
  if (UserSession.IncludeUserOrgID) then
  begin
    iwcbIncludeUserOrgID.Checked := UserSession.IncludeUserOrgID;
    if (UserSession.UserOrgIDValue = 'Y') then iwrgAccountMatch.ItemIndex := 0;
    if (UserSession.UserOrgIDValue = 'N') then iwrgAccountMatch.ItemIndex := 1;
  end;
  iwcbRecordIDrange.Checked := UserSession.IncludeRecordIDValueRange;
  iwcbFromDate.Checked := UserSession.IncludeDateFromValue;
  iwcbToDate.Checked := UserSession.IncludeDateToValue;
  iwcbIncludeAgeUnits.Checked := UserSession.IncludeAgeUnitsValue;
  iweFromDate.Text := UserSession.DateFromField;
  iweToDate.Text := UserSession.DateToField;
  iwcbFromEpsilon.Checked := UserSession.IncludeEpsilonFromValue;
  iwcbToEpsilon.Checked := UserSession.IncludeEpsilonToValue;
  iweFromEpsilon.Text := UserSession.EpsilonFromValue;
  iweToEpsilon.Text := UserSession.EpsilonToValue;
  iweRecordIDFrom.Text := UserSession.RecordIDValueFrom;
  iweRecordIDTo.Text := UserSession.RecordIDValueTo;
  iwcbUsersContributed.Checked := UserSession.IncludeUsersContributedValues;
  //if UserSession.IncludeAgeUnitsValue then iwcbIncludeAgeUnits.Checked := true;
  if UserSession.IncludeIsochronOnlyValue then iwcbMSWD.Checked := true;
  if (UserSession.DecayUncertaintyValues.Count = 0) then
  begin
    iwcbDCWithout.Checked := true;
    iwcbDCWith.Checked := true;
    UserSession.DecayUncertaintyValues.Clear;
    UserSession.DecayUncertaintyValues.Add('WithDCerrors');
    UserSession.DecayUncertaintyValues.Add('WithoutDCerrors');
  end;
  if (UserSession.DecayUncertaintyValues.Count = 2) then
  begin
    iwcbDCWithout.Checked := true;
    iwcbDCWith.Checked := true;
  end;
  if (UserSession.DecayUncertaintyValues.Count = 1) then
  begin
    iwcbDCWithout.Checked := false;
    iwcbDCWith.Checked := false;
    if (UserSession.DecayUncertaintyValues[0] = 'WithoutDCerrors') then iwcbDCWithout.Checked := true;
    if (UserSession.DecayUncertaintyValues[0] = 'WithDCerrors') then iwcbDCWith.Checked := true;
  end;
  dmDV.cdsAgeUnits.Open;
  if (UserSession.AgeUnitsValue = '') then UserSession.AgeUnitsValue := dmDV.cdsAgeUnitsAGEUNITS.AsString;
  dmDV.cdsAgeUnits.Close;
  if ((UserSession.PreferenceLevelValue < '0') or (UserSession.PreferenceLevelValue > '3'))
    then UserSession.PreferenceLevelValue := '1';
  if (UserSession.ConfidentialValue = '') then UserSession.ConfidentialValue := '0';
  try
    if ((UserSession.OrderByValue >= '0') and (UserSession.OrderByValue <= '9')) then iwrgOrderBy.ItemIndex := StrToInt(UserSession.OrderByValue)
    else iwrgOrderBy.ItemIndex := 0;
  except
    WebApplication.ShowMessage('Error in OrderByValue. It is '+UserSession.OrderByValue);
  end;
  if (UserSession.IncludeCoordinates) then
  begin
    iwcbCoordinates.Checked := UserSession.IncludeCoordinates;
    iweNELat.Text := UserSession.NELat;
    iweNELon.Text := UserSession.NELon;
    iweSWLat.Text := UserSession.SWLat;
    iweSWLon.Text := UserSession.SWLon;
  end;
  {
  if (UserSession.IsDeveloper and UserSession.IncludeAreaValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qUnitArea.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeUnitValues) then UpdateListBoxValues(iwlUnits,dmDV.cdsUnitArea,'UnitName','UnitID',UserSession.UnitValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeLithologyValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qLithol.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeLithologyValues) then UpdateListBoxValues(iwlLithologies,dmDV.cdsLithol,'Lithology','Lithology',UserSession.LithologyValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeMethodValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qMethods.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeMethodValues) then UpdateListBoxValues(iwlMethods,dmDV.cdsMethods,'MethodName','MethodAbr',UserSession.MethodValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeMaterialValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qMaterial.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeMaterialValues) then UpdateListBoxValues(iwlMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.MaterialValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeIsotopeSystemValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qIsoSystems.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeIsotopeSystemValues) then UpdateListBoxValues(iwlIsotopeSystems,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.IsotopeSystemValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeApproachValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qApproach.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeApproachValues) then UpdateListBoxValues(iwlApproaches,dmDV.cdsApproach,'ApproachDescription','ApproachAbr',UserSession.ApproachValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeTechniqueValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qTechniques.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeTechniqueValues) then UpdateListBoxValues(iwlTechniques,dmDV.cdsTechniques,'Technique','TechAbr',UserSession.TechniqueValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeInterpretationValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qInterpretations.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeInterpretationValues) then UpdateListBoxValues(iwlInterpretations,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.InterpretationValues);
  {
  if (UserSession.IsDeveloper) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qPrefLevels.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  UpdateComboBoxValue(iwcbPreferenceLevel,dmDV.cdsPrefLevels,'PrefShort','PrefLevelNo',UserSession.PreferenceLevelValue);
  {
  if (UserSession.IsDeveloper) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qAgeUnits.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  UpdateComboBoxValue(iwcbAgeUnits,dmDV.cdsAgeUnits,'AgeUnits','AgeUnits',UserSession.AgeUnitsValue);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeReferenceValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qReferences.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeReferenceValues) then UpdateListBoxValues(iwlReferences,dmDV.cdsReferences,'SourceSHORT','SourceNum',UserSession.ReferenceValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeProvinceValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qProvinces.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeProvinceValues) then UpdateListBoxValues(iwlProvinces,dmDV.cdsProvinces,'DomainName','DomainID',UserSession.ProvinceValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeTerraneValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qTerranes.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeTerraneValues) then UpdateListBoxValues(iwlTerranes,dmDV.cdsTerranes,'DomainName','DomainID',UserSession.TerraneValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeLIPValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qLIPs.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeLIPValues) then UpdateListBoxValues(iwlLIPS,dmDV.cdsLIPs,'LIPNAME','LIPID',UserSession.LIPValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeOrogenicPeriodValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qOrogenicPeriods.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeOrogenicPeriodValues) then UpdateListBoxValues(iwlOrogenicPeriods,dmDV.cdsOrogenicPeriods,'Orogenicperiod','OrogenicPeriodID',UserSession.OrogenicPeriodValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeChemicalTypeValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qChemTypes.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeChemicalTypeValues) then UpdateListBoxValues(iwlChemTypes,dmDV.cdsChemTypes,'ChemicalType','ChemTypeAbr',UserSession.ChemicalTypeValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeGroupValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qGroupingList.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeGroupValues) then UpdateListBoxValues(iwlGroupingList,dmDV.cdsGroupingList,'Grouping','Grouping',UserSession.GroupValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeBoundaryValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qBoundaries.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeBoundaryValues) then UpdateListBoxValues(iwlBoundaries,dmDV.cdsBoundaries,'BoundaryName','BoundaryID',UserSession.BoundaryValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeBoundaryPositionValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qBoundaryPositions.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeBoundaryPositionValues) then UpdateListBoxValues(iwlBoundaryPos,dmDV.cdsBoundaryPositions,'BoundaryPosition','BoundPosID',UserSession.BoundaryPositionValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeValidationValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qValidationStatus.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeValidationValues) then UpdateListBoxValues(iwlValidation,dmDV.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeWhoForValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qUsersWhoFor.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeWhoForValues) then UpdateListBoxValues(iwlWhoFor,dmDV.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.WhoForValues);
  {
  if (UserSession.IsDeveloper) and (UserSession.IncludeUsersContributedValues) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues '+dmDV.qUsersContributed.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  if (UserSession.IncludeUsersContributedValues) then UpdateListBoxValues(iwlUsersContributed,dmDV.cdsUsersContributed,'USERID','USERID',UserSession.UsersContributedValues);
  {
  if (UserSession.IsDeveloper) then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'UpdateListBoxValues completed';
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  iwcbUsersContributed.Visible := UserSession.IsDeveloper;
  iwlUsersContributed.Visible := UserSession.IsDeveloper;
end;

procedure TISFDefineQuery2.iwbSubmitQueryClick(Sender: TObject);
var
  t1 : double;
  iCode : integer;
begin
  if iwcbGoDirectToGraphs.Checked then UserSession.GoDirectTographs := true
                                  else UserSession.GoDirectTographs := false;
  UserSession.DataHaveChanged := true;
  UserSession.PDFHasChanged := true;
  UserSession.OrderByValue := IntToStr(iwrgOrderBy.ItemIndex);
  UserSession.IncludeUnitValues := iwcbUnits.Checked;
  UserSession.IncludeLithologyValues := iwcbLithologies.Checked;
  UserSession.IncludeIgneous := iwcbIncludeIgneous.Checked;
  UserSession.IncludeSedimentary := iwcbIncludeSedimentary.Checked;
  UserSession.IncludeMetamorphicAndOther := iwcbIncludeMetamorphicAndOther.Checked;
  UserSession.IncludeMethodValues := iwcbMethods.Checked;
  UserSession.IncludeMaterialValues := iwcbMaterial.Checked;
  UserSession.IncludeIsotopeSystemValues := iwcbIsotopeSystems.Checked;
  UserSession.IncludeApproachValues := iwcbApproaches.Checked;
  UserSession.IncludeTechniqueValues := iwcbTechniques.Checked;
  UserSession.IncludeInterpretationValues := iwcbInterpretations.Checked;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
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
  UserSession.IncludeUsersContributedValues := iwcbUsersContributed.Checked;
  UserSession.IncludeAgeUnitsValue := iwcbIncludeAgeUnits.Checked;
  UserSession.IncludeUserOrgID := iwcbIncludeUserOrgID.Checked;
  if (UserSession.IncludeUserOrgID) then
  begin
    if (iwrgAccountMatch.ItemIndex = 0) then UserSession.UserOrgIDValue := 'Y';
    if (iwrgAccountMatch.ItemIndex = 1) then UserSession.UserOrgIDValue := 'N';
  end;
  if UserSession.IncludeUnitValues then GetListBoxValues(iwlUnits,dmDV.cdsUnitArea,'UnitName','UnitID',UserSession.UnitValues);
  if UserSession.IncludeLithologyValues then GetListBoxValues(iwlLithologies,dmDV.cdsLithol,'Lithology','Lithology',UserSession.LithologyValues);
  if UserSession.IncludeMethodValues then GetListBoxValues(iwlMethods,dmDV.cdsMethods,'MethodName','MethodAbr',UserSession.MethodValues);
  if UserSession.IncludeMaterialValues then GetListBoxValues(iwlMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.MaterialValues);
  if UserSession.IncludeIsotopeSystemValues then GetListBoxValues(iwlIsotopeSystems,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.IsotopeSystemValues);
  if UserSession.IncludeApproachValues then GetListBoxValues(iwlApproaches,dmDV.cdsApproach,'ApproachDescription','ApproachAbr',UserSession.ApproachValues);
  if UserSession.IncludeTechniqueValues then GetListBoxValues(iwlTechniques,dmDV.cdsTechniques,'Technique','TechAbr',UserSession.TechniqueValues);
  if UserSession.IncludeInterpretationValues then GetListBoxValues(iwlInterpretations,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.InterpretationValues);
  GetComboBoxValue(iwcbPreferenceLevel,dmDV.cdsPrefLevels,'PrefShort','PrefLevelNo',UserSession.PreferenceLevelValue);
  if UserSession.IncludeAgeUnitsValue then GetComboBoxValue(iwcbAgeUnits,dmDV.cdsAgeUnits,'AgeUnits','AgeUnits',UserSession.AgeUnitsValue);
  if UserSession.IncludeReferenceValues then GetListBoxValues(iwlReferences,dmDV.cdsReferences,'SourceSHORT','SourceNum',UserSession.ReferenceValues);
  if UserSession.IncludeProvinceValues then GetListBoxValues(iwlProvinces,dmDV.cdsProvinces,'DomainName','DomainID',UserSession.ProvinceValues);
  if UserSession.IncludeTerraneValues then GetListBoxValues(iwlTerranes,dmDV.cdsTerranes,'DomainName','DomainID',UserSession.TerraneValues);
  if UserSession.IncludeLIPValues then GetListBoxValues(iwlLIPS,dmDV.cdsLIPS,'LIPNAME','LIPID',UserSession.LIPValues);
  if UserSession.IncludeOrogenicPeriodValues then GetListBoxValues(iwlOrogenicPeriods,dmDV.cdsOrogenicPeriods,'Orogenicperiod','OrogenicPeriodID',UserSession.OrogenicPeriodValues);
  if UserSession.IncludeChemicalTypeValues then GetListBoxValues(iwlChemTypes,dmDV.cdsChemTypes,'ChemicalType','ChemTypeAbr',UserSession.ChemicalTypeValues);
  if UserSession.IncludeGroupValues then GetListBoxValues(iwlGroupingList,dmDV.cdsGroupingList,'Grouping','Grouping',UserSession.GroupValues);
  if UserSession.IncludeBoundaryValues then GetListBoxValues(iwlBoundaries,dmDV.cdsBoundaries,'BoundaryName','BoundaryID',UserSession.BoundaryValues);
  if UserSession.IncludeBoundaryPositionValues then GetListBoxValues(iwlBoundaryPos,dmDV.cdsBoundaryPositions,'BoundaryPosition','BoundPosID',UserSession.BoundaryPositionValues);
  if UserSession.IncludeValidationValues then GetListBoxValues(iwlValidation,dmDV.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
  if UserSession.IncludeWhoForValues then GetListBoxValues(iwlWhoFor,dmDV.cdsWhoFor,'WhoFor','WhoForID',UserSession.WhoForValues);
  if UserSession.IncludeUsersContributedValues then GetListBoxValues(iwlUsersContributed,dmDV.cdsUsersContributed,'USERID','USERID',UserSession.UsersContributedValues);
  UserSession.IncludeDateFromValue := iwcbFromDate.Checked;
  UserSession.IncludeDateToValue := iwcbToDate.Checked;
  if UserSession.IncludeDateFromValue then UserSession.DateFromField := Trim(iweFromDate.Text);
  if UserSession.IncludeDateToValue then UserSession.DateToField := Trim(iweToDate.Text);
  UserSession.IncludeEpsilonFromValue := iwcbFromEpsilon.Checked;
  UserSession.IncludeEpsilonToValue := iwcbToEpsilon.Checked;
  if UserSession.IncludeEpsilonFromValue then UserSession.EpsilonFromValue := Trim(iweFromEpsilon.Text);
  if UserSession.IncludeEpsilonToValue then UserSession.EpsilonToValue := Trim(iweToEpsilon.Text);
  UserSession.IncludeRecordIDValueRange := iwcbRecordIDrange.Checked;
  if UserSession.IncludeRecordIDValueRange then
  begin
    UserSession.RecordIDValueFrom := Trim(iweRecordIDFrom.Text);
    UserSession.RecordIDValueTo := Trim(iweRecordIDTo.Text);
  end;
  //ClearNull(UserSession.EpsilonFromValue);
  //ClearNull(UserSession.EpsilonToValue);
  UserSession.IncludeIsochronOnlyValue := iwcbMSWD.Checked;
  UserSession.DecayUncertaintyValues.Clear;
  if ((not iwcbDCWithout.Checked) and (not iwcbDCWith.Checked)) then
  begin
    iwcbDCWithout.Checked := true;
    iwcbDCWith.Checked := true;
    UserSession.DecayUncertaintyValues.Add('WithDCerrors');
    UserSession.DecayUncertaintyValues.Add('WithoutDCerrors');
  end else
  begin
    if iwcbDCWithout.Checked then UserSession.DecayUncertaintyValues.Add('WithoutDCerrors');
    if iwcbDCWith.Checked then UserSession.DecayUncertaintyValues.Add('WithDCerrors');
  end;
  dmDV.cdsAgeUnits.Open;
  if (UserSession.AgeUnitsValue='') then UserSession.AgeUnitsValue := dmDV.cdsAgeUnitsAGEUNITS.AsString;
  dmDV.cdsAgeUnits.Close;
  if ((UserSession.IncludeAgeUnitsValue) and (UserSession.AgeUnitsValue='')) then UserSession.IncludeAgeUnitsValue := false;
  if iwcbCoordinates.Checked then
  begin
    Val(iweNELat.Text,t1,iCode);
    if (iCode <> 0) then
    begin
      iwcbCoordinates.Checked := false;
    end else
    begin
      UserSession.NELat := FormatFloat('##0.00000',t1);
    end;
    Val(iweNELon.Text,t1,iCode);
    if (iCode <> 0) then
    begin
      iwcbCoordinates.Checked := false;
    end else
    begin
      UserSession.NELon := FormatFloat('##0.00000',t1);
    end;
    Val(iweSWLat.Text,t1,iCode);
    if (iCode <> 0) then
    begin
      iwcbCoordinates.Checked := false;
    end else
    begin
      UserSession.SWLat := FormatFloat('##0.00000',t1);
    end;
    Val(iweSWLon.Text,t1,iCode);
    if (iCode <> 0) then
    begin
      iwcbCoordinates.Checked := false;
    end else
    begin
      UserSession.SWLon := FormatFloat('##0.00000',t1);
    end;
  end;
  UserSession.IncludeCoordinates := iwcbCoordinates.Checked;
  if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
  if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count=0)) then UserSession.IncludeAreaValues := false;
  if ((UserSession.IncludeUnitValues) and (UserSession.UnitValues.Count=0)) then UserSession.IncludeUnitValues := false;
  if ((UserSession.IncludeLithologyValues) and (UserSession.LithologyValues.Count=0)) then UserSession.IncludeLithologyValues := false;
  if ((UserSession.IncludeIsotopeSystemValues) and (UserSession.IsotopeSystemValues.Count=0)) then UserSession.IncludeIsotopeSystemValues := false;
  if ((UserSession.IncludeMaterialValues) and (UserSession.MaterialValues.Count=0)) then UserSession.IncludeMaterialValues := false;
  if ((UserSession.IncludeApproachValues) and (UserSession.ApproachValues.Count=0)) then UserSession.IncludeApproachValues := false;
  if ((UserSession.IncludeTechniqueValues) and (UserSession.TechniqueValues.Count=0)) then UserSession.IncludeTechniqueValues := false;
  if ((UserSession.IncludeInterpretationValues) and (UserSession.InterpretationValues.Count=0)) then UserSession.IncludeInterpretationValues := false;
  if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count=0)) then UserSession.IncludeReferenceValues := false;
  if ((UserSession.IncludeProvinceValues) and (UserSession.ProvinceValues.Count=0)) then UserSession.IncludeProvinceValues := false;
  if ((UserSession.IncludeTerraneValues) and (UserSession.TerraneValues.Count=0)) then UserSession.IncludeTerraneValues := false;
  if ((UserSession.IncludeLIPValues) and (UserSession.LIPValues.Count=0)) then UserSession.IncludeLIPValues := false;
  if ((UserSession.IncludeOrogenicPeriodValues) and (UserSession.OrogenicPeriodValues.Count=0)) then UserSession.IncludeOrogenicPeriodValues := false;
  if ((UserSession.IncludeChemicalTypeValues) and (UserSession.ChemicalTypeValues.Count=0)) then UserSession.IncludeChemicalTypeValues := false;
  if ((UserSession.IncludeGroupValues) and (UserSession.GroupValues.Count=0)) then UserSession.IncludeGroupValues := false;
  if ((UserSession.IncludeBoundaryValues) and (UserSession.BoundaryValues.Count=0)) then UserSession.IncludeBoundaryValues := false;
  if ((UserSession.IncludeBoundaryPositionValues) and (UserSession.BoundaryPositionValues.Count=0)) then UserSession.IncludeBoundaryPositionValues := false;
  if ((UserSession.IncludeBoundaryPositionValues) and not (UserSession.IncludeBoundaryValues)) then UserSession.IncludeBoundaryPositionValues := false;
  if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
  if ((UserSession.IncludeWhoForValues) and (UserSession.WhoForValues.Count=0)) then UserSession.IncludeWhoForValues := false;
  if ((UserSession.IncludeUsersContributedValues) and (UserSession.UsersContributedValues.Count=0)) then UserSession.IncludeUsersContributedValues := false;
  if (UserSession.PreferenceLevelValue = '') then UserSession.PreferenceLevelValue := '1';
  if UserSession.IncludeDateFromValue then
  begin
    if (UserSession.DateFromField = '') then UserSession.IncludeDateFromValue := false;
  end;
  if UserSession.IncludeDateToValue then
  begin
    if (UserSession.DateToField = '') then UserSession.IncludeDateToValue := false;
  end;
  if UserSession.IncludeCoordinates then
  begin
    if (UserSession.NELat = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.NELon = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.SWLat = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.SWLon = '') then UserSession.IncludeCoordinates := false;
  end;
  if UserSession.IncludeRecordIDValueRange then
  begin
    if (UserSession.RecordIDValueFrom = '') then UserSession.IncludeRecordIDValueRange := false;
    if (UserSession.RecordIDValueTo = '') then UserSession.IncludeRecordIDValueRange := false;
  end;
  if Validate then
  begin
    dmDV.SubmitQuery1;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if UserSession.GoDirectTographs then TISFSelectGraph.Create(WebApplication).Show
                                    else TISFGrid.Create(WebApplication).Show;
  end;
end;

procedure TISFDefineQuery2.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineQuery2.Validate: Boolean;
const
  MaxQueryValuesAllowed : integer = 50;
//var
  //tmp : double;
  //iCode : integer;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwlblErrorEpsilonFrom.Visible := false;
  iwlblErrorEpsilonTo.Visible := false;
  if (not UserSession.IncludeUnitValues
    and not UserSession.IncludeLithologyValues
    and not UserSession.IncludeIgneous
    and not UserSession.IncludeSedimentary
    and not UserSession.IncludeMetamorphicAndOther
    and not UserSession.IncludeMaterialValues
    and not UserSession.IncludeMethodValues
    and not UserSession.IncludeIsotopeSystemValues
    and not UserSession.IncludeInterpretationValues
    and not UserSession.IncludeApproachValues
    and not UserSession.IncludeTechniqueValues
    and not UserSession.IncludeGroupValues
    and not UserSession.IncludeProvinceValues
    and not UserSession.IncludeTerraneValues
    and not UserSession.IncludeLIPValues
    and not UserSession.IncludeOrogenicPeriodValues
    and not UserSession.IncludeReferenceValues
    and not UserSession.IncludeChemicalTypeValues
    and not UserSession.IncludeBoundaryPositionValues
    and not UserSession.IncludeBoundaryValues
    and not UserSession.IncludeValidationValues
    and not UserSession.IncludeWhoForValues
    and not UserSession.IncludeUsersContributedValues
    and not UserSession.IncludeAgeUnitsValue
    and not UserSession.IncludeDateFromValue
    and not UserSession.IncludeEpsilonFromValue
    and not UserSession.IncludeEpsilonToValue
    and not UserSession.IncludeRecordIDValueRange
    and not UserSession.IncludeCoordinates
    and not UserSession.IncludeUserOrgID
    and not UserSession.IncludeDateToValue) then
  begin
      Result := false;
      iwlblErrorTop.Text := 'No items selected or boxes not checked';
      iwlblErrorBottom.Text := 'No items selected or boxes not checked';
  end;
  {
  if (UserSession.IncludeEpsilonFromValue) then
  begin
    Val(UserSession.EpsilonFromValue,tmp,iCode);
    if (iCode <> 0) then
    begin
      Result := false;
      iwlblErrorEpsilonFrom.Visible := true;
      iwlblErrorTop.Text := 'Error in value submitted';
      iwlblErrorBottom.Text := 'Error in value submitted';
    end;
  end;
  }
  {
  if (UserSession.IncludeEpsilonToValue) then
  begin
    //Val(UserSession.EpsilonToValue,tmp,iCode);
    if (iCode <> 0) then
    begin
      Result := false;
      iwlblErrorEpsilonTo.Visible := true;
      iwlblErrorTop.Text := 'Error in value submitted';
      iwlblErrorBottom.Text := 'Error in value submitted';
    end;
  end;
  }
  if (Result = true) then
  begin
    if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeUnitValues) and (UserSession.UnitValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeLithologyValues) and (UserSession.LithologyValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeProvinceValues) and (UserSession.ProvinceValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeTerraneValues) and (UserSession.TerraneValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeLIPValues) and (UserSession.LIPValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeIsotopeSystemValues) and (UserSession.IsotopeSystemValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeMaterialValues) and (UserSession.MaterialValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeApproachValues) and (UserSession.ApproachValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeTechniqueValues) and (UserSession.TechniqueValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeInterpretationValues) and (UserSession.InterpretationValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeOrogenicPeriodValues) and (UserSession.OrogenicPeriodValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeChemicalTypeValues) and (UserSession.ChemicalTypeValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeGroupValues) and (UserSession.GroupValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeBoundaryValues) and (UserSession.BoundaryValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeBoundaryPositionValues) and (UserSession.BoundaryPositionValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeBoundaryPositionValues) and not (UserSession.IncludeBoundaryValues)) then Result := false;
    if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeWhoForValues) and (UserSession.WhoForValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if ((UserSession.IncludeUsersContributedValues) and (UserSession.UsersContributedValues.Count > MaxQueryValuesAllowed)) then Result := false;
    if (Result = false) then
    begin
      iwlblErrorTop.Text := 'Too many values selected for one of the query fields';
      iwlblErrorBottom.Text := 'Too many values selected for one of the query fields';
    end;
  end;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      iwlblErrorBottom.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineQuery2.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbUnits.Checked := false;
  iwcbLithologies.Checked := false;
  iwcbIncludeIgneous.Checked := false;
  iwcbIncludeSedimentary.Checked := false;
  iwcbIncludeMetamorphicAndOther.Checked := false;
  iwcbMethods.Checked := false;
  iwcbMaterial.Checked := false;
  iwcbIsotopeSystems.Checked := false;
  iwcbApproaches.Checked := false;
  iwcbTechniques.Checked := false;
  iwcbInterpretations.Checked := false;
  iwcbFromDate.Checked := false;
  iwcbToDate.Checked := false;
  iwcbFromEpsilon.Checked := false;
  iwcbToEpsilon.Checked := false;
  //iwcbIncludeAgeUnits.Checked := false;
  iwcbMSWD.Checked := false;
  iwcbReferences.Checked := false;
  iwcbProvinces.Checked := false;
  iwcbTerranes.Checked := false;
  iwcbLIPS.Checked := false;
  iwcbOrogenicPeriods.Checked := false;
  iwcbChemTypes.Checked := false;
  iwcbGroupingList.Checked := false;
  iwcbBoundaries.Checked := false;
  iwcbBoundaryPos.Checked := false;
  iwcbValidation.Checked := false;
  iwcbWhoFor.Checked := false;
  iwcbIncludeUserOrgID.Checked := false;
  iwcbUsersContributed.Checked := false;
  iwcbCoordinates.Checked := false;
  iwcbRecordIDrange.Checked := false;
end;

procedure TISFDefineQuery2.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
