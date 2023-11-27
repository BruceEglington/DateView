unit DVIW_IdentifyPeaks;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, DVIW_frTopBar, DB, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  midaslib,
  DVIW_framemenu, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, VCLTee.TeEngine, ExtCtrls, VCLTee.TeeProcs, Chart, IWCompExtCtrls,
  IWCompTeeChart, IWCompEdit, Series, VCLTee.TeeErrorPoint, IWCompCheckbox, IWCompText,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  VclTee.TeeGDIPlus, IWCompListbox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFIdentifyPeaks = class(TIWAppForm)
    iwrPage: TIWRegion;
    iwrButtonsTop: TIWRegion;
    iwrSampleDetails: TIWRegion;
    IWLabel2: TIWLabel;
    iwlSampleNo: TIWLabel;
    iwrLeft: TIWRegion;
    iwrConcordiaPlots: TIWRegion;
    iwrWetherill: TIWRegion;
    iwrTeraWasserburg: TIWRegion;
    iwChartWetherill: TIWChart;
    iwIWChartTeraWasserburg: TIWChart;
    iwrConcordiaSplit: TIWRegion;
    ChartWetherill: TChart;
    iwrButtonsMiddle: TIWRegion;
    iwrPDF: TIWRegion;
    iwrPDFLeft: TIWRegion;
    iwrPDFRight: TIWRegion;
    iwrPDFGraph: TIWRegion;
    IWChart1: TIWChart;
    ChartPDF: TChart;
    iwrProbabilityOptions: TIWRegion;
    iwrPeaksIdentifiedList: TIWRegion;
    IWRegion8: TIWRegion;
    IWRegion10: TIWRegion;
    IWRegion11: TIWRegion;
    IWRegion12: TIWRegion;
    iwDBgPeaks: TIWDBGrid;
    IWDBNavigator1: TIWDBNavigator;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    iweConcordanceFrom: TIWEdit;
    iweConcordanceTo: TIWEdit;
    iweMinimumUncertainty: TIWEdit;
    iweAgeTo: TIWEdit;
    IWLabel6: TIWLabel;
    iweAgeFrom: TIWEdit;
    iwbRefresh: TIWButton;
    iwrDataList: TIWRegion;
    iwrDataListLeft: TIWRegion;
    iwrDataListRight: TIWRegion;
    iwrDataListTop: TIWRegion;
    iwDBnData: TIWDBNavigator;
    iwrDataListBottom: TIWRegion;
    iwrDataListGrid: TIWRegion;
    iwDBgData: TIWDBGrid;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    iwbIdentifyPeaks: TIWButton;
    Series1: TLineSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Series4: TPointSeries;
    ChartTeraWasserburg: TChart;
    Series5: TLineSeries;
    Series6: TLineSeries;
    iwrgAndOr: TIWRadioGroup;
    IWLabel10: TIWLabel;
    iwbReturnToSampleList: TIWButton;
    iwbReturn: TIWButton;
    Series7: TLineSeries;
    Series8: TPointSeries;
    Series9: TPointSeries;
    Series10: TPointSeries;
    iwbCalculatePDF: TIWButton;
    iwrGraphOptions: TIWRegion;
    IWLabel1: TIWLabel;
    iweGraphAgeFrom: TIWEdit;
    IWLabel11: TIWLabel;
    iweGraphAgeTo: TIWEdit;
    iwbReplotConcordia: TIWButton;
    iwrProbabilityCurves: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    IWRegion4: TIWRegion;
    IWDBNavigator2: TIWDBNavigator;
    IWLabel12: TIWLabel;
    IWRegion5: TIWRegion;
    IWRegion6: TIWRegion;
    iwDBgPDFs: TIWDBGrid;
    iwbDownload: TIWButton;
    iwbTransferToPeak: TIWButton;
    iwrCreateNewSummaryRecords: TIWRegion;
    iwrButtonsBottom: TIWRegion;
    iwbCreateNewRecords: TIWButton;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    Series11: TPointSeries;
    iwlSource: TIWLabel;
    iwlSourceShort: TIWLabel;
    iwcbExcludeDataWithoutAnalyses: TIWCheckBox;
    IWLabel14: TIWLabel;
    iweUnitFrom: TIWEdit;
    IWLabel15: TIWLabel;
    iweUnitTo: TIWEdit;
    IWLabel16: TIWLabel;
    IWLabel18: TIWLabel;
    IWLabel19: TIWLabel;
    iweTerraneFrom: TIWEdit;
    iweProvinceFrom: TIWEdit;
    iweReferenceFrom: TIWEdit;
    IWLabel20: TIWLabel;
    IWLabel21: TIWLabel;
    IWLabel22: TIWLabel;
    iweTerraneTo: TIWEdit;
    iweProvinceTo: TIWEdit;
    iweReferenceTo: TIWEdit;
    IWText2: TIWText;
    IWLabel13: TIWLabel;
    IWLabel17: TIWLabel;
    IWLabel23: TIWLabel;
    IWLabel24: TIWLabel;
    iwlCount: TIWLabel;
    iweLongitude: TIWEdit;
    iweLatitude: TIWEdit;
    iweElevation: TIWEdit;
    iwe75Min: TIWEdit;
    IWLabel25: TIWLabel;
    iwe75Max: TIWEdit;
    iwe68Min: TIWEdit;
    IWLabel26: TIWLabel;
    iwe68Max: TIWEdit;
    iwe86Min: TIWEdit;
    IWLabel27: TIWLabel;
    iwe86Max: TIWEdit;
    iwe76Max: TIWEdit;
    IWLabel28: TIWLabel;
    iwe76Min: TIWEdit;
    iwbScaleConcordiaAxes: TIWButton;
    iwcbConcordiaAutoscale: TIWCheckBox;
    iwcbIncluded: TIWCheckBox;
    iwcbExcluded: TIWCheckBox;
    iwrExistingRecords: TIWRegion;
    IWRegion14: TIWRegion;
    IWDBNavigator4: TIWDBNavigator;
    IWLabel31: TIWLabel;
    IWRegion15: TIWRegion;
    IWRegion16: TIWRegion;
    IWRegion17: TIWRegion;
    IWRegion18: TIWRegion;
    iwDBgExistingData: TIWDBGrid;
    iweCountryAbr: TIWEdit;
    iweContinentID: TIWEdit;
    iwbIncludeExcludeData: TIWButton;
    iwbDownloadData: TIWButton;
    iwbUpdateIncludeExcludeToDatabase: TIWButton;
    IWLabel29: TIWLabel;
    IWLabel30: TIWLabel;
    iweLithology: TIWEdit;
    iweLithClass: TIWEdit;
    iwcbIncludeSampleZones: TIWCheckBox;
    iwlSampleZones: TIWListbox;
    iwbScaleProbabilityXAxis: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1ApproachID: TStringField;
    FDMemTable1ApproachDescription: TStringField;
    //procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbReturnToSampleListClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbRefreshClick(Sender: TObject);
    procedure iwbCalculatePDFClick(Sender: TObject);
    procedure iwbReplotConcordiaClick(Sender: TObject);
    procedure iwbIdentifyPeaksClick(Sender: TObject);
    procedure iwDBgPDFsColumns0Click(ASender: TObject; const AValue: string);
    procedure iwbTransferToPeakClick(Sender: TObject);
    procedure iwbCreateNewRecordsClick(Sender: TObject);
    procedure iwDBgDataColumns0TitleClick(Sender: TObject);
    procedure iwDBgPeaksColumns0TitleClick(Sender: TObject);
    procedure iwcbIncludedExcludedClick(Sender: TObject);
    procedure iwbScaleConcordiaAxesClick(Sender: TObject);
    procedure iwcbConcordiaAutoscaleClick(Sender: TObject);
    procedure iwDBgDataColumns14Click(ASender: TObject; const AValue: string);
    procedure iwbIncludeExcludeDataClick(Sender: TObject);
    procedure iwbDownloadDataClick(Sender: TObject);
    procedure iwbUpdateIncludeExcludeToDatabaseClick(Sender: TObject);
    procedure iwDBgPeaksColumns0Click(ASender: TObject; const AValue: string);
    procedure iwcbIncludeSampleZonesClick(Sender: TObject);
    procedure iwbScaleProbabilityXAxisClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  public
    procedure CreateConcordiaGraphs;
    procedure PopulateConcordiaGraphs;
    procedure GetSampleData;
    procedure CalculatePDF(ShowConcordantOnly : string);
    function Gauss (Ratio, Mean, Dev : double) : double;
    procedure IdentifyMajorPeaks;
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_constants,
  usrIW_dm, DVIW_dmdata, DVIW_definerawdatasamplequery,
  math,
  DVIW_uMain, DVIW_newrawrecord, DB_List_Combo;


