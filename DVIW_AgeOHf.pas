unit DVIW_AgeOHf;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, DVIW_frTopBar, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton, UFlxMemTable,
  UCustomFlexCelReport, UFlexCelReport, UExcelAdapter, XLSAdapter,
  DVIW_framemenu, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, TeEngine, ExtCtrls, TeeProcs, Chart,
  IWCompTeeChart, IWCompEdit, Series, TeeErrorPoint, IWCompCheckbox, IWCompText,
  DVIW_dmdata, IWCompExtCtrls;

type
  TISFAgeHf = class(TIWAppForm)
    XLSAdapter1: TXLSAdapter;
    ReportPDF: TFlexCelReport;
    FlxMemTable1: TFlxMemTable;
    TopBar: TISFTopBar;
    iwrPage: TIWRegion;
    iwrButtonsTop: TIWRegion;
    iwrSampleDetails: TIWRegion;
    IWLabel2: TIWLabel;
    iwlSampleNo: TIWLabel;
    iwrLeft: TIWRegion;
    iwrModelPlots: TIWRegion;
    iwrHfInitial: TIWRegion;
    iwrAgeHfEpsilon: TIWRegion;
    iwChartHfInitial: TIWChart;
    iwIWChartHfEpsilon: TIWChart;
    iwrGraphSplit: TIWRegion;
    ChartAgeHfInitial: TChart;
    iwrButtonsMiddle: TIWRegion;
    iwrValuesIdentifiedList: TIWRegion;
    IWRegion8: TIWRegion;
    IWRegion10: TIWRegion;
    IWRegion11: TIWRegion;
    IWRegion12: TIWRegion;
    iwDBgSummaryValues: TIWDBGrid;
    IWDBNavigator1: TIWDBNavigator;
    iwrDataList: TIWRegion;
    iwrDataListLeft: TIWRegion;
    iwrDataListRight: TIWRegion;
    iwrDataListTop: TIWRegion;
    iwDBnData: TIWDBNavigator;
    iwrDataListBottom: TIWRegion;
    iwrDataListGrid: TIWRegion;
    iwDBgData: TIWDBGrid;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    iwbIdentifyMinMaxValues: TIWButton;
    Series1: TLineSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Series4: TPointSeries;
    ChartAgeHfEpsilon: TChart;
    iwbReturnToSampleList: TIWButton;
    iwbReturn: TIWButton;
    Series7: TLineSeries;
    Series8: TPointSeries;
    Series9: TPointSeries;
    Series10: TPointSeries;
    iwrGraphOptions: TIWRegion;
    IWLabel1: TIWLabel;
    iweGraphAgeFrom: TIWEdit;
    IWLabel11: TIWLabel;
    iweGraphAgeTo: TIWEdit;
    iwbReplotModels: TIWButton;
    iwrCreateNewSummaryRecords: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwbCreateNewDMPeakRecords: TIWButton;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    iwlSource: TIWLabel;
    iwlSourceShort: TIWLabel;
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
    iweConcordanceFrom: TIWEdit;
    IWLabel5: TIWLabel;
    iweConcordanceTo: TIWEdit;
    iwrPDF: TIWRegion;
    iwrPDFLeft: TIWRegion;
    iwrPDFRight: TIWRegion;
    iwrPDFGraph: TIWRegion;
    IWChart1: TIWChart;
    ChartPDF: TChart;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series11: TPointSeries;
    iwrProbabilityOptions: TIWRegion;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel6: TIWLabel;
    IWEdit1: TIWEdit;
    IWEdit2: TIWEdit;
    iweMinimumUncertainty: TIWEdit;
    iweAgeTo: TIWEdit;
    IWLabel7: TIWLabel;
    iweAgeFrom: TIWEdit;
    iwbRefresh: TIWButton;
    IWLabel10: TIWLabel;
    iwrgAndOr: TIWRadioGroup;
    IWLabel12: TIWLabel;
    iwbCalculatePDF: TIWButton;
    iwrButtonsIdentifyPeaks: TIWRegion;
    iwbIdentifyPeaks: TIWButton;
    iwrPeaksIdentifiedList: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    IWDBNavigator2: TIWDBNavigator;
    IWLabel29: TIWLabel;
    IWRegion4: TIWRegion;
    IWRegion5: TIWRegion;
    iwDBgPeaks: TIWDBGrid;
    iwrProbabilityCurves: TIWRegion;
    IWRegion1: TIWRegion;
    IWRegion6: TIWRegion;
    IWRegion7: TIWRegion;
    IWDBNavigator3: TIWDBNavigator;
    IWLabel30: TIWLabel;
    iwbDownloadPDFcurves: TIWButton;
    iwbTransferToPeak: TIWButton;
    IWRegion9: TIWRegion;
    IWRegion13: TIWRegion;
    iwDBgPDFs: TIWDBGrid;
    iwbDownloadData: TIWButton;
    iwrExistingRecords: TIWRegion;
    IWRegion14: TIWRegion;
    IWRegion15: TIWRegion;
    IWRegion16: TIWRegion;
    IWDBNavigator4: TIWDBNavigator;
    IWLabel31: TIWLabel;
    IWRegion17: TIWRegion;
    IWRegion18: TIWRegion;
    iwDBgExistingData: TIWDBGrid;
    iwbRecalculate: TIWButton;
    iwbCreateNewHfInitialRecords: TIWButton;
    iwcbExcluded: TIWCheckBox;
    iwcbIncluded: TIWCheckBox;
    IWRegion19: TIWRegion;
    iwrHfModelInitial: TIWRegion;
    IWChartHfModelInitial: TIWChart;
    ChartAgeHfModelInitial: TChart;
    LineSeries1: TLineSeries;
    PointSeries1: TPointSeries;
    PointSeries2: TPointSeries;
    PointSeries3: TPointSeries;
    IWEdit3: TIWEdit;
    IWLabel32: TIWLabel;
    IWEdit4: TIWEdit;
    IWEdit5: TIWEdit;
    IWLabel33: TIWLabel;
    IWEdit6: TIWEdit;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnToSampleListClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbReplotModelsClick(Sender: TObject);
    procedure iwbIdentifyMinMaxValuesClick(Sender: TObject);
    procedure iwbTransferToPeakClick(Sender: TObject);
    procedure iwbCreateNewDMPeakRecordsClick(Sender: TObject);
    procedure iwDBgDataColumns0TitleClick(Sender: TObject);
    procedure iwDBgPeaksColumns0TitleClick(Sender: TObject);
    procedure iwcbIncludedExcludedClick(Sender: TObject);
    procedure iwbScaleAxesClick(Sender: TObject);
    procedure iwcbAutoscaleClick(Sender: TObject);
    procedure iwbCalculatePDFClick(Sender: TObject);
    procedure iwbRefreshClick(Sender: TObject);
    procedure iwbDownloadPDFcurvesClick(Sender: TObject);
    procedure iwbDownloadDataClick(Sender: TObject);
    procedure iwbIdentifyPeaksClick(Sender: TObject);
    procedure iwbRecalculateClick(Sender: TObject);
    procedure iwbCreateNewHfInitialRecordsClick(Sender: TObject);
    procedure iwDBgSummaryValuesColumns0TitleClick(Sender: TObject);
  public
    procedure CreateGraphs;
    procedure PopulateGraphs;
    procedure GetSampleData;
    procedure CalculatePDF(ShowConcordantOnly : string);
    function Gauss (Ratio, Mean, Dev : double) : double;
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_constants,
  DVIW_refdetails, usrIW_dm, DVIW_definerawdatasamplequery,
  DVIW_uMain, DVIW_newrawrecord;




