unit DVIW_definerawdatasamplequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion,
  DVIW_IdentifyPeaks,
  DVIW_AgeHf,
  IWCompMemo;

type
  TISFDefineRawDataSampleQuery = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwrLeftBar: TIWRegion;
    iwrRightChannel: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwbSubmit: TIWButton;
    iwbCancel: TIWButton;
    iwrBottomButtons: TIWRegion;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    iwrDateRange: TIWRegion;
    iwcbFromDate: TIWCheckBox;
    iweFromDate: TIWEdit;
    iwcbToDate: TIWCheckBox;
    iweToDate: TIWEdit;
    iwrCoordinates: TIWRegion;
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
    iwrReferenceRange: TIWRegion;
    IWLabel5: TIWLabel;
    iweReferenceFrom: TIWEdit;
    IWLabel6: TIWLabel;
    iweReferenceTo: TIWEdit;
    lblFromErrorRefs: TIWLabel;
    lblToErrorRefs: TIWLabel;
    iwrReferences: TIWRegion;
    iwlReferences: TIWListbox;
    iwcbReferences: TIWCheckBox;
    iwbRefreshReferences: TIWButton;
    IWLabel1: TIWLabel;
    iwrSampleInfo: TIWRegion;
    iwrSampleRange: TIWRegion;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweSampleTo: TIWEdit;
    iweSampleFrom: TIWEdit;
    lblFromErrorSamples: TIWLabel;
    lblToErrorSamples: TIWLabel;
    iwbSamplesWithDataRefresh: TIWButton;
    iwrSampleList: TIWRegion;
    iwcbSamples: TIWCheckBox;
    iwlSamples: TIWListbox;
    iwmChooseSamplesExplanation: TIWMemo;
    lblNoSamplesSelected: TIWLabel;
    iwmQueryType: TIWMemo;
    iwrDomainInfo: TIWRegion;
    iwrDomainRange: TIWRegion;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    iweDomainTo: TIWEdit;
    iweDomainFrom: TIWEdit;
    lblFromErrorDomains: TIWLabel;
    lblToErrorDomains: TIWLabel;
    iwbDomainsRefresh: TIWButton;
    iwrDomains: TIWRegion;
    iwcbDomains: TIWCheckBox;
    iwlDomains: TIWListbox;
    iwmChooseDomainsExplanation: TIWMemo;
    lblNoDomainsSelected: TIWLabel;
    IWRegion1: TIWRegion;
    iwcbSampleZones: TIWCheckBox;
    iwlSampleZones: TIWListbox;
    lblNoGrainZones: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure ClearErrorMessages;
    procedure iwbCancelClick(Sender: TObject);
    procedure iwbSamplesWithDataRefreshClick(Sender: TObject);
    procedure iwrSampleRangeCreate(Sender: TObject);
    procedure iwbRefreshReferencesClick(Sender: TObject);
    procedure iwbDomainsRefreshClick(Sender: TObject);
  public
    procedure ConstructRawSampleListQuery;
    procedure RefreshSelection;
  protected
    function Validate : Boolean ;
  end;

implementation

uses DVIW_dmData, ServerController, DVIW_constants, DB_List_Combo,
  DVIW_uMain, usrIW_dm, DVIW_dm, DVIW_AgeChem;

{$R *.dfm}