procedure TISFIdentifyPeaks.IWAppFormCreate(Sender: TObject);
//var
  //i, nRec : integer;
begin
  if UserSession.LoggedIn then
  begin
    //dmUser.SetDeveloperData('TISFIdentifyPeaks FormCreate 1');
    iwcbIncludeSampleZones.Checked := UserSession.IncludeSampleZoneValues;
    UpdateListBoxValues(iwlSampleZones,dmDV.cdsSampleZones,'ZoneType','ZoneID',UserSession.SampleZoneValues);
    dmdDV.cdsPeaksFound.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFIdentifyPeaks FormCreate 2');
    dmdDV.cdsData.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFIdentifyPeaks FormCreate 3');
    dmdDV.cdsDataHf.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFIdentifyPeaks FormCreate 4');
    dmdDV.cdsDataHfyes.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFIdentifyPeaks FormCreate 5');
    dmdDV.cdsPDF.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFIdentifyPeaks FormCreate 6');
    dmdDV.ConstructRawDataSampleQuery;
    //dmUser.SetDeveloperData('TISFIdentifyPeaks qRawSmp construct');
    //dmUser.SetDeveloperData(dmdDV.qRawSmp.SQL.Text);
    iwrCreateNewSummaryRecords.Visible := false;
    iwrPeaksIdentifiedList.Visible := false;
    iwbIdentifyPeaks.Visible := false;
    //iwbTransferToPeak.Visible := false;
    UserSession.Parameter2Chosen := UserSession.SampleValues[0];
    if (UserSession.UnitSender = usIdentifyPeaks) then
    begin
      iwrPeaksIdentifiedList.Visible := true;
      iwbIdentifyPeaks.Visible := true;
      //iwbTransferToPeak.Visible := false;
      iwrCreateNewSummaryRecords.Visible := true;
      UserSession.Parameter2Chosen := UserSession.SampleValues[0];
      iweUnitFrom.Text := UserSession.UnitStartFrom;
      iweUnitTo.Text := UserSession.UnitEndWith;
      iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
      iweReferenceTo.Text := UserSession.ReferenceEndWith;
      iweProvinceFrom.Text := UserSession.ProvinceStartFrom;
      iweProvinceTo.Text := UserSession.ProvinceEndWith;
      iweTerraneFrom.Text := UserSession.TerraneStartFrom;
      iweTerraneTo.Text := UserSession.TerraneEndWith;
      if (Trim(iweUnitFrom.Text) = '') then iweUnitFrom.Text := 'A';
      if (Trim(iweUnitTo.Text) = '') then iweUnitTo.Text := 'zz';
      if (Trim(iweReferenceFrom.Text) = '') then iweReferenceFrom.Text := 'A';
      if (Trim(iweReferenceTo.Text) = '') then iweReferenceTo.Text := 'zz';
      if (Trim(iweProvinceFrom.Text) = '') then iweProvinceFrom.Text := 'A';
      if (Trim(iweProvinceTo.Text) = '') then iweProvinceTo.Text := 'zz';
      if (Trim(iweTerraneFrom.Text) = '') then iweTerraneFrom.Text := 'A';
      if (Trim(iweTerraneTo.Text) = '') then iweTerraneTo.Text := 'zz';
      dmdDV.cdsExisting.Close;
      dmdDV.qExisting.Close;
      dmdDV.qExisting.ParamByName('SampleNo').AsString := UserSession.Parameter2Chosen;
      dmdDV.qExisting.ParamByName('IsotopeSystem').AsString := 'UPb';
      dmdDV.cdsExisting.Open;
      iwrExistingRecords.Visible := true;
    end;
    if (UserSession.UnitSender = usShowDetrital) then
    begin
      UserSession.Parameter2Chosen := 'Multiple Samples';
      iwrExistingRecords.Visible := false;
    end;
    iwlSampleNo.Caption := UserSession.Parameter2Chosen;
    iwbDownload.Enabled := UserSession.CanExport;
    iwbDownloadData.Enabled := UserSession.CanExport and UserSession.CanModifyPlus;
    iwbCreateNewRecords.Enabled := UserSession.CanInsert;
    //iwbCreateNewRecords.Enabled := UserSession.IsDeveloper;
    dmdDV.cdsPeaksFound.EmptyDataSet;
    dmdDV.cdsPDF.EmptyDataSet;
    dmdDV.cdsData.EmptyDataSet;
    //dmUser.SetDeveloperData('SetDeveloperData works');
    CreateConcordiaGraphs;
    //dmUser.SetDeveloperData('Before GetSampleData');
    GetSampleData;
    //dmUser.SetDeveloperData('Before CalculatePDF N');
    CalculatePDF('N');
    //dmUser.SetDeveloperData('Before CalculatePDF Y');
    CalculatePDF('Y');
    //dmUser.SetDeveloperData('After CalculatePDF Y');
  end;
end;

procedure TISFIdentifyPeaks.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFIdentifyPeaks.CreateConcordiaGraphs;
var
  i : integer;
  iMaxConcordiaAge, iConcordiaAgeIncrement, iLabelConcordiaAgeIncrement : integer;
  t207235, t206238, t207206, t238206 : double;