procedure TISFAgeHf.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFAgeHf.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
begin
  if UserSession.LoggedIn then
  begin
    dmdDV.ConstructRawDataSampleQuery;
    dmUser.SetDeveloperData(dmdDV.qRawSmp.SQL.Text);
    iwrCreateNewSummaryRecords.Visible := false;
    iwrValuesIdentifiedList.Visible := false;
    iwbIdentifyMinMaxValues.Visible := false;
    iwbIdentifyPeaks.Visible := false;
    UserSession.Parameter2Chosen := UserSession.SampleValues[0];
    if (UserSession.UnitSender = usIndividualAgeHf) then
    begin
      iwrValuesIdentifiedList.Visible := true;
      iwbIdentifyMinMaxValues.Visible := true;
      iwbIdentifyPeaks.Visible := true;
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
      dmdDV.qExisting.ParamByName('IsotopeSystem').AsString := 'LuHf';
      dmdDV.cdsExisting.Open;
      iwrExistingRecords.Visible := true;
    end;
    if (UserSession.UnitSender = usMultipleAgeHf) then
    begin
      UserSession.Parameter2Chosen := 'Multiple Samples';
      iwrExistingRecords.Visible := false;
    end;
    iwlSampleNo.Caption := UserSession.Parameter2Chosen;
    iwbDownloadPDFcurves.Enabled := UserSession.CanExport;
    iwbDownloadData.Enabled := UserSession.CanModifyPlus;
    iwbCreateNewDMPeakRecords.Enabled := UserSession.CanInsert;
    iwbCreateNewHfInitialRecords.Enabled := UserSession.CanInsert;
    dmdDV.cdsPeaksFound.EmptyDataSet;
    dmdDV.cdsPDF.EmptyDataSet;
    dmdDV.cdsDataHf.Open;
    dmdDV.cdsDataHf.EmptyDataSet;
    CreateGraphs;
    GetSampleData;
    CalculatePDF('N');
    CalculatePDF('Y');
  end;
end;

procedure TISFAgeHf.CreateGraphs;
const
  zero = 0.0;
var
  i : integer;
  iMaxModelAge, iModelAgeIncrement, iLabelModelAgeIncrement : integer;
  tAge, tUR, tDM, tEpsDM : double;
  DC176Lu,
  UR176Lu177HfP, UR176Hf177HfP, UR176Hf177HfI,
  DM176Lu177HfP, DM176Hf177HfP, DM176Hf177HfI : double;
begin
  iMaxModelAge := 4500;
  iModelAgeIncrement := 20;
  iLabelModelAgeIncrement := 400;
  UR176Lu177HfP := 0.0336; //Bouvier et al (2008)
  UR176Hf177HfP := 0.282785; //Bouvier et al (2008)
  DC176Lu := 1.867e-11; //Scherer et al (2001) and soderlund et al (2004)
  DM176Lu177HfP := 0.0384; //Bouvier et al (2008)
  DM176Hf177HfP := 0.283250; //Bouvier et al (2008)
  ChartAgeHfInitial.Series[0].Clear;
  ChartAgeHfInitial.Series[1].Clear;
  ChartAgeHfInitial.Series[2].Clear;
  ChartAgeHfInitial.Series[3].Clear;
  ChartAgeHfEpsilon.Series[0].Clear;
  ChartAgeHfEpsilon.Series[1].Clear;
  ChartAgeHfEpsilon.Series[2].Clear;
  ChartAgeHfEpsilon.Series[3].Clear;
  ChartAgeHfModelInitial.Series[0].Clear;
  ChartAgeHfModelInitial.Series[1].Clear;
  ChartAgeHfModelInitial.Series[2].Clear;
  ChartAgeHfModelInitial.Series[3].Clear;
  i := 0;
  repeat
    tAge := 1.0e6*i;
    tUR := UR176Hf177HfP - UR176Lu177HfP*(exp(tAge*DC176Lu)-1.0);
    tDM := DM176Hf177HfP - DM176Lu177HfP*(exp(tAge*DC176Lu)-1.0);
    tEpsDM := 10000.0*(tDM/tUR - 1.0);
    tAge := 1.0*i;
    ChartAgeHfInitial.Series[0].AddXY(tAge,tDM);
    ChartAgeHfEpsilon.Series[0].AddXY(tAge,tEpsDM);
    ChartAgeHfModelInitial.Series[0].AddXY(tAge,tDM);
    if ((i mod iLabelModelAgeIncrement) = 0) then
    begin
      ChartAgeHfInitial.Series[1].AddXY(tAge,tDM);
      ChartAgeHfEpsilon.Series[1].AddXY(tAge,tEpsDM);
      ChartAgeHfModelInitial.Series[1].AddXY(tAge,tDM);
    end;
    i := i + iModelAgeIncrement;
  until (i >= iMaxModelAge);
end;