procedure TISFDefineRawDataSampleQuery.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //iwrDomainInfo.Visible := false;
  //iwrDomainRange.Visible := false;
  //iwrDomains.Visible := false;
  if (UserSession.IncludeProvinceValues or UserSession.IncludeTerraneValues) then
  begin
    iwrDomainInfo.Visible := true;
    iwrDomainRange.Visible := true;
    iwrDomains.Visible := true;
    iwcbDomains.Checked := true;
  end else
  begin
    iwrDomainInfo.Visible := false;
    iwrDomainRange.Visible := false;
    iwrDomains.Visible := false;
    iwcbDomains.Checked := false;
  end;
  iwcbFromDate.Checked := UserSession.IncludeDateFromValue;
  iwcbToDate.Checked := UserSession.IncludeDateToValue;
  if UserSession.IncludeDateFromValue then iweFromDate.Text := UserSession.DateFromField;
  if UserSession.IncludeDateToValue then iweToDate.Text := UserSession.DateToField;
  //Samples
  lblFromErrorSamples.Visible := false;
  lblToErrorSamples.Visible := false;
  lblNoSamplesSelected.Visible := false;
  if (Trim(UserSession.SampleStartFrom) = '') then UserSession.SampleStartFrom := '0';
  if (Trim(UserSession.SampleEndWith) = '') then UserSession.SampleEndWith := 'zz';
  iwcbSamples.Checked := UserSession.IncludeSampleValues;
  iweSampleFrom.Text := UserSession.SampleStartFrom;
  iweSampleTo.Text := UserSession.SampleEndWith;
  //References
  iwcbReferences.Checked := UserSession.IncludeReferenceValues;
  lblFromErrorRefs.Visible := false;
  lblToErrorRefs.Visible := false;
  iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
  iweReferenceTo.Text := UserSession.ReferenceEndWith;
  if (Trim(UserSession.ReferenceStartFrom) = '') then UserSession.ReferenceStartFrom := '0';
  if (Trim(UserSession.ReferenceEndWith) = '') then UserSession.ReferenceEndWith := 'zz';
  iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
  iweReferenceTo.Text := UserSession.ReferenceEndWith;
  dmDV.ConstructReferenceQuery;
  dmDV.qReferences.Close;
  dmDV.qReferences.ParamByName('FIRSTREFERENCE').AsString := UserSession.ReferenceStartFrom;
  dmDV.qReferences.ParamByName('LASTREFERENCE').AsString := UserSession.ReferenceEndWith;
  UpdateListBoxValues(iwlReferences,dmDV.cdsReferences,'SourceShort','SourceNum',UserSession.ReferenceValues);
  //Domains
  lblFromErrorDomains.Visible := false;
  lblToErrorDomains.Visible := false;
  lblNoDomainsSelected.Visible := false;
  if (Trim(UserSession.TerraneStartFrom) = '') then UserSession.TerraneStartFrom := '0';
  if (Trim(UserSession.TerraneEndWith) = '') then UserSession.TerraneEndWith := 'zz';
  iwcbDomains.Checked := UserSession.IncludeProvinceValues or UserSession.IncludeTerraneValues;
  iweDomainFrom.Text := UserSession.TerraneStartFrom;
  iweDomainTo.Text := UserSession.TerraneEndWith;
  UserSession.IncludeTerraneValues := iwcbDomains.Checked;
  if (UserSession.IncludeTerraneValues) then
  begin
    dmDV.ConstructDomainQuery;
    dmDV.qDomains.Close;
    dmDV.qDomains.ParamByName('FIRSTDOMAIN').AsString := UserSession.TerraneStartFrom;
    dmDV.qDomains.ParamByName('LASTDOMAIN').AsString := UserSession.TerraneEndWith;
    UpdateListBoxValues(iwlDomains,dmDV.cdsDomains,'DomainName','DomainID',UserSession.TerraneValues);
  end;
  //Sample or grain zones
  lblNoGrainZones.Visible := false;
  iwcbSampleZones.Checked := UserSession.IncludeSampleZoneValues;
  UpdateListBoxValues(iwlSampleZones,dmDV.cdsSampleZones,'ZoneType','ZoneID',UserSession.SampleZoneValues);
  //Sample list
  ConstructRawSampleListQuery;
  RefreshSelection;
end;

procedure TISFDefineRawDataSampleQuery.ConstructRawSampleListQuery;
var
  i : integer;
  tempStr : string;