begin
  iMaxConcordiaAge := 4500;
  iConcordiaAgeIncrement := 20;
  iLabelConcordiaAgeIncrement := 400;
  ChartWetherill.Series[0].Clear;
  ChartWetherill.Series[1].Clear;
  ChartWetherill.Series[2].Clear;
  ChartWetherill.Series[3].Clear;
  ChartTeraWasserburg.Series[0].Clear;
  ChartTeraWasserburg.Series[1].Clear;
  ChartTeraWasserburg.Series[2].Clear;
  ChartTeraWasserburg.Series[3].Clear;
  i := 0;
  repeat
    dmdDV.CalculateConcordiaForAge(1.0e6*i,t207235,t206238,t207206,t238206);
    ChartWetherill.Series[0].AddXY(t207235,t206238);
    if (i > 0) then ChartTeraWasserburg.Series[0].AddXY(t238206,t207206);
    if ((i mod iLabelConcordiaAgeIncrement) = 0) then
    begin
      ChartWetherill.Series[1].AddXY(t207235,t206238);
      if (i > 0) then ChartTeraWasserburg.Series[1].AddXY(t238206,t207206);
    end;
    i := i + iConcordiaAgeIncrement;
  until (i >= iMaxConcordiaAge);
end;

procedure TISFIdentifyPeaks.PopulateConcordiaGraphs;
var
  //iCode : integer;
  //i : integer;
  t207235, t206238, t207206, t238206 : double;
  tIncludeYN : string;
  //tConcordance,
  //ConcordanceFrom, ConcordanceTo : double;
begin
  //Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  //Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  dmdDV.cdsData.First;
  ChartWetherill.Series[2].Clear;
  ChartWetherill.Series[3].Clear;
  ChartTeraWasserburg.Series[2].Clear;
  ChartTeraWasserburg.Series[3].Clear;
  //i := 0;
  repeat
    tIncludeYN := dmdDV.cdsDataIncludeYN.AsString;
    //tConcordance := dmdDV.cdsDataPercentConcordance.AsFloat;   // not needed in this routine
    {
    if ((tConcordance >= ConcordanceFrom) and (tConcordance <= ConcordanceTo))
      then tIncludeYN := 'Y'
      else tIncludeYN := 'N';
    dmdDV.cdsData.Edit;
    dmdDV.cdsDataIncludeYN.AsString := tIncludeYN;
    dmdDV.cdsData.Post;
    }
    t207235 := dmdDV.cdsDataPb207U235.AsFloat;
    t206238 := dmdDV.cdsDataPb206U238.AsFloat;
    t238206 := dmdDV.cdsDataU238Pb206.AsFloat;
    t207206 := dmdDV.cdsDataPb207Pb206.AsFloat;
    if (tIncludeYN = 'Y') then
    begin
      if ((t207235 > 0.0) and (t206238 > 0.0)) then
      begin
        ChartWetherill.Series[2].AddXY(t207235,t206238);
      end;
      if ((t238206 > 0.0) and (t207206 > 0.0)) then
      begin
        ChartTeraWasserburg.Series[2].AddXY(t238206,t207206);
      end;
    end else
    begin
      if ((t207235 > 0.0) and (t206238 > 0.0)) then
      begin
        ChartWetherill.Series[3].AddXY(t207235,t206238);
      end;
      if ((t238206 > 0.0) and (t207206 > 0.0)) then
      begin
        ChartTeraWasserburg.Series[3].AddXY(t238206,t207206);
      end;
    end;
    dmdDV.cdsData.Next;
  until dmdDV.cdsData.Eof;
  dmdDV.cdsData.First;
end;

procedure TISFIdentifyPeaks.GetSampleData;
var
  iCnt, iCntIncluded, i : integer;
  tIncludeYN : string;
  iCode : integer;
  tConcordance,
  ConcordanceFrom, ConcordanceTo : double;
  iErrTypX, iErrTypY, iErrTypZ : integer;
  tErrValX, tDataValX,
  tErrValY, tDataValY,
  tErrValZ, tDataValZ : double;