procedure TISFAgeHf.PopulateGraphs;
var
  iCode : integer;
  i : integer;
  tAge, tInitialRatio, tEpsilon, tModelInitialRatio,
  td18O, tDM : double;
  tIncludeYN : string;
  tConcordance,
  ConcordanceFrom, ConcordanceTo : double;
begin
  Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  dmdDV.cdsDataHf.First;
  ChartAgeHfInitial.Series[2].Clear;
  ChartAgeHfInitial.Series[3].Clear;
  ChartAgeHfEpsilon.Series[2].Clear;
  ChartAgeHfEpsilon.Series[3].Clear;
  ChartAgeHfModelInitial.Series[2].Clear;
  ChartAgeHfModelInitial.Series[3].Clear;
  i := 0;
  repeat
    tIncludeYN := dmdDV.cdsDataHfIncludeYN.AsString;
    tConcordance := dmdDV.cdsDataHfPercentConcordance.AsFloat;
    if ((tConcordance >= ConcordanceFrom) and (tConcordance <= ConcordanceTo))
      then tIncludeYN := 'Y'
      else tIncludeYN := 'N';
    dmdDV.cdsDataHf.Edit;
    dmdDV.cdsDataHfIncludeYN.AsString := tIncludeYN;
    dmdDV.cdsDataHf.Post;
    tAge := dmdDV.cdsDataHfPreferredAge.AsFloat;
    tInitialRatio := dmdDV.cdsDataHfInitialRatio.AsFloat;
    td18O := dmdDV.cdsDataHfDelta18O.AsFloat;
    tEpsilon := dmdDV.cdsDataHfEpsilon.AsFloat;
    tModelInitialRatio := dmdDV.cdsDataHfYmodeli.AsFloat;
    if (tIncludeYN = 'Y') then
    begin
      if ((tAge > 0.0) and (tInitialRatio > 0)) then
      begin
        ChartAgeHfInitial.Series[2].AddXY(tAge,tInitialRatio);
        ChartAgeHfModelInitial.Series[2].AddXY(tAge,tModelInitialRatio);
      end;
      if ((tAge > 0.0) and (tEpsilon <> 0.0)) then
      begin
        ChartAgeHfEpsilon.Series[2].AddXY(tAge,tEpsilon);
      end;
    end else
    begin
      if ((tAge > 0.0) and (tInitialRatio > 0)) then
      begin
        ChartAgeHfInitial.Series[3].AddXY(tAge,tInitialRatio);
        ChartAgeHfModelInitial.Series[3].AddXY(tAge,tModelInitialRatio);
      end;
      if ((tAge > 0.0) and (tEpsilon <> 0.0)) then
      begin
        ChartAgeHfEpsilon.Series[3].AddXY(tAge,tEpsilon);
      end;
    end;
    dmdDV.cdsDataHf.Next;
  until dmdDV.cdsDataHf.Eof;
  dmdDV.cdsDataHf.First;
end;

procedure TISFAgeHf.GetSampleData;
const
  zero = 0.0;
  EpsTolerance = 0.01;
  AgeTolerance = 0.10;
var
  iCnt, iCntIncluded : integer;
  tIncludeYN : string;
  iCode : integer;
  tAge, tAgeMin, tAgeMax : double;
  tInitialRatio : double;
  tConcordance,
  ConcordanceFrom, ConcordanceTo : double;
  iErrTypX, iErrTypY, iErrTypZ : integer;
  tErrValX, tDataValX,
  tErrValY, tDataValY,
  tErrValZ, tDataValZ : double;
  tDM, tDMerr : double;
  tUR, tEps : double;
  tAgeMinusDM : double;
  DC176Lu,
  UR176Lu177HfP, UR176Hf177HfP, UR176Hf177HfI,
  DM176Lu177HfP, DM176Hf177HfP, DM176Hf177HfI : double;
  Ymodeli : double;