begin
  //dmUser.SetDeveloperData('TISFDefineRawDataSampleQuery.ConstructRawSampleListQuery');
  if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count < 1)) then UserSession.IncludeReferenceValues := false;
  if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count < 1)) then UserSession.IncludeContinentValues := false;
  if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count < 1)) then UserSession.IncludeAreaValues := false;
  if ((UserSession.IncludeProvinceValues) and (UserSession.ProvinceValues.Count < 1)) then UserSession.IncludeProvinceValues := false;
  if ((UserSession.IncludeTerraneValues) and (UserSession.TerraneValues.Count < 1)) then UserSession.IncludeTerraneValues := false;
  if (UserSession.IncludeTerraneValues and UserSession.IncludeProvinceValues) then UserSession.IncludeProvinceValues := false;
  dmdDV.qSamplesWithData.Close;
  dmdDV.qSamplesWithData.SQL.Clear;
  dmdDV.qSamplesWithData.SQL.Add('SELECT DISTINCT SMPDATA.SAMPLENO');
  dmdDV.qSamplesWithData.SQL.Add('FROM SMPDATA, SMPLOC');
  if ((UserSession.IncludeTerraneValues) or (UserSession.IncludeProvinceValues)) then
  begin
    dmdDV.qSamplesWithData.SQL.Add(',SMPREG,ISOPROVTERR');
  end;
  dmdDV.qSamplesWithData.SQL.Add('WHERE (SMPDATA.ISOSYSTEM=:IsotopeSystem OR SMPDATA.ISOSYSTEM = '+''''+'na'+''''+')');
  dmdDV.qSamplesWithData.SQL.Add('AND SMPDATA.VARIABLEID=:VariableID');
  dmdDV.qSamplesWithData.SQL.Add('AND SMPDATA.SAMPLENO=SMPLOC.SAMPLENO');
  dmdDV.qSamplesWithData.SQL.Add('AND SMPLOC.SAMPLENO >= :SampleStartFrom');
  dmdDV.qSamplesWithData.SQL.Add('AND SMPLOC.SAMPLENO <= :SampleEndWith');
  if ((UserSession.IncludeTerraneValues) or (UserSession.IncludeProvinceValues)) then
  begin
    dmdDV.qSamplesWithData.SQL.Add('and smpreg.sampleno=smploc.sampleno');
    dmdDV.qSamplesWithData.SQL.Add('and smpreg.recordid=isoprovterr.recordid');
    dmdDV.qSamplesWithData.SQL.Add('and smpreg.recordid=isoprovterr.recordid');
    if (UserSession.IncludeTerraneValues) then
      dmdDV.qSamplesWithData.SQL.Add('AND ( ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues.Strings[0]+'''');
    if (UserSession.IncludeProvinceValues) then
      dmdDV.qSamplesWithData.SQL.Add('AND ( ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues.Strings[0]+'''');
    if (UserSession.IncludeTechniqueValues and (UserSession.TerraneValues.Count >1)) then
    begin
      for i := 2 to UserSession.TerraneValues.Count do
      begin
        dmdDV.qSamplesWithData.SQL.Add('OR ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues.Strings[i-1]+'''');
      end;
    end;
    if (UserSession.IncludeProvinceValues and (UserSession.ProvinceValues.Count >1)) then
    begin
      for i := 2 to UserSession.ProvinceValues.Count do
      begin
        dmdDV.qSamplesWithData.SQL.Add('OR ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues.Strings[i-1]+'''');
      end;
    end;
    dmdDV.qSamplesWithData.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeReferenceValues) then
  begin
    dmdDV.qSamplesWithData.SQL.Add('AND ( SMPDATA.REFNUM = '+''''+UserSession.ReferenceValues.Strings[0]+'''');
    if (UserSession.ReferenceValues.Count >1) then
    begin
      for i := 2 to UserSession.ReferenceValues.Count do
      begin
        dmdDV.qSamplesWithData.SQL.Add('OR SMPDATA.REFNUM = '+''''+UserSession.ReferenceValues.Strings[i-1]+'''');
      end;
    end;
    dmdDV.qSamplesWithData.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmdDV.qSamplesWithData.SQL.Add('AND ( SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmdDV.qSamplesWithData.SQL.Add('OR SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmdDV.qSamplesWithData.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmdDV.qSamplesWithData.SQL.Add('AND ( SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmdDV.qSamplesWithData.SQL.Add('OR SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmdDV.qSamplesWithData.SQL.Add(' ) ');
  end;
  if UserSession.IncludeCoordinates then
  begin
    //tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
    //dmdDV.qSamplesWithData.SQL.Add(tempStr);
    tempStr := 'AND SMPLOC.LATITUDE <= '+UserSession.NELat;
    dmdDV.qSamplesWithData.SQL.Add(tempStr);
    tempStr := 'AND SMPLOC.LONGITUDE <= '+UserSession.NELon;
    dmdDV.qSamplesWithData.SQL.Add(tempStr);
    tempStr := 'AND SMPLOC.LATITUDE >= '+UserSession.SWLat;
    dmdDV.qSamplesWithData.SQL.Add(tempStr);
    tempStr := 'AND SMPLOC.LONGITUDE >= '+UserSession.SWLon;
    dmdDV.qSamplesWithData.SQL.Add(tempStr);
  end;
  dmdDV.qSamplesWithData.SQL.Add('ORDER BY SMPDATA.SAMPLENO');
  //dmUser.SetDeveloperData('qSamplesWithData construct');
  //dmUser.SetDeveloperData(dmdDV.qSamplesWithData.SQL.Text);
end;

procedure TISFDefineRawDataSampleQuery.RefreshSelection;
var
  t1 : double;
  iCode : integer;
begin
  Usersession.SampleStartFrom := Trim(iweSampleFrom.Text);
  Usersession.SampleEndWith := Trim(iweSampleTo.Text);
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  if (UserSession.IncludeReferenceValues) then
  begin
    Usersession.ReferenceStartFrom := Trim(iweReferenceFrom.Text);
    Usersession.ReferenceEndWith := Trim(iweReferenceTo.Text);
    //dmUser.SetDeveloperData('Reference range = '+Usersession.ReferenceStartFrom+' to '+Usersession.ReferenceEndWith);
    GetListBoxValues(iwlReferences,dmDV.cdsReferences,'SourceShort','SourceNum',UserSession.ReferenceValues);
  end;
  UserSession.IncludeTerraneValues := iwcbDomains.Checked;
  if (UserSession.IncludeTerraneValues) then
  begin
    Usersession.TerraneStartFrom := Trim(iweDomainFrom.Text);
    Usersession.TerraneEndWith := Trim(iweDomainTo.Text);
    GetListBoxValues(iwlDomains,dmDV.cdsDomains,'DomainName','DomainID',UserSession.TerraneValues);
  end;
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
  if UserSession.IncludeCoordinates then
  begin
    if (UserSession.NELat = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.NELon = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.SWLat = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.SWLon = '') then UserSession.IncludeCoordinates := false;
  end;
  ConstructRawSampleListQuery;
  if ((UserSession.UnitSender = usIdentifyPeaks)
    or (UserSession.UnitSender = usShowDetrital)) then
  begin
    dmdDV.qSamplesWithData.ParamByName('IsotopeSystem').AsString := 'UPb';
    dmdDV.qSamplesWithData.ParamByName('VariableID').AsString := 'Age_preferred';
  end;
  if ((UserSession.UnitSender = usIndividualAgeHf)
    or (UserSession.UnitSender = usMultipleAgeHf)) then
  begin
    dmdDV.qSamplesWithData.ParamByName('IsotopeSystem').AsString := 'LuHf';
    dmdDV.qSamplesWithData.ParamByName('VariableID').AsString := '176Hf177Hf';
  end;
  if ((UserSession.UnitSender = usIndividualAgeChem)
    or (UserSession.UnitSender = usMultipleAgeChem)) then
  begin
    dmdDV.qSamplesWithData.ParamByName('IsotopeSystem').AsString := 'UPb';
    dmdDV.qSamplesWithData.ParamByName('VariableID').AsString := 'ThU';
  end;
  //dmdDV.qSamplesWithData.ParamByName('CountryID').AsString := UserSession.AreaValues[0];
  dmdDV.qSamplesWithData.ParamByName('SampleStartFrom').AsString := UserSession.SampleStartFrom;
  dmdDV.qSamplesWithData.ParamByName('SampleEndWith').AsString := UserSession.SampleEndWith;
  //dmUser.SetDeveloperData(dmdDV.qSamplesWithData.SQL.Text);
  //UpdateComboBoxValue(iwcbSample,dmdDV.cdsSamplesWithData,'SampleNo','SampleNo',UserSession.Parameter2Chosen);
  UpdateListBoxValues(iwlSamples,dmdDV.cdsSamplesWithData,'SampleNo','SampleNo',UserSession.SampleValues);
end;


procedure TISFDefineRawDataSampleQuery.iwbSamplesWithDataRefreshClick(
  Sender: TObject);
begin
  UserSession.IncludeTerraneValues := iwcbDomains.Checked;
  if (UserSession.IncludeProvinceValues or UserSession.IncludeTerraneValues) then
  begin
    Usersession.TerraneStartFrom := Trim(iweDomainFrom.Text);
    Usersession.TerraneEndWith := Trim(iweDomainTo.Text);
    dmDV.cdsDomains.Close;
    dmDV.qDomains.Close;
    dmDV.qDomains.ParamByName('FIRSTDOMAIN').AsString := UserSession.TerraneStartFrom;
    dmDV.qDomains.ParamByName('LASTDOMAIN').AsString := UserSession.TerraneEndWith;
    GetListBoxValues(iwlDomains,dmDV.cdsDomains,'DomainName','DomainID',UserSession.TerraneValues);
  end;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  if UserSession.IncludeReferenceValues then
  begin
    Usersession.ReferenceStartFrom := Trim(iweReferenceFrom.Text);
    Usersession.ReferenceEndWith := Trim(iweReferenceTo.Text);
    dmDV.cdsReferences.Close;
    dmDV.qReferences.Close;
    dmDV.qReferences.ParamByName('FIRSTREFERENCE').AsString := UserSession.ReferenceStartFrom;
    dmDV.qReferences.ParamByName('LASTREFERENCE').AsString := UserSession.ReferenceEndWith;
    GetListBoxValues(iwlReferences,dmDV.cdsReferences,'SourceShort','SourceNum',UserSession.ReferenceValues);
  end;
  RefreshSelection;
end;

procedure TISFDefineRawDataSampleQuery.iwbSubmitClick(Sender: TObject);
var
  t1 : double;
  iCode : integer;
begin
  //dmUser.SetDeveloperData('ISFDefineRawDataSampleQuery.iwbSubmitClick');
  UserSession.IncludeSampleValues := iwcbSamples.Checked;
  UserSession.SampleStartFrom := Trim(iweSampleFrom.Text);
  UserSession.SampleEndWith := Trim(iweSampleTo.Text);
  UserSession.IncludeTerraneValues := iwcbDomains.Checked;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  UserSession.IncludeDateFromValue := iwcbFromDate.Checked;
  UserSession.IncludeDateToValue := iwcbToDate.Checked;
  UserSession.IncludeSampleZoneValues := iwcbSampleZones.Checked;
  UserSession.IncludeCoordinates := iwcbCoordinates.Checked;
  //if (UserSession.IncludeSampleZoneValues) then dmUser.SetDeveloperData('IncludeSampleZoneValues is true');
  //if (not UserSession.IncludeSampleZoneValues) then dmUser.SetDeveloperData('IncludeSampleZoneValues is false');
  if (UserSession.IncludeTerraneValues) then
  begin
    UserSession.TerraneStartFrom := Trim(iweDomainFrom.Text);
    UserSession.TerraneEndWith := Trim(iweDomainTo.Text);
    GetListBoxValues(iwlDomains,dmDV.cdsDomains,'DomainName','DomainID',UserSession.TerraneValues);
  end;
  if (UserSession.IncludeReferenceValues) then
  begin
    UserSession.ReferenceStartFrom := Trim(iweReferenceFrom.Text);
    UserSession.ReferenceEndWith := Trim(iweReferenceTo.Text);
    GetListBoxValues(iwlReferences,dmDV.cdsReferences,'SourceShort','SourceNum',UserSession.ReferenceValues);
  end;
  if (UserSession.IncludeDateFromValue) then
    UserSession.DateFromField := Trim(iweFromDate.Text);
  if (UserSession.IncludeDateToValue) then
    UserSession.DateToField := Trim(iweToDate.Text);
  //GetComboBoxValue(iwcbSample,dmdDV.cdsSamplesWithData,'SampleNo','SampleNo',UserSession.Parameter2Chosen);
  GetListBoxValues(iwlSamples,dmdDV.cdsSamplesWithData,'SampleNo','SampleNo',UserSession.SampleValues);
  if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count < 1))
    then UserSession.IncludeReferenceValues := false;
  if ((UserSession.IncludeTerraneValues) and (UserSession.TerraneValues.Count < 1))
    then UserSession.IncludeTerraneValues := false;
  if ((UserSession.IncludeSampleValues) and (UserSession.SampleValues.Count < 1))
    then UserSession.IncludeSampleValues := false;
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
  if UserSession.IncludeCoordinates then
  begin
    if (UserSession.NELat = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.NELon = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.SWLat = '') then UserSession.IncludeCoordinates := false;
    if (UserSession.SWLon = '') then UserSession.IncludeCoordinates := false;
  end;
  dmDV.cdsSampleZones.Close;
  dmDV.cdsSampleZones.Open;
  dmDV.cdsSampleZones.Close;
  GetListBoxValues(iwlSampleZones,dmDV.cdsSampleZones,'ZoneType','ZoneID',UserSession.SampleZoneValues);
  //dmUser.SetDeveloperData('Count of SampleZoneValues is '+IntToStr(UserSession.SampleZoneValues.Count));
  if ((UserSession.IncludeSampleZoneValues) and (UserSession.SampleZoneValues.Count < 1))
    then UserSession.IncludeSampleZoneValues := false;
  if Validate then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ((UserSession.UnitSender = usIdentifyPeaks)
      or (UserSession.UnitSender = usShowDetrital)) then
    begin
      TISFIdentifyPeaks.Create(WebApplication).Show;
    end;
    if ((UserSession.UnitSender = usIndividualAgeHf)
      or (UserSession.UnitSender = usMultipleAgeHf)) then
    begin
      TISFAgeHf.Create(WebApplication).Show;
    end;
    if ((UserSession.UnitSender = usIndividualAgeChem)
      or (UserSession.UnitSender = usMultipleAgeChem)) then
    begin
      TISFAgeChem.Create(WebApplication).Show;
    end;
  end;
end;

procedure TISFDefineRawDataSampleQuery.iwrSampleRangeCreate(Sender: TObject);
begin
  iwmQueryType.Lines.Clear;
  if (UserSession.UnitSender = usIdentifyPeaks) then
  begin
    iwmQueryType.Lines.Add('Option selected requires no more than one sample to be selected. If more are selected, only the first one will be used');
  end;
  if (UserSession.UnitSender = usIndividualAgeHf) then
  begin
    iwmQueryType.Lines.Add('Option selected requires no more than one sample to be selected. If more are selected, only the first one will be used');
  end;
  if (UserSession.UnitSender = usIndividualAgeChem) then
  begin
    iwmQueryType.Lines.Add('Option selected requires no more than one sample to be selected. If more are selected, only the first one will be used');
  end;
  if (UserSession.UnitSender = usShowDetrital) then
  begin
    iwmQueryType.Lines.Add('Option selected allows multiple samples to be selected');
  end;
  if (UserSession.UnitSender = usMultipleAgeHf) then
  begin
    iwmQueryType.Lines.Add('Option selected allows multiple samples to be selected');
  end;
  if (UserSession.UnitSender = usMultipleAgeChem) then
  begin
    iwmQueryType.Lines.Add('Option selected allows multiple samples to be selected');
  end;
end;

procedure TISFDefineRawDataSampleQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineRawDataSampleQuery.Validate: Boolean;
var
  tmp : double;
  iCode : integer;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iweSampleFrom.Text) = '') then
  begin
    lblFromErrorSamples.Caption := '''Samples ranging from'' requires a value.';
    Result := false;
    lblFromErrorSamples.Visible := true;
  end;
  if (Trim(iweSampleTo.Text) = '') then
  begin
    lblToErrorSamples.Caption := '''Samples ranging to'' requires a value.';
    Result := false;
    lblToErrorSamples.Visible := true;
  end;
  if (Trim(iweReferenceFrom.Text) = '') then
  begin
    lblFromErrorRefs.Caption := '''References ranging from'' requires a value.';
    Result := false;
    lblFromErrorRefs.Visible := true;
  end;
  if (Trim(iweReferenceTo.Text) = '') then
  begin
    lblToErrorRefs.Caption := '''References ranging to'' requires a value.';
    Result := false;
    lblToErrorRefs.Visible := true;
  end;
  if (UserSession.IncludeTerraneValues) then
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
  if ((UserSession.IncludeSampleZoneValues) and (UserSession.SampleZoneValues.Count < 1)) then
  begin
    lblNoGrainZones.Caption := 'No sample/grain zones selected.';
    lblNoGrainZones.Visible := true;
  end;
  if (UserSession.SampleValues.Count < 1) then
  begin
    lblNoSamplesSelected.Caption := 'No samples selected.';
    if ((UserSession.IncludeSampleValues) and (UserSession.UnitSender=usIdentifyPeaks)) then
    begin
      Result := false;
      lblNoSamplesSelected.Visible := true;
    end;
  end;
  if ((UserSession.UnitSender = usIdentifyPeaks) or (UserSession.UnitSender = usIndividualAgeHf)) then
  begin
    if not UserSession.IncludeSampleValues then
    begin
      lblNoSamplesSelected.Caption := 'No samples selected.';
      Result := false;
      lblNoSamplesSelected.Visible := true;
    end;
  end;
  if (not UserSession.IncludeSampleValues
    and (Trim(iweSampleFrom.Text) = '')
    and (Trim(iweSampleTo.Text) = '')
    and not UserSession.IncludeCoordinates) then
  begin
      Result := false;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFDefineRawDataSampleQuery.ClearErrorMessages;
begin
  lblFromErrorSamples.Caption := '';
  lblToErrorSamples.Caption := '';
  lblFromErrorRefs.Caption := '';
  lblToErrorRefs.Caption := '';
  lblNoSamplesSelected.Caption := '';
end;

procedure TISFDefineRawDataSampleQuery.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFDefineRawDataSampleQuery.iwbDomainsRefreshClick(Sender: TObject);
begin
  //UserSession.IncludeTerraneValues := false;
  UserSession.IncludeTerraneValues := iwcbDomains.Checked;
  Usersession.TerraneStartFrom := Trim(iweDomainFrom.Text);
  Usersession.TerraneEndWith := Trim(iweDomainTo.Text);
  if (UserSession.IncludeTerraneValues) then
  begin
    dmDV.cdsDomains.Close;
    dmDV.qDomains.Close;
    dmDV.qDomains.ParamByName('FIRSTDOMAIN').AsString := UserSession.TerraneStartFrom;
    dmDV.qDomains.ParamByName('LASTDOMAIN').AsString := UserSession.TerraneEndWith;
  end;
  UpdateListBoxValues(iwlDomains,dmDV.cdsDomains,'DomainName','DomainID',UserSession.TerraneValues);
end;

procedure TISFDefineRawDataSampleQuery.iwbRefreshReferencesClick(
  Sender: TObject);
begin
  UserSession.IncludeReferenceValues := false;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  Usersession.ReferenceStartFrom := Trim(iweReferenceFrom.Text);
  Usersession.ReferenceEndWith := Trim(iweReferenceTo.Text);
  dmDV.cdsReferences.Close;
  dmDV.qReferences.Close;
  dmDV.qReferences.ParamByName('FIRSTREFERENCE').AsString := UserSession.ReferenceStartFrom;
  dmDV.qReferences.ParamByName('LASTREFERENCE').AsString := UserSession.ReferenceEndWith;
  UpdateListBoxValues(iwlReferences,dmDV.cdsReferences,'SourceShort','SourceNum',UserSession.ReferenceValues);
end;

end.