begin
  tIncludeYN := 'Y';
  iCnt := 0;
  iCntIncluded := 0;
  Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  GetListBoxValues(iwlSampleZones,dmDV.cdsSampleZones,'ZoneType','ZoneID',UserSession.SampleZoneValues);
  if ((UserSession.IncludeSampleZoneValues) and (UserSession.SampleZoneValues.Count < 1)) then UserSession.IncludeSampleZoneValues := false;
  dmdDV.ConstructRawDataSampleQuery;
  dmdDV.qRawSmp.Close;
  dmdDV.cdsRawSmp.Close;
  //dmdDV.qRawSmp.ParamByName('SampleNo').AsString := UserSession.Parameter2Chosen;
  dmdDV.qRawSmp.ParamByName('RegAssocID').AsString := 'UPb';
  //dmUser.SetDeveloperData('Before dmdDV.cdsRawSmp.Open');
  //dmUser.SetDeveloperData(dmdDV.qRawSmp.SQL.Text);
  dmdDV.cdsRawSmp.Open;
  //dmUser.SetDeveloperData('After dmdDV.cdsRawSmp.Open');
  iweLongitude.Visible := true;
  iweLatitude.Visible := true;
  iweElevation.Visible := true;
  iweLithology.Visible := true;
  iweLithClass.Visible := true;
  iwlSourceShort.Visible := false;
  iwlSource.Visible := false;
  iweCountryAbr.Text := '';
  iweContinentID.Text := '';
  iweLongitude.Text := '';
  iweLatitude.Text := '';
  iweElevation.Text := '';
  iweLithology.Text := '';
  iweLithClass.Text := '';
  if (UserSession.UnitSender = usIdentifyPeaks) then
  begin
    UserSession.NewContinentID := dmdDV.cdsRawSmpLocCONTINENTID.AsString;
    UserSession.NewAreaID := dmdDV.cdsRawSmpLocCOUNTRYABR.AsString;
    UserSession.NewReferenceID := dmdDV.cdsRawRefREFNUM.AsString;
    iweCountryAbr.Text := dmdDV.cdsRawSmpLocCOUNTRYABR.AsString;
    iweContinentID.Text := dmdDV.cdsRawSmpLocCONTINENTID.AsString;
    iweLongitude.Text := FormatFloat('###0.00000',dmdDV.cdsRawSmpLocLONGITUDE.AsFloat);
    iweLatitude.Text := FormatFloat('###0.00000',dmdDV.cdsRawSmpLocLATITUDE.AsFloat);
    iweElevation.Text := FormatFloat('####0.000',dmdDV.cdsRawSmpLocELEVATION.AsFloat);
    iweLithology.Text := dmdDV.cdsRawSmpLocLithology.AsString;
    iweLithClass.Text := '('+dmdDV.cdsRawSmpLocLithClass.AsString+')';
    iwlSourceShort.Caption := dmdDV.cdsRawRefSOURCESHORT.AsString;
    iwlSourceShort.Visible := true;
    iwlSource.Visible := true;
  end;
  if (UserSession.UnitSender = usShowDetrital) then
  begin
    iwlSourceShort.Visible := false;
    iwlSource.Visible := false;
    iweLongitude.Text := '';
    iweLatitude.Text := '';
    iweElevation.Text := '';
    iweLithology.Text := '';
    iweLithClass.Text := '';
    iweLongitude.Visible := false;
    iweLatitude.Visible := false;
    iweElevation.Visible := false;
    //iweLithology.Visible := '';
    //iweLithClass.Visible := '';
  end;
  //dmUser.SetDeveloperData('Before dmdDV.cdsData.Open');
  dmdDV.cdsData.Open;
  //dmUser.SetDeveloperData('After dmdDV.cdsData.Open');
  try
    dmdDV.cdsData.EmptyDataSet;
    //dmdDV.cdsData.Refresh;
  except
  end;
  //dmUser.SetDeveloperData('After dmdDV.cdsData.EmptyDataSet');
  dmdDV.cdsRawSmp.First;
  i := 1;
  repeat
    tConcordance := 100.0 - dmdDV.cdsRawDiscordanceDATAVALUE.AsFloat;
    if ((tConcordance >= ConcordanceFrom) and (tConcordance <= ConcordanceTo)) then tIncludeYN := 'Y'
                                                                               else tIncludeYN := 'N';
    iErrTypX := Trunc(dmdDV.cdsRawErrTypeXDATAVALUE.AsFloat);
    tErrValX := dmdDV.cdsRawDataXerrDATAVALUE.AsFloat;
    tDataValX := dmdDV.cdsRawNormalisedValueXNORMALISEDVALUE.AsFloat;
    iErrTypY := Trunc(dmdDV.cdsRawErrTypeYDATAVALUE.AsFloat);
    tErrValY := dmdDV.cdsRawDataYerrDATAVALUE.AsFloat;
    tDataValY := dmdDV.cdsRawNormalisedValueYNORMALISEDVALUE.AsFloat;
    iErrTypZ := Trunc(dmdDV.cdsRawErrTypeZDATAVALUE.AsFloat);
    tErrValZ := dmdDV.cdsRawDataZerrDATAVALUE.AsFloat;
    tDataValZ := dmdDV.cdsRawNormalisedValueZNORMALISEDVALUE.AsFloat;
    if (iwcbExcludeDataWithoutAnalyses.Checked) then
    begin
      //dmUser.SetDeveloperData('iwcbExcludeDataWithoutAnalyses Checked');
      if ((tDataValX < 0.00001) or (tDataValY < 0.00001) or (tDataValZ < 0.00001)) then
      begin
        tIncludeYN := 'N';
        tConcordance := 0.0;
      end;
    end else
    begin
      //dmUser.SetDeveloperData(FormatFloat('#0.00000',tDataValX)+' '+FormatFloat('#0.00000',tDataValY)+' '+FormatFloat('#0.00000',tDataValZ));
      //dmUser.SetDeveloperData('iwcbExcludeDataWithoutAnalyses NOT Checked');
      if ((tDataValX < 0.00001) and (tDataValY < 0.00001) and (tDataValZ > 0.00001)) then
      begin
        tIncludeYN := 'Y';
        tConcordance := 0.0;
      end;
    end;
    if (dmdDV.cdsRawDataIncludeDATAVALUE.AsFloat < 0.5) then
    begin
      tIncludeYN := 'N';
    end;
    //dmUser.SetDeveloperData(tIncludeYN);
    if (iErrTypX = 0) then tErrValX := tErrValX*tDataValX/100.0;     //% uncertainties
    if (iErrTypY = 0) then tErrValY := tErrValY*tDataValY/100.0;     //
    if (iErrTypZ = 0) then tErrValZ := tErrValZ*tDataValZ/100.0;     //
    try
      dmdDV.cdsData.Append;
      dmdDV.cdsDatatRec.AsInteger := i;
      dmdDV.cdsDataSampleNo.AsString := dmdDV.cdsRawSmpSAMPLENO.AsString;
      dmdDV.cdsDataFrac.AsString := dmdDV.cdsRawSmpFRAC.AsString;
      dmdDV.cdsDataZoneID.AsString := dmdDV.cdsRawSmpZONEID.AsString;
      dmdDV.cdsDataPb207U235.AsFloat := tDataValX;
      dmdDV.cdsDataPb207U235Sigma.AsFloat := tErrValX;
      dmdDV.cdsDataPb206U238.AsFloat := tDataValY;
      dmdDV.cdsDataPb206U238Sigma.AsFloat := tErrValY;
      if (tDataValY > 0.0) then
      begin
        dmdDV.cdsDataU238Pb206.AsFloat := 1.0/tDataValY;
        dmdDV.cdsDataU238Pb206Sigma.AsFloat := (1.0/tDataValY)*tErrValY/tDataValY;
      end else
      begin
        dmdDV.cdsDataU238Pb206.AsFloat := 0.0;
        dmdDV.cdsDataU238Pb206Sigma.AsFloat := 1000.0;
        if (iwcbExcludeDataWithoutAnalyses.Checked) then tIncludeYN := 'N';
      end;
      dmdDV.cdsDataPb207Pb206.AsFloat := tDataValZ;
      dmdDV.cdsDataPb207Pb206Sigma.AsFloat := tErrValZ;
      dmdDV.cdsDataIncludeYN.AsString := tIncludeYN;
      dmdDV.cdsDataPercentConcordance.AsFloat := tConcordance;
      dmdDV.cdsDataPreferredAge.AsFloat := dmdDV.cdsRawAgePrefDATAVALUE.AsFloat;
      dmdDV.cdsDataPreferredAgeSigma.AsFloat := dmdDV.cdsRawDataAgeerrDATAVALUE.AsFloat;
      dmdDV.cdsData.Post;
    except
    end;
    i := i + 1;
    if (tIncludeYN = 'Y') then iCntIncluded := iCntIncluded + 1;
    iCnt := iCnt + 1;
    dmdDV.cdsRawSmp.Next;
  until dmdDV.cdsRawSmp.Eof;
  dmdDV.cdsData.First;
  dmdDV.cdsRawSmp.Close;
  iwlCount.Caption := IntToStr(iCntIncluded)+' of '+IntToStr(iCnt)+' analyses match the criteria for concordance';
  //dmUser.SetDeveloperData('Before PopulateConcordiaGraphs');
  PopulateConcordiaGraphs;
  //dmUser.SetDeveloperData('After PopulateConcordiaGraphs');
end;

procedure TISFIdentifyPeaks.iwbCalculatePDFClick(Sender: TObject);
begin
  CalculatePDF('N');
  CalculatePDF('Y');
end;

procedure TISFIdentifyPeaks.iwbCreateNewRecordsClick(Sender: TObject);
begin
  if (dmdDV.cdsPeaksFound.RecordCount > 0) then
  begin
    //dmUser.SetDeveloperData('CreateNewRecords '+UserSession.NewContinentID+' '+UserSession.NewAreaID+' '+UserSession.NewReferenceID);
    UserSession.UnitStartFrom := iweUnitFrom.Text;
    UserSession.UnitEndWith := iweUnitTo.Text;
    UserSession.ReferenceStartFrom := iweReferenceFrom.Text;
    UserSession.ReferenceEndWith := iweReferenceTo.Text;
    UserSession.ProvinceStartFrom := iweProvinceFrom.Text;
    UserSession.ProvinceEndWith := iweProvinceTo.Text;
    UserSession.TerraneStartFrom := iweTerraneFrom.Text;
    UserSession.TerraneEndWith := iweTerraneTo.Text;
    UserSession.NewMaterialID := 'zr';
    UserSession.NewIsotopeSystemID := 'UPb';
    UserSession.NewInterpretationID := 'Detri';
    UserSession.NewApproachID := 'PbPb';
    //UserSession.NewTechniqueID := 'nd';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFNewRawRecord.Create(WebApplication).Show;
  end;