begin
  //dmUser.SetDeveloperData('Starting GetSampleData');
  UR176Lu177HfP := 0.0336; //Bouvier et al (2008)
  UR176Hf177HfP := 0.282785; //Bouvier et al (2008)
  DC176Lu := 1.867e-11; //Scherer et al (2001) and soderlund et al (2004)
  DM176Lu177HfP := 0.0384; //Bouvier et al (2008)
  DM176Hf177HfP := 0.283250; //Bouvier et al (2008)
  tAgeMin := 0.0;
  tAgeMax := 4500.0;
  if UserSession.IncludeDateFromValue then Val(UserSession.DateFromField,tAgeMin,iCode);
  if UserSession.IncludeDateToValue then Val(UserSession.DateToField,tAgeMax,iCode);
  tIncludeYN := 'Y';
  iCnt := 0;
  iCntIncluded := 0;
  Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  dmdDV.ConstructRawDataSampleQuery;
  dmdDV.qRawSmp.Close;
  dmdDV.cdsRawSmp.Close;
  //dmdDV.qRawSmp.ParamByName('SampleNo').AsString := UserSession.Parameter2Chosen;
  dmdDV.qRawSmp.ParamByName('IsotopeSystem').AsString := 'LuHf';
  dmdDV.cdsRawSmp.Open;
  iwlSourceShort.Visible := false;
  iwlSource.Visible := false;
  iweLongitude.Text := '';
  iweLatitude.Text := '';
  iweElevation.Text := '';
  if (UserSession.UnitSender = usIndividualAgeHf) then
  begin
    UserSession.NewContinentID := dmdDV.cdsRawSmpLocCONTINENTID.AsString;
    UserSession.NewAreaID := dmdDV.cdsRawSmpLocCOUNTRYABR.AsString;
    UserSession.NewReferenceID := dmdDV.cdsRawRefREFNUM.AsString;
    iweLongitude.Text := FormatFloat('###0.00000',dmdDV.cdsRawSmpLocLONGITUDE.AsFloat);
    iweLatitude.Text := FormatFloat('###0.00000',dmdDV.cdsRawSmpLocLATITUDE.AsFloat);
    iweElevation.Text := FormatFloat('####0.000',dmdDV.cdsRawSmpLocELEVATION.AsFloat);
    iwlSourceShort.Caption := dmdDV.cdsRawRefSOURCESHORT.AsString;
    iwlSourceShort.Visible := true;
    iwlSource.Visible := true;
  end;
  //dmUser.SetDeveloperData('GetSampleData 1');
  dmdDV.cdsDataHf.Open;
  dmdDV.cdsDataHf.EmptyDataSet;
  dmdDV.cdsRawSmp.First;
  repeat
    tAge := dmdDV.cdsRawAgePrefDATAVALUE.AsFloat;
    tInitialRatio := dmdDV.cdsRawNormalisedValueYNORMALISEDVALUE.AsFloat;
    //dmUser.SetDeveloperData('AgeHf check '+IntToStr(iCnt)+' '+FormatFloat('####0.000',tAge)+'  '+FormatFloat('####0.00000',tInitialRatio));
    if ((tAge >= tAgeMin) and (tAge < tAgeMax) and (tInitialRatio > 0.0)) then
    begin
      tConcordance := 100.0 - dmdDV.cdsRawDiscordanceDATAVALUE.AsFloat;
      if ((tConcordance >= ConcordanceFrom) and (tConcordance <= ConcordanceTo)) then tIncludeYN := 'Y'
                                                                                 else tIncludeYN := 'N';
      //iErrTypX := Trunc(dmdDV.cdsRawErrTypeXDATAVALUE.AsFloat);
      iErrTypX := 0;
      tErrValX := dmdDV.cdsRawDataXerrDATAVALUE.AsFloat;
      tDataValX := dmdDV.cdsRawNormalisedValueXNORMALISEDVALUE.AsFloat;
      //iErrTypY := Trunc(dmdDV.cdsRawErrTypeYDATAVALUE.AsFloat);
      iErrTypY := 0;
      tErrValY := dmdDV.cdsRawDataYerrDATAVALUE.AsFloat;
      tDataValY := dmdDV.cdsRawNormalisedValueYNORMALISEDVALUE.AsFloat;
      //iErrTypZ := Trunc(dmdDV.cdsRawErrTypeZDATAVALUE.AsFloat);
      iErrTypZ := 0;
      tErrValZ := dmdDV.cdsRawDataZerrDATAVALUE.AsFloat;
      tUR := UR176Hf177HfP - UR176Lu177HfP*(exp(tAge*1.0e6*DC176Lu)-1.0);
      tEps := 10000.0*(tDataValY/tUR - 1.0);
      tDM := DM176Hf177HfP - DM176Lu177HfP*(exp(tAge*DC176Lu)-1.0);
      tDataValZ := dmdDV.cdsRawNormalisedValueZNORMALISEDVALUE.AsFloat;
      if (Abs(tEps - tDataValZ) > EpsTolerance) then
      begin
        tDataValZ := tEps;
      end;
      if (iErrTypX = 1) then tErrValX := tErrValX*tDataValX/100.0;
      if (iErrTypY = 1) then tErrValY := tErrValY*tDataValY/100.0;
      if (iErrTypZ = 1) then tErrValZ := tErrValZ*tDataValZ/100.0;
      tDM := dmdDV.cdsRawDataDMDATAVALUE.AsFloat;
      tDMerr := dmdDV.cdsRawDataDMerrDATAVALUE.AsFloat;
      tAgeMinusDM := tAge - tDM;
      Ymodeli := (tDataValY - tDataValX/DM176Lu177HfP*DM176Hf177HfP)/(1.0+tDataValX/DM176Lu177HfP);
      try
        dmdDV.cdsDataHf.Append;
        dmdDV.cdsDataHfSampleNo.AsString := dmdDV.cdsRawSmpSAMPLENO.AsString;
        dmdDV.cdsDataHfFrac.AsString := dmdDV.cdsRawSmpFRAC.AsString;
        dmdDV.cdsDataHfDelta18O.AsFloat := tDataValX;
        dmdDV.cdsDataHfDelta18OSigma.AsFloat := tErrValX;
        dmdDV.cdsDataHfInitialRatio.AsFloat := tDataValY;
        dmdDV.cdsDataHfInitialRatioSIgma.AsFloat := tErrValY;
        dmdDV.cdsDataHfEpsilon.AsFloat := tDataValZ;
        dmdDV.cdsDataHfEpsilonSigma.AsFloat := tErrValZ;
        dmdDV.cdsDataHfIncludeYN.AsString := tIncludeYN;
        dmdDV.cdsDataHfPercentConcordance.AsFloat := tConcordance;
        dmdDV.cdsDataHfPreferredAge.AsFloat := dmdDV.cdsRawAgePrefDATAVALUE.AsFloat;
        dmdDV.cdsDataHfPreferredAgeSigma.AsFloat := dmdDV.cdsRawDataAgeerrDATAVALUE.AsFloat;
        dmdDV.cdsDataHfTDM.AsFloat := tDM;
        dmdDV.cdsDataHfTDMSigma.AsFloat := tDMerr;
        dmdDV.cdsDataHfYmodeli.AsFloat := Ymodeli;
        dmdDV.cdsDataHf.Post;
      except
      end;
      if (tIncludeYN = 'Y') then iCntIncluded := iCntIncluded + 1;
      //dmUser.SetDeveloperData('AgeHf '+IntToStr(iCnt)+' '+tIncludeYN+'  '+FormatFloat('####0.000',dmdDV.cdsDataHfPreferredAge.AsFloat)+'  '+FormatFloat('####0.00000',tDataValY)+'  '+FormatFloat('##0.000',tConcordance));
      iCnt := iCnt + 1;
    end;
    dmdDV.cdsRawSmp.Next;
  until dmdDV.cdsRawSmp.Eof;
  dmdDV.cdsDataHf.First;
  dmdDV.cdsRawSmp.Close;
  iwlCount.Caption := IntToStr(iCntIncluded)+' of '+IntToStr(iCnt)+' analyses match the criteria for concordance';
  PopulateGraphs;
end;

procedure TISFAgeHf.iwbCalculatePDFClick(Sender: TObject);
begin
  CalculatePDF('N');
  CalculatePDF('Y');
end;