end;

procedure TISFIdentifyPeaks.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  dmdDV.cdsPDF.First;
  repeat
    FDMemTable1.AppendRecord([dmdDV.cdsPDFStep.AsVariant,dmdDV.cdsPDFPDFDataValue.AsVariant,
          dmdDV.cdsPDFPDFValue.AsVariant]);
    dmdDV.cdsPDF.Next;
  until dmdDV.cdsPDF.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxRawPDF.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxRawPDF.xlsx';
  frFileNameStr := 'Raw Data PDF for sample.xls';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTable1',FDMemTable1);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFIdentifyPeaks.iwbDownloadDataClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmdDV.cdsData.First;
  //dmdDV.ReportDataUPb.Template := DefaultFlexCellFolder+'FlxRawDataUPb.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxRawDataUPb.xlsx';
  frFileNameStr := 'Raw Data for samples.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsData',dmdDV.cdsData);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFIdentifyPeaks.iwbIdentifyPeaksClick(Sender: TObject);
//var
  //i, j, k, l : integer;
  //X1, X2, Y2 : double;
  //tempstep : integer;
  //tempmax, tempmaxage : double;
  //iCode : integer;
  //FromAge, ToAge : double;
begin
  ChartPDF.Series[2].Clear;
  dmdDV.cdsPeaksFound.Open;
  dmdDV.cdsPeaksFound.EmptyDataSet;
  dmdDV.cdsPeaks.Open;
  dmdDV.cdsPeaks.EmptyDataSet;
  {
  Val(iweAgeFrom.Text,FromAge,iCode);
  Val(iweAgeTo.Text,ToAge,iCode);
  dmdDV.cdsPDF.First;
  tempmax := 0.0;
  repeat
    if (tempmax < dmdDV.cdsPDFPDFValue.AsFloat) then
    begin
      tempstep := dmdDV.cdsPDFStep.AsInteger;
      tempmax := dmdDV.cdsPDFPDFValue.AsFloat;
      tempmaxage := dmdDV.cdsPDFPDFDataValue.AsFloat;
    end;
    dmdDV.cdsPDF.Next;
  until dmdDV.cdsPDF.Eof;
  dmdDV.cdsPeaksFound.Append;
  dmdDV.cdsPeaksFoundi.AsInteger := tempstep;
  dmdDV.cdsPeaksFoundAge.AsFloat := tempmaxage;
  dmdDV.cdsPeaksFoundAgePlus95.AsFloat := 20.0;
  dmdDV.cdsPeaksFoundAgeMinus95.AsFloat := 20.0;
  dmdDV.cdsPeaksFoundProbability.AsFloat := tempmax;
  dmdDV.cdsPeaksFound.Post;
  ChartPDF.Series[2].AddXY(tempmaxage,tempmax);
  }
  IdentifyMajorPeaks;
end;

procedure TISFIdentifyPeaks.IdentifyMajorPeaks;
const
  cutoff : double = 20.0;
var
  i, j, k : integer;
  //X1, X2, Y2 : double;
  //tempstep : integer;
  //tempmax, tempmaxage : double;
  //iCode : integer;
  //FromAge, ToAge : double;
  CurveValues : array[1..Steps+10,0..3] of double;
  PeakValues : array[1..500,0..3] of double;
  //tPeakValue, tPeakChange : double;
  //tExistingAge : double;
begin
  //WebApplication.ShowMessage('Steps = '+IntToStr(Steps));
  dmdDV.cdsPDF.First;
  i := 1;
  j := 1;
  repeat
    CurveValues[i,0] := dmdDV.cdsPDFStep.AsFloat;
    CurveValues[i,1] := dmdDV.cdsPDFPDFDataValue.AsFloat;
    CurveValues[i,2] := dmdDV.cdsPDFPDFValue.AsFloat;
    if (i < 10) then
    begin
      //WebApplication.ShowMessage(FormatFloat('###0.00',CurveValues[i,0])+' '+FormatFloat('##0.00',CurveValues[i,2]));
    end;
    i := i + 1;
    dmdDV.cdsPDF.Next;
  until dmdDV.cdsPDF.Eof;
  //WebApplication.ShowMessage('after copy curve to CurveValues');
  CurveValues[1,3] := 0.0;
  for i := 2 to Steps do
  begin
    CurveValues[i,3] := CurveValues[i,2] - CurveValues[i-1,2];
    if (i < 10) then
    begin
      //WebApplication.ShowMessage(FormatFloat('###0.00',CurveValues[i,0])+' '+FormatFloat('##0.00',CurveValues[i,3]));
    end;
  end;
  //WebApplication.ShowMessage('after calculate change in value to CurveValues');
  //dmdDV.cdsPeaks.EmptyDataSet;
  for i := 2 to (Steps-1) do
  begin
    if (sign(CurveValues[i,3]) <> sign(CurveValues[i+1,3])) then
    begin
        //WebApplication.ShowMessage(FormatFloat('###0.00',CurveValues[i,3])+' '+FormatFloat('##0.00',CurveValues[i+1,3]));
        PeakValues[j,0] := CurveValues[i,0];
        PeakValues[j,1] := CurveValues[i,1];
        PeakValues[j,2] := CurveValues[i,2];
        PeakValues[j,3] := 0.0;
        if (j > 1) then PeakValues[j,3] := PeakValues[j,2] - PeakValues[j-1,2];
        dmDDV.cdsPeaks.Append;
        dmdDV.cdsPeaksPeakStep.AsInteger := Trunc(PeakValues[j,0]);
        dmdDV.cdsPeaksPeakAge.AsFloat := PeakValues[j,1];
        dmdDV.cdsPeaksPeakValue.AsFloat := PeakValues[j,2];
        dmdDV.cdsPeaksPeakChange.AsFloat := PeakValues[j,3];
        dmDDV.cdsPeaks.Post;
        j := j + 1;
    end;
  end;
  //WebApplication.ShowMessage('after copy to PeakValues. j = '+IntToStr(j-1));
  //for i := 2 to j-1 do
  //begin
  //  WebApplication.ShowMessage('AA '+IntToStr(i)+' '+FormatFloat('###0.00',PeakValues[i,1])+' '+FormatFloat('##0.00',PeakValues[i,2])+' '+FormatFloat('##0.00',PeakValues[i,3]));
  //end;
  //delete all small (< cutoff) negative steps
  dmdDV.cdsPeaks.Last;
  repeat
    if ((Abs(dmdDV.cdsPeaksPeakChange.AsFloat) < cutoff) and (sign(dmdDV.cdsPeaksPeakChange.AsFloat) < 0)) then dmdDV.cdsPeaks.Delete;
    dmdDV.cdsPeaks.Prior;
  until dmdDV.cdsPeaks.Bof;
  j := dmdDV.cdsPeaks.RecordCount;
  //WebApplication.ShowMessage('after first delete for cdsPeaks. j = '+IntToStr(j));
  //find all inflections again in reduced data set
  dmdDV.cdsPeaks.First;
  k := 1;
  for i := 1 to j do
  begin
    PeakValues[k,0] := dmdDV.cdsPeaksPeakStep.AsFloat;
    PeakValues[k,1] := dmdDV.cdsPeaksPeakAge.AsFloat;
    PeakValues[k,2] := dmdDV.cdsPeaksPeakValue.AsFloat;
    PeakValues[k,3] := 0.0;
    if (k > 1) then PeakValues[k,3] := PeakValues[k,2] - PeakValues[k-1,2];
    k := k + 1;
    dmdDV.cdsPeaks.Next;
  end;
  dmdDV.cdsPeaks.EmptyDataSet;
  for i := 1 to (k-2) do
  begin
    if (sign(PeakValues[i,3]) <> sign(PeakValues[i+1,3])) then
    begin
      dmDDV.cdsPeaks.Append;
      dmdDV.cdsPeaksPeakStep.AsInteger := Trunc(PeakValues[i,0]);
      dmdDV.cdsPeaksPeakAge.AsFloat := PeakValues[i,1];
      dmdDV.cdsPeaksPeakValue.AsFloat := PeakValues[i,2];
      dmdDV.cdsPeaksPeakChange.AsFloat := PeakValues[i,3];
      dmDDV.cdsPeaks.Post;
    end;
  end;
  //delete all negative steps i.e. troughs
  dmdDV.cdsPeaks.Last;
  repeat
    if (sign(dmdDV.cdsPeaksPeakChange.AsFloat) < 0.0) then dmdDV.cdsPeaks.Delete;
    dmdDV.cdsPeaks.Prior;
  until dmdDV.cdsPeaks.Bof;
  //j := dmdDV.cdsPeaks.RecordCount;
  //WebApplication.ShowMessage('after second delete for cdsPeaks. j = '+IntToStr(j));
  dmdDV.cdsPeaksFound.Open;
  dmdDV.cdsPeaksFound.EmptyDataSet;
  dmdDV.cdsPeaks.First;
  repeat
    if (dmdDV.cdsPeaksPeakValue.AsFloat > cutoff) then
    begin
      //WebApplication.ShowMessage('B '+FormatFloat('###0.00',dmdDV.cdsPeaksPeakAge.AsFloat)+' '+FormatFloat('##0.00',dmdDV.cdsPeaksPeakValue.AsFloat));
      dmdDV.cdsPeaksFound.Append;
      dmdDV.cdsPeaksFoundi.AsInteger := dmdDV.cdsPeaksPeakStep.AsInteger;
      dmdDV.cdsPeaksFoundAge.AsFloat := dmdDV.cdsPeaksPeakAge.AsFloat;
      dmdDV.cdsPeaksFoundAgePlus95.AsFloat := 20.0;
      dmdDV.cdsPeaksFoundAgeMinus95.AsFloat := 20.0;
      dmdDV.cdsPeaksFoundProbability.AsFloat := dmdDV.cdsPeaksPeakValue.AsFloat;
      dmdDV.cdsPeaksFound.Post;
      ChartPDF.Series[2].AddXY(dmdDV.cdsPeaksPeakAge.AsFloat,dmdDV.cdsPeaksPeakValue.AsFloat);
    end;
    dmdDV.cdsPeaks.Next;
  until dmdDV.cdsPeaks.Eof;;
end;

procedure TISFIdentifyPeaks.iwbIncludeExcludeDataClick(Sender: TObject);
begin
  dmdDV.cdsData.Edit;
  if (dmdDV.cdsDataIncludeYN.AsString = 'Y') then dmdDV.cdsDataIncludeYN.AsString := 'N'
                                             else dmdDV.cdsDataIncludeYN.AsString := 'Y';
  dmdDV.cdsData.Post;
end;

procedure TISFIdentifyPeaks.iwbRefreshClick(Sender: TObject);
var
  i : integer;
  iMaxConcordiaAge, iConcordiaAgeIncrement, iLabelConcordiaAgeIncrement : integer;
  t207235, t206238, t207206, t238206 : double;
  tAge : double;
  iCode : integer;
  //MinimumUncertainty,
  //ConcordanceFrom, ConcordanceTo,
  //DiscordanceFrom, DiscordanceTo : double;
begin
  iMaxConcordiaAge := 4500;
  iConcordiaAgeIncrement := 100;
  iLabelConcordiaAgeIncrement := 400;
  Val(iweAgeTo.Text,tAge,iCode);
  if (iCode = 0) then iMaxConcordiaAge := Trunc(tAge);
  ChartWetherill.Series[0].Clear;
  ChartWetherill.Series[1].Clear;
  ChartWetherill.Series[2].Clear;
  ChartWetherill.Series[3].Clear;
  ChartTeraWasserburg.Series[0].Clear;
  ChartTeraWasserburg.Series[1].Clear;
  ChartTeraWasserburg.Series[2].Clear;
  ChartTeraWasserburg.Series[3].Clear;
  i := 0;
  Val(iweAgeFrom.Text,tAge,iCode);
  if (iCode = 0) then i := Trunc(tAge);
  repeat
    dmdDV.CalculateConcordiaForAge(1.0e6*i,t207235,t206238,t207206,t238206);
    //if (i < 1000) then WebApplication.ShowMessage(FormatFloat('####0.00',t206238)+'  '+FormatFloat('####0.00',t238206));
    ChartWetherill.Series[0].AddXY(t207235,t206238);
    if (i > 0) then ChartTeraWasserburg.Series[0].AddXY(t238206,t207206);
    if ((i mod iLabelConcordiaAgeIncrement) = 0) then
    begin
      ChartWetherill.Series[1].AddXY(t207235,t206238);
      if (i > 0) then ChartTeraWasserburg.Series[1].AddXY(t238206,t207206);
    end;
    i := i + iConcordiaAgeIncrement;
  until (i >= iMaxConcordiaAge);
  //Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  //Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  //Val(iweMinimumUncertainty.Text,MinimumUncertainty,iCode);
  //DiscordanceFrom := 100.0 - ConcordanceTo;
  //DiscordanceTo := 100.0 - ConcordanceFrom;
  GetSampleData;
  CalculatePDF('N');
  CalculatePDF('Y');
end;

procedure TISFIdentifyPeaks.iwbReplotConcordiaClick(Sender: TObject);
var
  i : integer;
  iMaxConcordiaAge, iConcordiaAgeIncrement, iLabelConcordiaAgeIncrement : integer;
  t207235, t206238, t207206, t238206 : double;
  tAge : double;
  iCode : integer;
  //MinimumUncertainty,
  //ConcordanceFrom, ConcordanceTo,
  //DiscordanceFrom, DiscordanceTo : double;