procedure TISFAgeHf.iwbCreateNewHfInitialRecordsClick(Sender: TObject);
begin
  UserSession.UnitSender := 'usIndividualAgeHfI';
  if (dmdDV.cdsInitials.RecordCount > 0) then
  begin
    UserSession.UnitStartFrom := iweUnitFrom.Text;
    UserSession.UnitEndWith := iweUnitTo.Text;
    UserSession.ReferenceStartFrom := iweReferenceFrom.Text;
    UserSession.ReferenceEndWith := iweReferenceTo.Text;
    UserSession.ProvinceStartFrom := iweProvinceFrom.Text;
    UserSession.ProvinceEndWith := iweProvinceTo.Text;
    UserSession.TerraneStartFrom := iweTerraneFrom.Text;
    UserSession.TerraneEndWith := iweTerraneTo.Text;
    UserSession.NewMaterialID := 'zr';
    UserSession.NewIsotopeSystemID := 'LuHf';
    UserSession.NewApproachID := 'MdlRa';
    UserSession.NewTechniqueID := 'SICL';
    UserSession.NewInterpretationID := 'MdlR0';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFNewRawRecord.Create(WebApplication).Show;
  end;
end;

procedure TISFAgeHf.iwbCreateNewDMPeakRecordsClick(Sender: TObject);
begin
  UserSession.UnitSender := 'usIndividualAgeHfP';
  if (dmdDV.cdsPeaksFound.RecordCount > 0) then
  begin
    UserSession.UnitStartFrom := iweUnitFrom.Text;
    UserSession.UnitEndWith := iweUnitTo.Text;
    UserSession.ReferenceStartFrom := iweReferenceFrom.Text;
    UserSession.ReferenceEndWith := iweReferenceTo.Text;
    UserSession.ProvinceStartFrom := iweProvinceFrom.Text;
    UserSession.ProvinceEndWith := iweProvinceTo.Text;
    UserSession.TerraneStartFrom := iweTerraneFrom.Text;
    UserSession.TerraneEndWith := iweTerraneTo.Text;
    UserSession.NewMaterialID := 'zr';
    UserSession.NewIsotopeSystemID := 'LuHf';
    UserSession.NewApproachID := 'DM';
    UserSession.NewTechniqueID := 'SICL';
    UserSession.NewInterpretationID := 'CrsRs';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFNewRawRecord.Create(WebApplication).Show;
  end;
end;


procedure TISFAgeHf.iwbDownloadDataClick(Sender: TObject);
var
  MemStream: TMemoryStream;
begin
  dmdDV.cdsDataHf.First;
  dmdDV.ReportDataHf.Template := DefaultFlexCellFolder+'FlxRawDataHf.xls';
  MemStream:=TMemoryStream.Create;
  try
    dmdDV.ReportDataHf.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','Raw Data for samples.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
  end; //finally
end;

procedure TISFAgeHf.iwbDownloadPDFcurvesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
begin
  FlxMemTable1.Open;
  dmdDV.cdsPDF.First;
  repeat
    FlxMemTable1.AddRecord([dmdDV.cdsPDFStep.AsVariant,dmdDV.cdsPDFPDFDataValue.AsVariant,
          dmdDV.cdsPDFPDFValue.AsVariant]);
    dmdDV.cdsPDF.Next;
  until dmdDV.cdsPDF.Eof;
  FlxMemTable1.First;
  ReportPDF.Template := DefaultFlexCellFolder+'FlxRawPDF.xls';
  MemStream:=TMemoryStream.Create;
  try
    ReportPDF.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','Raw Data PDF for sample.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
  end; //finally
end;

procedure TISFAgeHf.iwbIdentifyPeaksClick(Sender: TObject);
var
  i, j, k, l : integer;
  X1, X2, Y2 : double;
  tempstep : integer;
  tempmax, tempmaxage : double;
  iCode : integer;
  FromAge, ToAge : double;
begin
  ChartPDF.Series[2].Clear;
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
  dmdDV.cdsPeaksFound.Open;
  dmdDV.cdsPeaksFound.EmptyDataSet;
  dmdDV.cdsPeaksFound.Append;
  dmdDV.cdsPeaksFoundi.AsInteger := tempstep;
  dmdDV.cdsPeaksFoundAge.AsFloat := tempmaxage;
  dmdDV.cdsPeaksFoundAgePlus95.AsFloat := 20.0;
  dmdDV.cdsPeaksFoundAgeMinus95.AsFloat := 20.0;
  dmdDV.cdsPeaksFoundProbability.AsFloat := tempmax;
  dmdDV.cdsPeaksFound.Post;
  ChartPDF.Series[2].AddXY(tempmaxage,tempmax);
end;

procedure TISFAgeHf.iwbIdentifyMinMaxValuesClick(Sender: TObject);
var
  i, j, k, l : integer;
  X1, X2, Y2 : double;
  tempstep : integer;
  tSample, tFrac : string;
  tempage, tempageplus, tempageminus : double;
  tempminsample, tempminfrac,
  tempmaxsample, tempmaxfrac : string;
  tempmax, tempmaxage, tempmaxageplus, tempmaxageminus,
  tempmin, tempminage, tempminageplus, tempminageminus,
  tinitial, tepsilon, tmodelinitial,
  tinitialerror, tepsilonerror,
  tempmaxinitial, tempmaxepsilon, tempmaxmodelinitial,
  tempmaxinitialerror, tempmaxepsilonerror,
  tempmininitial, tempminepsilon, tempminmodelinitial,
  tempmininitialerror, tempminepsilonerror   : double;
  iCode : integer;
  FromAge, ToAge : double;