begin
  iMaxConcordiaAge := 4500;
  iConcordiaAgeIncrement := 20;
  iLabelConcordiaAgeIncrement := 400;
  Val(iweGraphAgeTo.Text,tAge,iCode);
  if (iCode = 0) then iMaxConcordiaAge := Trunc(tAge);
  ChartWetherill.Series[0].Clear;
  ChartWetherill.Series[1].Clear;
  ChartTeraWasserburg.Series[0].Clear;
  ChartTeraWasserburg.Series[1].Clear;
  i := 0;
  Val(iweGraphAgeFrom.Text,tAge,iCode);
  if (iCode = 0) then i := Trunc(tAge);
  repeat
    dmdDV.CalculateConcordiaForAge(1.0e6*i,t207235,t206238,t207206,t238206);
    ChartWetherill.Series[0].AddXY(t207235,t206238);
    if (i > 0) then ChartTeraWasserburg.Series[0].AddXY(t238206,t207206);
    if ((i mod iLabelConcordiaAgeIncrement) = 0) then
    begin
      ChartWetherill.Series[1].AddXY(t207235,t206238);
      if (i > 0) then ChartTeraWasserburg.Series[1].AddXY(t238206,t207206);
    end;
    i := i + iConcordiaAgeIncrement;
  until (i >= iMaxConcordiaAge);
end;

procedure TISFIdentifyPeaks.iwbReturnClick(Sender: TObject);
begin
  dmdDV.cdsPeaksFound.EmptyDataSet;
  dmdDV.cdsData.EmptyDataSet;
  dmdDV.cdsDataHf.EmptyDataSet;
  dmdDV.cdsDataHfyes.EmptyDataSet;
  dmdDV.cdsPDF.EmptyDataSet;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFIdentifyPeaks.iwbReturnToSampleListClick(Sender: TObject);
begin
  dmdDV.cdsPeaksFound.EmptyDataSet;
  dmdDV.cdsInitials.EmptyDataSet;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDefineRawDataSampleQuery.Create(WebApplication).Show;
end;

procedure TISFIdentifyPeaks.iwbScaleConcordiaAxesClick(Sender: TObject);
var
  t75Min, t75Max,
  t68Min, t68Max,
  t86Min, t86Max,
  t76Min, t76Max : double;
  iCode : integer;
begin
  Val(iwe75Min.Text,t75Min,iCode);
  Val(iwe68Min.Text,t68Min,iCode);
  Val(iwe86Min.Text,t86Min,iCode);
  Val(iwe76Min.Text,t76Min,iCode);
  Val(iwe75Max.Text,t75Max,iCode);
  Val(iwe68Max.Text,t68Max,iCode);
  Val(iwe86Max.Text,t86Max,iCode);
  Val(iwe76Max.Text,t76Max,iCode);
  ChartWetherill.BottomAxis.SetMinMax(t75Min,t75Max);
  ChartWetherill.LeftAxis.SetMinMax(t68Min,t68Max);
  ChartTeraWasserburg.BottomAxis.SetMinMax(t86Min,t86Max);
  ChartTeraWasserburg.LeftAxis.SetMinMax(t76Min,t76Max);
  iwcbConcordiaAutoscale.Checked := false;
end;

procedure TISFIdentifyPeaks.iwbScaleProbabilityXAxisClick(Sender: TObject);
var
  tAgeMin, tAgeMax : double;
  iCode : integer;
begin
  Val(iweAgeFrom.Text,tAgeMin,iCode);
  Val(iweAgeTo.Text,tAgeMax,iCode);
  ChartPDF.BottomAxis.SetMinMax(tAgeMin,tAgeMax);
end;

procedure TISFIdentifyPeaks.iwbTransferToPeakClick(Sender: TObject);
var
  tempAge, tempProb, tPlus, tMinus : double;
  i : integer;
begin
  i := dmdDV.cdsPDFStep.AsInteger;
  tempAge := dmdDV.cdsPDFPDFDataValue.AsFloat;
  tempProb := dmdDV.cdsPDFPDFValue.AsFloat;
  tPlus := 20.0;
  tMinus := 20.0;
  dmdDV.cdsPeaksFound.Append;
  dmdDV.cdsPeaksFoundi.AsInteger := i;
  dmdDV.cdsPeaksFoundAge.AsFloat := tempAge;
  dmdDV.cdsPeaksFoundAgePlus95.AsFloat := tPlus;
  dmdDV.cdsPeaksFoundAgeMinus95.AsFloat := tMinus;
  dmdDV.cdsPeaksFoundProbability.AsFloat := tempProb;
  dmdDV.cdsPeaksFound.Post;
  ChartPDF.Series[2].AddXY(tempAge,tempProb);
end;

procedure TISFIdentifyPeaks.iwbUpdateIncludeExcludeToDatabaseClick(
  Sender: TObject);
begin
  //
end;

procedure TISFIdentifyPeaks.iwcbConcordiaAutoscaleClick(Sender: TObject);
begin
  if not iwcbConcordiaAutoscale.checked then
  begin
    ChartWetherill.BottomAxis.Automatic := true;
    ChartWetherill.LeftAxis.Automatic := true;
    ChartTeraWasserburg.BottomAxis.Automatic := true;
    ChartTeraWasserburg.LeftAxis.Automatic := true;
 end;
end;

procedure TISFIdentifyPeaks.iwcbIncludedExcludedClick(Sender: TObject);
begin
  if iwcbIncluded.Checked then
  begin
    ChartWetherill.Series[2].ShowInLegend := true;
    ChartWetherill.Series[2].Visible := true;
    ChartTeraWasserburg.Series[2].ShowInLegend := true;
    ChartTeraWasserburg.Series[2].Visible := true;
  end else
  begin
    ChartWetherill.Series[2].ShowInLegend := false;
    ChartWetherill.Series[2].Visible := false;
    ChartTeraWasserburg.Series[2].ShowInLegend := false;
    ChartTeraWasserburg.Series[2].Visible := false;
  end;
  if iwcbExcluded.Checked then
  begin
    ChartWetherill.Series[3].ShowInLegend := true;
    ChartWetherill.Series[3].Visible := true;
    ChartTeraWasserburg.Series[3].ShowInLegend := true;
    ChartTeraWasserburg.Series[3].Visible := true;
  end else
  begin
    ChartWetherill.Series[3].ShowInLegend := false;
    ChartWetherill.Series[3].Visible := false;
    ChartTeraWasserburg.Series[3].ShowInLegend := false;
    ChartTeraWasserburg.Series[3].Visible := false;
  end;
end;

procedure TISFIdentifyPeaks.iwcbIncludeSampleZonesClick(Sender: TObject);
begin
  UserSession.IncludeSampleZoneValues := not UserSession.IncludeSampleZoneValues;
  iwcbIncludeSampleZones.Checked := UserSession.IncludeSampleZoneValues;
end;

procedure TISFIdentifyPeaks.iwDBgDataColumns0TitleClick(Sender: TObject);
begin
  dmdDV.cdsData.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;

procedure TISFIdentifyPeaks.iwDBgDataColumns14Click(ASender: TObject;
  const AValue: string);
begin
  dmdDV.cdsData.Locate('tRec',AValue,[]);
end;

procedure TISFIdentifyPeaks.iwDBgPDFsColumns0Click(ASender: TObject;
  const AValue: string);
var
  tempAge, tempProb, tPlus, tMinus : double;
  i : integer;
begin
  dmdDV.cdsPDF.Locate('Step',AValue,[loCaseInsensitive,loPartialKey]);
  i := dmdDV.cdsPDFStep.AsInteger;
  tempAge := dmdDV.cdsPDFPDFDataValue.AsFloat;
  tempProb := dmdDV.cdsPDFPDFValue.AsFloat;
  tPlus := 10.0;
  tMinus := 10.0;
  dmdDV.cdsPeaksFound.Append;
  dmdDV.cdsPeaksFoundi.AsInteger := i;
  dmdDV.cdsPeaksFoundAge.AsFloat := tempAge;
  dmdDV.cdsPeaksFoundAgePlus95.AsFloat := tPlus*2.0;
  dmdDV.cdsPeaksFoundAgeMinus95.AsFloat := tMinus*2.0;
  dmdDV.cdsPeaksFoundProbability.AsFloat := tempProb;
  dmdDV.cdsPeaksFound.Post;
  ChartPDF.Series[2].AddXY(tempAge,tempProb);
end;

procedure TISFIdentifyPeaks.iwDBgPeaksColumns0Click(ASender: TObject;
  const AValue: string);
begin
  //
  dmdDV.cdsPeaksFound.Locate('i',AValue,[loCaseInsensitive,loPartialKey]);
  dmdDV.cdsPeaksFound.Delete;
end;

procedure TISFIdentifyPeaks.iwDBgPeaksColumns0TitleClick(Sender: TObject);
begin
  dmdDV.cdsPeaksFound.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;

procedure TISFIdentifyPeaks.CalculatePDF(ShowConcordantOnly : string);
const
  Steps = 2500;
var
  //i, j,
  k, l : integer;
  X1, X2, Y2 : double;
  tempmax : double;
  Spectrum2d : array[0..Steps,1..2] of double;
  //BinLimits : array[0..MaxBins] of double;
  //BinCount : array[0..MaxBins] of integer;
  tx, tx1 : double;
  iCode : integer;
  MinimumUncertainty : double;
  MinimumCurveValue : double;
  tmpStr : string;
  tempGauss : double;
  //tmpBinWidth, tmpBinCentre : double;
  FromAge, ToAge : double;
  PDFtype : string;
begin
  Val(iweAgeFrom.Text,FromAge,iCode);
  Val(iweAgeTo.Text,ToAge,iCode);
  Val(iweMinimumUncertainty.Text,MinimumUncertainty,iCode);
  if (iwrgAndOr.ItemIndex = 0) then PDFtype := 'AND';
  if (iwrgAndOr.ItemIndex = 1) then PDFtype := 'OR';
  ChartPDF.BottomAxis.SetMinMax(FromAge,ToAge);
  dmdDV.cdsPDF.EmptyDataSet;
  MinimumCurveValue := 0.0;
  for k := 0 to Steps do
  begin
    Spectrum2d[k,1] := 0.0;
    Spectrum2d[k,2] := 0.0;
  end;
  if (ShowConcordantOnly = 'Y') then
  begin
    ChartPDF.Series[0].Clear;
  end else
  begin
    ChartPDF.Series[1].Clear;
  end;
  dmdDV.cdsData.First;
  repeat
    if (ShowConcordantOnly = 'Y') then
    begin
      if ((dmdDV.cdsDataIncludeYN.AsString = 'Y')) then
      begin
        tx := dmdDV.cdsDataPreferredAge.AsFloat;
        tx1 := dmdDV.cdsDataPreferredAgeSigma.AsFloat;
        if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
        for l := 0 to Steps do
        begin
          x1 := FromAge + 1.0*l*(ToAge-FromAge)/Steps;
          Spectrum2d[l,1] := x1;
          tempGauss := Gauss(x1,tx,tx1);
          if (PDFType = 'AND') then Spectrum2d[l,2] := Spectrum2d[l,2] + tempGauss;
          if (PDFType = 'OR') then
          begin
            if (Spectrum2d[l,2] < tempGauss) then Spectrum2d[l,2] := tempGauss;
          end;
        end;
      end;
    end else
    begin
      tx := dmdDV.cdsDataPreferredAge.AsFloat;
      tx1 := dmdDV.cdsDataPreferredAgeSigma.AsFloat;
      if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
      for l := 0 to Steps do
      begin
        x1 := FromAge + 1.0*l*(ToAge-FromAge)/Steps;
        Spectrum2d[l,1] := x1;
        tempGauss := Gauss(x1,tx,tx1);
        if (PDFType = 'AND') then Spectrum2d[l,2] := Spectrum2d[l,2] + tempGauss;
        if (PDFType = 'OR') then
        begin
          if (Spectrum2d[l,2] < tempGauss) then Spectrum2d[l,2] := tempGauss;
        end;
      end;
    end;
    dmdDV.cdsData.Next;
  until dmdDV.cdsData.EOF;
  tempmax := 0.0;
  for k := 0 to Steps do
  begin
    if (tempmax < Spectrum2d[k,2]) then tempmax := Spectrum2d[k,2];
  end;
  if (tempmax <= 0.0) then tempmax := 1.0e-9;
  tempmax := 100.0/tempmax;
  {
  if (PDFType = 'AND') then
  begin
    tempmax := 100.0/tempmax;
  end;
  if (PDFType = 'OR') then
  begin
    tempmax := 1.0;
  end;
  }
  if (tempmax <= 0.0) then tempmax := 1.0e-9;
  dmdDV.cdsData.First;
  for k := 0 to Steps do
  begin
    dmdDV.cdsPDF.Append;
    dmdDV.cdsPDFStep.AsInteger := k;
    x2 := Spectrum2d[k,1];
    y2 := Spectrum2d[k,2] * tempmax;
    if (y2 < MinimumCurveValue) then y2 := 0.0;
    dmdDV.cdsPDFPDFDataValue.AsFloat := x2;
    dmdDV.cdsPDFPDFValue.AsFloat := y2;
    if (ShowConcordantOnly = 'Y') then
    begin
      ChartPDF.Series[0].AddXY(x2,y2);
    end else
    begin
      ChartPDF.Series[1].AddXY(x2,y2);
    end;
  end;
  dmdDV.cdsPDF.First;
  if PDFType='AND' then
  begin
    tmpStr := 'Gaussian AND ';
  end;
  if PDFType='OR' then
  begin
    tmpStr := 'Gaussian OR ';
  end;
  ChartPDF.SubFoot.Text[0] := tmpStr;
  ChartPDF.SubFoot.Text[1] := 'Minimum age uncertainty = '+FormatFloat('###0.0',MinimumUncertainty)+' Ma';
end;

function TISFIdentifyPeaks.Gauss (Ratio, Mean, Dev : double) : double;
begin
  if (Abs(Dev) > 0.0) then
  begin
    if (sqr((Ratio-Mean)/Dev) < 20000.0) then
      Gauss := (1.0/(Dev*sqrt(2.0*Pi))) * exp(-1.0*(sqr(Ratio-Mean))/(2.0*Dev*Dev))
    else
      Gauss := 0.0;
    end else Gauss := 0.0;
end;


end.