begin
  dmdDV.cdsDataHf.First;
  while (dmdDV.cdsDataHfIncludeYN.AsString <> 'Y') do
  begin
    dmdDV.cdsDataHf.Next;
  end;
  // need to add ages, age errors, initial errors
  tempmininitial := dmdDV.cdsDataHfInitialRatio.AsFloat;
  tempmaxinitial := dmdDV.cdsDataHfInitialRatio.AsFloat;
  tempminmodelinitial := dmdDV.cdsDataHfYmodeli.AsFloat;
  tempmaxmodelinitial := dmdDV.cdsDataHfYmodeli.AsFloat;
  tempminepsilon := dmdDV.cdsDataHfEpsilon.AsFloat;
  tempmaxepsilon := dmdDV.cdsDataHfEpsilon.AsFloat;
  tempmaxage := dmdDV.cdsDataHfPreferredAge.AsFloat;
  tempmaxageplus := dmdDV.cdsDataHfPreferredAgeSigma.AsFloat;
  tempmaxageminus := dmdDV.cdsDataHfPreferredAgeSigma.AsFloat;
  tempmininitialerror := dmdDV.cdsDataHfInitialRatioSigma.AsFloat;
  tempmaxinitialerror := dmdDV.cdsDataHfInitialRatioSigma.AsFloat;
  tempminepsilonerror := dmdDV.cdsDataHfEpsilonSigma.AsFloat;
  tempmaxepsilonerror := dmdDV.cdsDataHfEpsilonSigma.AsFloat;
  tSample := dmdDV.cdsDataHfSampleNo.AsString;
  tFrac := dmdDV.cdsDataHfFrac.AsString;
  tempminsample := tsample;
  tempminfrac := tfrac;
  tempmaxsample := tsample;
  tempmaxfrac := tfrac;
  dmdDV.cdsDataHf.First;
  repeat
    if (dmdDV.cdsDataHfIncludeYN.AsString = 'Y') then
    begin
      tSample := dmdDV.cdsDataHfSampleNo.AsString;
      tFrac := dmdDV.cdsDataHfFrac.AsString;
      tinitial := dmdDV.cdsDataHfInitialRatio.AsFloat;
      tmodelinitial := dmdDV.cdsDataHfYmodeli.AsFloat;
      tepsilon := dmdDV.cdsDataHfEpsilon.AsFloat;
      tempage := dmdDV.cdsDataHfPreferredAge.AsFloat;
      tempageplus := dmdDV.cdsDataHfPreferredAgeSigma.AsFloat;
      tempageminus := dmdDV.cdsDataHfPreferredAgeSigma.AsFloat;
      tinitialerror := dmdDV.cdsDataHfInitialRatioSIgma.AsFloat;
      tepsilonerror := dmdDV.cdsDataHfEpsilonSigma.AsFloat;
      if (tinitial < tempmininitial) then
      begin
        tempmininitial := tinitial;
        tempminepsilon := tepsilon;
        tempmininitialerror := tinitialerror;
        tempminepsilonerror := tepsilonerror;
        tempminsample := tsample;
        tempminfrac := tfrac;
        tempminage := tempage;
        tempminageplus := tempageplus;
        tempminageminus := tempageminus;
      end;
      if (tinitial > tempmaxinitial) then
      begin
        tempmaxinitial := tinitial;
        tempmaxepsilon := tepsilon;
        tempmaxinitialerror := tinitialerror;
        tempmaxepsilonerror := tepsilonerror;
        tempmaxsample := tsample;
        tempmaxfrac := tfrac;
        tempmaxage := tempage;
        tempmaxageplus := tempageplus;
        tempmaxageminus := tempageminus;
      end;
    end;
    dmdDV.cdsDataHf.Next;
  until dmdDV.cdsDataHf.Eof;
  dmdDV.cdsInitials.Open;
  dmdDV.cdsInitials.EmptyDataSet;
  dmdDV.cdsInitials.Append;
  dmdDV.cdsInitialsi.AsInteger := 1;
  dmdDV.cdsInitialsSampleNo.AsString := tempminSample;
  dmdDV.cdsInitialsFrac.AsString := tempminFrac;
  dmdDV.cdsInitialsAge.AsFloat := tempminage;
  dmdDV.cdsInitialsAgePlus95.AsFloat := tempminageplus*1.96;
  dmdDV.cdsInitialsAgeMinus95.AsFloat := tempminageminus*1.96;
  dmdDV.cdsInitialsInitial.AsFloat := tempmininitial;
  dmdDV.cdsInitialsEpsilon.AsFloat := tempminepsilon;
  dmdDV.cdsInitialsInitialError.AsFloat := tempmininitialerror*1.96;
  dmdDV.cdsInitialsEpsilonError.AsFloat := tempminepsilonerror*1.96;
  dmdDV.cdsInitialsYmodeli.AsFloat := tempminmodelinitial;
  dmdDV.cdsInitials.Post;
  dmdDV.cdsInitials.Append;
  dmdDV.cdsInitialsi.AsInteger := 2;
  dmdDV.cdsInitialsSampleNo.AsString := tempmaxSample;
  dmdDV.cdsInitialsFrac.AsString := tempmaxFrac;
  dmdDV.cdsInitialsAge.AsFloat := tempmaxage;
  dmdDV.cdsInitialsAgePlus95.AsFloat := tempmaxageplus*1.96;
  dmdDV.cdsInitialsAgeMinus95.AsFloat := tempmaxageminus*1.96;
  dmdDV.cdsInitialsInitial.AsFloat := tempmaxinitial;
  dmdDV.cdsInitialsEpsilon.AsFloat := tempmaxepsilon;
  dmdDV.cdsInitialsInitialError.AsFloat := tempmaxinitialerror*1.96;
  dmdDV.cdsInitialsEpsilonError.AsFloat := tempmaxepsilonerror*1.96;
  dmdDV.cdsInitialsYmodeli.AsFloat := tempmaxmodelinitial;
  dmdDV.cdsInitials.Post;
end;

procedure TISFAgeHf.iwbRecalculateClick(Sender: TObject);
const
  zero = 0.0;
  EpsTolerance = 0.01;
  AgeTolerance = 0.10;
var
  i, iCode : integer;
  iMaxModelAge, iModelAgeIncrement, iLabelModelAgeIncrement : integer;
  tAge, tUR, tEpsDM : double;
  DC176Lu,
  UR176Lu177HfP, UR176Hf177HfP, UR176Hf177HfI,
  DM176Lu177HfP, DM176Hf177HfP, DM176Hf177HfI : double;
  iCnt, iCntIncluded : integer;
  tIncludeYN : string;
  tAgeMin, tAgeMax : double;
  tInitialRatio : double;
  tConcordance,
  ConcordanceFrom, ConcordanceTo : double;
  iErrTypX, iErrTypY, iErrTypZ : integer;
  tErrValX, tDataValX,
  tErrValY, tDataValY,
  tErrValZ, tDataValZ : double;
  tDM, tDMerr : double;
begin
  iMaxModelAge := 4500;
  iModelAgeIncrement := 20;
  iLabelModelAgeIncrement := 400;
  UR176Lu177HfP := 0.0336; //Bouvier et al (2008)
  UR176Hf177HfP := 0.282785; //Bouvier et al (2008)
  DC176Lu := 1.867e-11; //Scherer et al (2001) and soderlund et al (2004)
  DM176Lu177HfP := 0.0384; //Bouvier et al (2008)
  DM176Hf177HfP := 0.283250; //Bouvier et al (2008)
  ChartAgeHfInitial.Series[0].Clear;
  ChartAgeHfEpsilon.Series[0].Clear;
  i := 0;
  Val(iweGraphAgeTo.Text,tAge,iCode);
  if (iCode = 0) then iMaxModelAge := Trunc(tAge);
  Val(iweGraphAgeFrom.Text,tAge,iCode);
  if (iCode = 0) then i := Trunc(tAge);
  repeat
    tAge := 1.0e6*i;
    tUR := UR176Hf177HfP - UR176Lu177HfP*(exp(tAge*DC176Lu)-1.0);
    tDM := DM176Hf177HfP - DM176Lu177HfP*(exp(tAge*DC176Lu)-1.0);
    tEpsDM := 10000.0*(tDM/tUR - 1.0);
    tAge := 1.0*i;
    ChartAgeHfInitial.Series[0].AddXY(tAge,tDM);
    ChartAgeHfEpsilon.Series[0].AddXY(tAge,tEpsDM);
    if ((i mod iLabelModelAgeIncrement) = 0) then
    begin
      ChartAgeHfInitial.Series[1].AddXY(tAge,tDM);
      ChartAgeHfEpsilon.Series[1].AddXY(tAge,tEpsDM);
    end;
    i := i + iModelAgeIncrement;
  until (i >= iMaxModelAge);
  if UserSession.IncludeDateFromValue then Val(UserSession.DateFromField,tAgeMin,iCode);
  if UserSession.IncludeDateToValue then Val(UserSession.DateToField,tAgeMax,iCode);
  tIncludeYN := 'Y';
  iCnt := 0;
  iCntIncluded := 0;
  Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  //dmdDV.ConstructRawDataSampleQuery;
  dmdDV.cdsRecalcSmp.Close;
  dmdDV.qRecalcSmp.Close;
  dmdDV.qRecalcSmp.SQL.Clear;
  dmdDV.qRecalcSmp.SQL.Text := dmdDV.qRawSmp.SQL.Text;
  dmdDV.qRecalcSmp.ParamByName('IsotopeSystem').AsString := 'LuHf';
  dmdDV.cdsRecalcSmp.Open;
  dmdDV.cdsDataHf.Open;
  dmdDV.cdsDataHf.EmptyDataSet;
  dmdDV.cdsRecalcSmp.First;
  repeat
    tAge := dmdDV.cdsRecalcAgePrefDATAVALUE.AsFloat;
    tInitialRatio := dmdDV.cdsRecalcNormalisedYNORMALISEDVALUE.AsFloat;
    if ((tAge >= tAgeMin) and (tAge < tAgeMax) and (tInitialRatio > 0.0)) then
    begin
      tDataValY := dmdDV.cdsRecalcNormalisedYNORMALISEDVALUE.AsFloat;
      tDataValZ := dmdDV.cdsRecalcZDATAVALUE.AsFloat;
      //tDM := dmdDV.cdsRecalcDataDMDATAVALUE.AsFloat;
      tUR := UR176Hf177HfP - UR176Lu177HfP*(exp(tAge*1.0e6*DC176Lu)-1.0);
      tEpsDM := 10000.0*(tDataValY/tUR - 1.0);
      if (Abs(tEpsDM - tDataValZ) > EpsTolerance) then
      begin
        try
          dmdDV.cdsRecalcSmp.Edit;
          //dmdDV.cdsRecalcZ.Edit;
          dmdDV.cdsRecalcZDATAVALUE.AsFloat := tEpsDM;
          dmdDV.cdsRecalcZ.Post;
          //dmdDV.cdsRecalcZ.ApplyUpdates(1);
          dmdDV.cdsRecalcSmp.ApplyUpdates(1);
        except
        end;
      end;
    end;
    dmdDV.cdsRecalcSmp.Next;
  until dmdDV.cdsRecalcSmp.Eof;
  dmdDV.cdsDataHf.First;
  dmdDV.cdsRecalcSmp.Close;
  GetSampleData;
  PopulateGraphs;
end;

procedure TISFAgeHf.iwbRefreshClick(Sender: TObject);
var
  i, iCode : integer;
  tAge : double;
  FromAge, ToAge : double;
begin
  i := 0;
  Val(iweAgeTo.Text,ToAge,iCode);
  Val(iweAgeFrom.Text,FromAge,iCode);
  ChartPDF.BottomAxis.SetMinMax(FromAge,ToAge);
end;

procedure TISFAgeHf.iwbReplotModelsClick(Sender: TObject);
const
  zero = 0.0;
var
  i, iCode : integer;
  iMaxModelAge, iModelAgeIncrement, iLabelModelAgeIncrement : integer;
  tAge, tUR, tDM, tEpsDM : double;
  FromAge, ToAge : double;
  DC176Lu,
  UR176Lu177HfP, UR176Hf177HfP, UR176Hf177HfI,
  DM176Lu177HfP, DM176Hf177HfP, DM176Hf177HfI : double;
begin
  iMaxModelAge := 4500;
  iModelAgeIncrement := 20;
  iLabelModelAgeIncrement := 400;
  UR176Lu177HfP := 0.0336; //Bouvier et al (2008)
  UR176Hf177HfP := 0.282785; //Bouvier et al (2008)
  DC176Lu := 1.867e-11; //Scherer et al (2001) and soderlund et al (2004)
  DM176Lu177HfP := 0.0384; //Bouvier et al (2008)
  DM176Hf177HfP := 0.283250; //Bouvier et al (2008)
  ChartAgeHfInitial.Series[0].Clear;
  ChartAgeHfInitial.Series[1].Clear;
  ChartAgeHfEpsilon.Series[0].Clear;
  ChartAgeHfEpsilon.Series[1].Clear;
  i := 0;
  Val(iweGraphAgeTo.Text,ToAge,iCode);
  if (iCode = 0) then iMaxModelAge := Trunc(ToAge);
  Val(iweGraphAgeFrom.Text,FromAge,iCode);
  if (iCode = 0) then i := Trunc(FromAge);
  repeat
    tAge := 1.0e6*i;
    tUR := UR176Hf177HfP - UR176Lu177HfP*(exp(tAge*DC176Lu)-1.0);
    tDM := DM176Hf177HfP - DM176Lu177HfP*(exp(tAge*DC176Lu)-1.0);
    tEpsDM := 10000.0*(tDM/tUR - 1.0);
    tAge := 1.0*i;
    ChartAgeHfInitial.Series[0].AddXY(tAge,tUR);
    ChartAgeHfEpsilon.Series[0].AddXY(tAge,tEpsDM);
    if ((i mod iLabelModelAgeIncrement) = 0) then
    begin
      ChartAgeHfInitial.Series[1].AddXY(tAge,tUR);
      ChartAgeHfEpsilon.Series[1].AddXY(tAge,tEpsDM);
    end;
    i := i + iModelAgeIncrement;
  until (i >= iMaxModelAge);
end;

procedure TISFAgeHf.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFAgeHf.iwbReturnToSampleListClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDefineRawDataSampleQuery.Create(WebApplication).Show;
end;

procedure TISFAgeHf.iwbScaleAxesClick(Sender: TObject);
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
  ChartAgeHfInitial.BottomAxis.SetMinMax(t75Min,t75Max);
  ChartAgeHfInitial.LeftAxis.SetMinMax(t68Min,t68Max);
  ChartAgeHfEpsilon.BottomAxis.SetMinMax(t86Min,t86Max);
  ChartAgeHfEpsilon.LeftAxis.SetMinMax(t76Min,t76Max);
  ChartAgeHfModelInitial.BottomAxis.SetMinMax(t75Min,t75Max);
  ChartAgeHfModelInitial.LeftAxis.SetMinMax(t68Min,t68Max);
  iwcbConcordiaAutoscale.Checked := false;
end;

procedure TISFAgeHf.iwbTransferToPeakClick(Sender: TObject);
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

procedure TISFAgeHf.iwcbAutoscaleClick(Sender: TObject);
begin
  if not iwcbConcordiaAutoscale.checked then
  begin
    ChartAgeHfInitial.BottomAxis.Automatic := true;
    ChartAgeHfInitial.LeftAxis.Automatic := true;
    ChartAgeHfEpsilon.BottomAxis.Automatic := true;
    ChartAgeHfEpsilon.LeftAxis.Automatic := true;
 end;
end;

procedure TISFAgeHf.iwcbIncludedExcludedClick(Sender: TObject);
begin
  if iwcbIncluded.Checked then
  begin
    ChartAgeHfInitial.Series[2].ShowInLegend := true;
    ChartAgeHfInitial.Series[2].Visible := true;
    ChartAgeHfEpsilon.Series[2].ShowInLegend := true;
    ChartAgeHfEpsilon.Series[2].Visible := true;
    ChartAgeHfModelInitial.Series[2].ShowInLegend := true;
    ChartAgeHfModelInitial.Series[2].Visible := true;
  end else
  begin
    ChartAgeHfInitial.Series[2].ShowInLegend := false;
    ChartAgeHfInitial.Series[2].Visible := false;
    ChartAgeHfEpsilon.Series[2].ShowInLegend := false;
    ChartAgeHfEpsilon.Series[2].Visible := false;
    ChartAgeHfModelInitial.Series[2].ShowInLegend := false;
    ChartAgeHfModelInitial.Series[2].Visible := false;
  end;
  if iwcbExcluded.Checked then
  begin
    ChartAgeHfInitial.Series[3].ShowInLegend := true;
    ChartAgeHfInitial.Series[3].Visible := true;
    ChartAgeHfEpsilon.Series[3].ShowInLegend := true;
    ChartAgeHfEpsilon.Series[3].Visible := true;
    ChartAgeHfModelInitial.Series[3].ShowInLegend := true;
    ChartAgeHfModelInitial.Series[3].Visible := true;
  end else
  begin
    ChartAgeHfInitial.Series[3].ShowInLegend := false;
    ChartAgeHfInitial.Series[3].Visible := false;
    ChartAgeHfEpsilon.Series[3].ShowInLegend := false;
    ChartAgeHfEpsilon.Series[3].Visible := false;
    ChartAgeHfModelInitial.Series[3].ShowInLegend := false;
    ChartAgeHfModelInitial.Series[3].Visible := false;
  end;
end;

procedure TISFAgeHf.iwDBgDataColumns0TitleClick(Sender: TObject);
begin
  dmdDV.cdsDataHf.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;

procedure TISFAgeHf.iwDBgPeaksColumns0TitleClick(Sender: TObject);
begin
  dmdDV.cdsPeaksFound.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;


procedure TISFAgeHf.iwDBgSummaryValuesColumns0TitleClick(Sender: TObject);
begin
  dmdDV.cdsInitials.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;

procedure TISFAgeHf.CalculatePDF(ShowConcordantOnly : string);
const
  Steps = 2500;
var
  i, j, k, l : integer;
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
  tmpBinWidth, tmpBinCentre : double;
  FromAge, ToAge : double;
  PDFtype : string;
begin
  Val(iweAgeFrom.Text,FromAge,iCode);
  Val(iweAgeTo.Text,ToAge,iCode);
  Val(iweMinimumUncertainty.Text,MinimumUncertainty,iCode);
  ChartPDF.BottomAxis.SetMinMax(FromAge,ToAge);
  if (iwrgAndOr.ItemIndex = 0) then PDFtype := 'AND';
  if (iwrgAndOr.ItemIndex = 1) then PDFtype := 'OR';
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
  dmdDV.cdsDataHf.First;
  repeat
    if (ShowConcordantOnly = 'Y') then
    begin
      if ((dmdDV.cdsDataHfIncludeYN.AsString = 'Y')) then
      begin
        tx := dmdDV.cdsDataHfTDM.AsFloat;
        tx1 := dmdDV.cdsDataHfTDMSigma.AsFloat;
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
      tx := dmdDV.cdsDataHfTDM.AsFloat;
      tx1 := dmdDV.cdsDataHfTDMSigma.AsFloat;
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
    dmdDV.cdsDataHf.Next;
  until dmdDV.cdsDataHf.EOF;
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
  dmdDV.cdsDataHf.First;
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

function TISFAgeHf.Gauss (Ratio, Mean, Dev : double) : double;
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
