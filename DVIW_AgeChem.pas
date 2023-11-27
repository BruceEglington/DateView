unit DVIW_AgeChem;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, DVIW_frTopBar, IWHTMLControls,DB,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  DVIW_framemenu, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, VCLTee.TeEngine, ExtCtrls, VCLTee.TeeProcs, Chart,
  IWCompTeeChart, IWCompEdit, Series, VCLTee.TeeErrorPoint, IWCompCheckbox, IWCompText,
  DVIW_dmdata, IWCompExtCtrls, VclTee.TeeGDIPlus, IWCompListbox;

type
  TISFAgeChem = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwrPage: TIWRegion;
    iwrButtonsTop: TIWRegion;
    iwrSampleDetails: TIWRegion;
    iwlSampleNoHeading: TIWLabel;
    iwlSampleNo: TIWLabel;
    iwrLeft: TIWRegion;
    iwrModelPlots: TIWRegion;
    iwrAgeVar1: TIWRegion;
    iwrAgeVar2: TIWRegion;
    iwChartHfInitial: TIWChart;
    iwIWChartHfEpsilon: TIWChart;
    iwrGraphSplit12: TIWRegion;
    ChartAge1: TChart;
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
    ChartAge2: TChart;
    iwbReturnToSampleList: TIWButton;
    iwbReturn: TIWButton;
    Series7: TLineSeries;
    Series8: TPointSeries;
    Series9: TPointSeries;
    Series10: TPointSeries;
    iwrGraphOptions: TIWRegion;
    IWLabel1: TIWLabel;
    iwrBottomButtons: TIWRegion;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    iwlSourceShortHeading: TIWLabel;
    iwlSourceShort: TIWLabel;
    iwlLongitude: TIWLabel;
    iwlLatitude: TIWLabel;
    iwlElevation: TIWLabel;
    iwlElevationUnits: TIWLabel;
    iwlCount: TIWLabel;
    iweLongitude: TIWEdit;
    iweLatitude: TIWEdit;
    iweElevation: TIWEdit;
    iwe75Min: TIWEdit;
    IWLabel25: TIWLabel;
    iwe75Max: TIWEdit;
    iwe68Min: TIWEdit;
    iwlVar1: TIWLabel;
    iwe68Max: TIWEdit;
    iwe86Min: TIWEdit;
    IWLabel27: TIWLabel;
    iwe86Max: TIWEdit;
    iwe76Max: TIWEdit;
    iwlVar2: TIWLabel;
    iwe76Min: TIWEdit;
    iwbScaleConcordiaAxes: TIWButton;
    iwcbGraphsAutoscale: TIWCheckBox;
    iweConcordanceFrom: TIWEdit;
    IWLabel5: TIWLabel;
    iweConcordanceTo: TIWEdit;
    iwbDownloadData: TIWButton;
    iwcbExcluded: TIWCheckBox;
    iwcbIncluded: TIWCheckBox;
    iwrGraphSplit23: TIWRegion;
    iwrAgeVar3: TIWRegion;
    IWChartHfModelInitial: TIWChart;
    ChartAge3: TChart;
    LineSeries1: TLineSeries;
    PointSeries1: TPointSeries;
    PointSeries2: TPointSeries;
    PointSeries3: TPointSeries;
    IWEdit3: TIWEdit;
    IWLabel32: TIWLabel;
    IWEdit4: TIWEdit;
    IWEdit5: TIWEdit;
    iwlVar3: TIWLabel;
    IWEdit6: TIWEdit;
    iwbIncludeExcludeData: TIWButton;
    iwlCountryAbr: TIWLabel;
    iwlContinentID: TIWLabel;
    IWLabel2: TIWLabel;
    iweLithology: TIWEdit;
    iweLithClass: TIWEdit;
    iwcbIncludeSampleZones: TIWCheckBox;
    iwlSampleZones: TIWListbox;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnToSampleListClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwDBgDataColumns0TitleClick(Sender: TObject);
    procedure iwcbIncludedExcludedClick(Sender: TObject);
    procedure iwbScaleAxesClick(Sender: TObject);
    procedure iwcbAutoscaleClick(Sender: TObject);
    procedure iwbDownloadDataClick(Sender: TObject);
    procedure iwbIncludeExcludeDataClick(Sender: TObject);
    procedure iwDBgDataColumns0Click(ASender: TObject; const AValue: string);
  public
    procedure CreateGraphs;
    procedure PopulateGraphs;
    procedure GetSampleData;
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_constants,
  usrIW_dm, DVIW_definerawdatasamplequery,
  math,
  DVIW_uMain, DVIW_newrawrecord, DB_List_Combo;

procedure TISFAgeChem.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if UserSession.CanInsert then
    begin
    end else
    begin
    end;
  end;
end;

procedure TISFAgeChem.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
begin
  if UserSession.LoggedIn then
  begin
    iwcbIncludeSampleZones.Checked := UserSession.IncludeSampleZoneValues;
    UpdateListBoxValues(iwlSampleZones,dmDV.cdsSampleZones,'ZoneType','ZoneID',UserSession.SampleZoneValues);
    dmdDV.cdsData.EmptyDataSet;
    dmdDV.cdsDataChem.EmptyDataSet;
    dmdDV.ConstructRawDataSampleQuery;
    //dmUser.SetDeveloperData('TISFAgeChem qRawSmp construct');
    //dmUser.SetDeveloperData(dmdDV.qRawSmp.SQL.Text);
    iwrValuesIdentifiedList.Visible := false;
    iwbIdentifyMinMaxValues.Visible := false;
    UserSession.Parameter2Chosen := UserSession.SampleValues[0];
    {
    if (UserSession.UnitSender = usIndividualAgeChem) then
    begin
      iwrValuesIdentifiedList.Visible := true;
      iwbIdentifyMinMaxValues.Visible := true;
      UserSession.Parameter2Chosen := UserSession.SampleValues[0];
      dmdDV.cdsExisting.Close;
      dmdDV.qExisting.Close;
      dmdDV.qExisting.ParamByName('SampleNo').AsString := UserSession.Parameter2Chosen;
      dmdDV.qExisting.ParamByName('RegAssocID').AsString := 'zrC';
      dmdDV.cdsExisting.Open;
    end;
    }
    if (UserSession.UnitSender = usMultipleAgeChem) then
    begin
      UserSession.Parameter2Chosen := 'Multiple Samples';
    end;
    iwlSampleNo.Caption := UserSession.Parameter2Chosen;
    iwbDownloadData.Enabled := UserSession.CanModifyPlus;
    dmdDV.cdsDataChem.Open;
    dmdDV.cdsDataChem.EmptyDataSet;
    //dmUser.SetDeveloperData('8');
    CreateGraphs;
    GetSampleData;
  end;
end;

procedure TISFAgeChem.CreateGraphs;
const
  zero = 0.0;
var
  i : integer;
  iMaxModelAge, iModelAgeIncrement, iLabelModelAgeIncrement : integer;
  tAge, tUR, tDM, tEpsDM : double;
begin
  iMaxModelAge := 4500;
  iModelAgeIncrement := 20;
  iLabelModelAgeIncrement := 400;
  ChartAge1.Series[0].Clear;
  ChartAge1.Series[1].Clear;
  ChartAge1.Series[2].Clear;
  ChartAge1.Series[3].Clear;
  ChartAge2.Series[0].Clear;
  ChartAge2.Series[1].Clear;
  ChartAge2.Series[2].Clear;
  ChartAge2.Series[3].Clear;
  ChartAge3.Series[0].Clear;
  ChartAge3.Series[1].Clear;
  ChartAge3.Series[2].Clear;
  ChartAge3.Series[3].Clear;
  i := 0;
  {
  repeat
    tAge := 1.0e6*i;
    tAge := 1.0*i;
    ChartAge1.Series[0].AddXY(tAge,tDM);
    ChartAge2.Series[0].AddXY(tAge,tEpsDM);
    ChartAge3.Series[0].AddXY(tAge,tDM);
    if ((i mod iLabelModelAgeIncrement) = 0) then
    begin
      ChartAge1.Series[1].AddXY(tAge,tDM);
      ChartAge2.Series[1].AddXY(tAge,tEpsDM);
      ChartAge3.Series[1].AddXY(tAge,tDM);
    end;
    i := i + iModelAgeIncrement;
  until (i >= iMaxModelAge);
  }
end;

procedure TISFAgeChem.PopulateGraphs;
var
  iCode : integer;
  i : integer;
  tAge, tInitialRatio, tEpsilon, tModelInitialRatio,
  td18O, tDM : double;
  tIncludeYN : string;
  tConcordance,
  ConcordanceFrom, ConcordanceTo : double;
  tVar1, tVar2, tVar3,
  tVar1Sigma, tVar2Sigma, tVar3Sigma : double;
begin
  Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  dmdDV.cdsDataChem.First;
  ChartAge1.Series[2].Clear;
  ChartAge1.Series[3].Clear;
  ChartAge2.Series[2].Clear;
  ChartAge2.Series[3].Clear;
  ChartAge3.Series[2].Clear;
  ChartAge3.Series[3].Clear;
  ChartAge1.LeftAxis.Title.Caption := 'Th/U';
  ChartAge2.LeftAxis.Title.Caption := 'Ti in zircon Temp.';
  ChartAge3.LeftAxis.Title.Caption := 'delta 18O';
  iwlVar1.Caption := 'Th/U';
  iwlVar2.Caption := 'Ti in zr';
  iwlVar3.Caption := 'd 18O';
  i := 0;
  repeat
    tIncludeYN := dmdDV.cdsDataChemIncludeYN.AsString;
    tConcordance := dmdDV.cdsDataChemPercentConcordance.AsFloat;
    if ((tConcordance >= ConcordanceFrom) and (tConcordance <= ConcordanceTo))
      then tIncludeYN := 'Y'
      else tIncludeYN := 'N';
    dmdDV.cdsDataChem.Edit;
    dmdDV.cdsDataChemIncludeYN.AsString := tIncludeYN;
    dmdDV.cdsDataChem.Post;
    tAge := dmdDV.cdsDataChemPreferredAge.AsFloat;
    tVar1 := dmdDV.cdsDataChemVar1.AsFloat;
    tVar2 := dmdDV.cdsDataChemVar2.AsFloat;
    tVar3 := dmdDV.cdsDataChemVar3.AsFloat;
    if (tIncludeYN = 'Y') then
    begin
      if ((tAge >= 0.0) and (tVar1 > 0.0) and (tVar1 > DefaultMissingValue)) then
      begin
        ChartAge1.Series[2].AddXY(tAge,tVar1);
      end;
      if ((tAge >= 0.0) and (tVar2 > 0.0) and (tVar3 > DefaultMissingValue)) then
      begin
        ChartAge2.Series[2].AddXY(tAge,tVar2);
      end;
      if ((tAge >= 0.0) and (tVar3 > DefaultMissingValue)) then
      begin
        ChartAge3.Series[2].AddXY(tAge,tVar3);
      end;
    end else
    begin
      if ((tAge >= 0.0) and (tVar1 > 0.0) and (tVar1 > DefaultMissingValue)) then
      begin
        ChartAge1.Series[3].AddXY(tAge,tVar1);
      end;
      if ((tAge >= 0.0) and (tVar2 > 0.0) and (tVar3 > DefaultMissingValue)) then
      begin
        ChartAge2.Series[3].AddXY(tAge,tVar2);
      end;
      if ((tAge >= 0.0) and (tVar3 > DefaultMissingValue)) then
      begin
        ChartAge3.Series[3].AddXY(tAge,tVar3);
      end;
    end;
    dmdDV.cdsDataChem.Next;
  until dmdDV.cdsDataChem.Eof;
  dmdDV.cdsDataChem.First;
end;

procedure TISFAgeChem.GetSampleData;
const
  zero = 0.0;
  EpsTolerance = 0.01;
  AgeTolerance = 0.10;
var
  iCnt, iCntIncluded : integer;
  tIncludeYN : string;
  iCode, i : integer;
  tAge, tAgeMin, tAgeMax, tAgeErr : double;
  tInitialRatio, tPresentRatio : double;
  tConcordance,
  ConcordanceFrom, ConcordanceTo : double;
  iErrTypX, iErrTypY, iErrTypZ : integer;
  tErrValX, tDataValX,
  tErrValY, tDataValY,
  tErrValZ, tDataValZ : double;
  tDM, tDMerr : double;
  tAgeMinusDM : double;
begin
  //dmUser.SetDeveloperData('Starting GetSampleData');
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
  //dmUser.SetDeveloperData(dmdDV.qRawSmp.SQL.Text);
  dmdDV.qRawSmp.Close;
  dmdDV.cdsRawSmp.Close;
  //dmdDV.qRawSmp.ParamByName('SampleNo').AsString := UserSession.Parameter2Chosen;
  dmdDV.qRawSmp.ParamByName('RegAssocID').AsString := 'zrC';
  dmdDV.cdsRawSmp.Open;
  //dmUser.SetDeveloperData('cdsRawSmp recordcount = '+IntToStr(dmdDV.cdsRawSmp.RecordCount));
  //dmUser.SetDeveloperData('cdsRawSmp Sample and Frac = '+dmdDV.cdsRawSmpSAMPLENO.AsString+' / '+dmdDV.cdsRawSmpFRAC.AsString);
  //dmUser.SetDeveloperData('UserSession.UnitSender = '+UserSession.UnitSender);
  iwlSourceShort.Visible := false;
  iwlSourceShortHeading.Visible := false;
  iweLongitude.Text := '';
  iweLatitude.Text := '';
  iweElevation.Text := '';
  iweLithology.Text := '';
  iweLithClass.Text := '';
  if (UserSession.UnitSender = usIndividualAgeChem) then
  begin
    iweLongitude.Visible := true;
    iweLatitude.Visible := true;
    iweElevation.Visible := true;
    iweLithology.Visible := true;
    iweLithClass.Visible := true;
    UserSession.NewContinentID := dmdDV.cdsRawSmpLocCONTINENTID.AsString;
    UserSession.NewAreaID := dmdDV.cdsRawSmpLocCOUNTRYABR.AsString;
    UserSession.NewReferenceID := dmdDV.cdsRawRefREFNUM.AsString;
    iweLongitude.Text := FormatFloat('###0.00000',dmdDV.cdsRawSmpLocLONGITUDE.AsFloat);
    iweLatitude.Text := FormatFloat('###0.00000',dmdDV.cdsRawSmpLocLATITUDE.AsFloat);
    iweElevation.Text := FormatFloat('####0.000',dmdDV.cdsRawSmpLocELEVATION.AsFloat);
    iweLithology.Text := dmdDV.cdsRawSmpLocLithology.AsString;
    iweLithClass.Text := '('+dmdDV.cdsRawSmpLocLithClass.AsString+')';
    iwlSourceShort.Caption := dmdDV.cdsRawRefSOURCESHORT.AsString;
    iwlContinentID.Caption := UserSession.NewContinentID;
    iwlCountryAbr.Caption := UserSession.NewAreaID;
    //dmUser.SetDeveloperData('cdsRawRef = '+dmdDV.cdsRawRefSOURCESHORT.AsString+' / '+IntToStr(dmdDV.cdsRawRefREFNUM.AsInteger));
    iwlSourceShort.Visible := true;
    iwlSourceShortHeading.Visible := true;
  end;
  if (UserSession.UnitSender = usMultipleAgeChem) then
  begin
    iwlSourceShort.Visible := false;
    iwlSourceShortHeading.Visible := false;
    iweLongitude.Text := '';
    iweLatitude.Text := '';
    iweElevation.Text := '';
    iweLithology.Text := '';
    iweLithClass.Text := '';
    iweLongitude.Visible := false;
    iweLatitude.Visible := false;
    iweElevation.Visible := false;
    iweLithology.Visible := false;
    iweLithClass.Visible := false;
  end;
  //dmUser.SetDeveloperData('GetSampleData 1');
  dmdDV.cdsDataChem.Open;
  dmdDV.cdsDataChem.EmptyDataSet;
  dmdDV.cdsRawSmp.First;
  i := 0;
  repeat
    i := i + 1;
    tAge := dmdDV.cdsRawAgePrefDATAVALUE.AsFloat;
    //dmUser.SetDeveloperData('AgeHf check '+IntToStr(iCnt)+' '+FormatFloat('####0.000',tAge)+'  '+FormatFloat('####0.00000',tDataValY));
    if ((tAge >= tAgeMin) and (tAge <= tAgeMax)) then
    begin
      tAgeErr := dmdDV.cdsRawDataAgeerrDATAVALUE.AsFloat;
      if (tAgeErr < 0.0000001) then tAgeErr := 10.0;
      tConcordance := 100.0 - dmdDV.cdsRawDiscordanceDATAVALUE.AsFloat;
      if ((tConcordance >= ConcordanceFrom) and (tConcordance <= ConcordanceTo)) then tIncludeYN := 'Y'
                                                                                 else tIncludeYN := 'N';
      if (dmdDV.cdsRawDataIncludeDATAVALUE.AsFloat < 0.5) then
      begin
        tIncludeYN := 'N';
      end;
      if (dmdDV.cdsRawNormalisedValueXNORMALISEDVALUE.AsString = '') then tDataValX := DefaultMissingValue
      else tDataValX := dmdDV.cdsRawNormalisedValueXNORMALISEDVALUE.AsFloat;
      if (dmdDV.cdsRawNormalisedValueYNORMALISEDVALUE.AsString = '') then tDataValY := DefaultMissingValue
      else tDataValY := dmdDV.cdsRawNormalisedValueYNORMALISEDVALUE.AsFloat;
      if (dmdDV.cdsRawNormalisedValueZNORMALISEDVALUE.AsString = '') then tDataValZ := DefaultMissingValue
      else tDataValZ := dmdDV.cdsRawNormalisedValueZNORMALISEDVALUE.AsFloat;
      iErrTypX := Trunc(dmdDV.cdsRawErrTypeXDATAVALUE.AsFloat);
      //iErrTypX := 0;
      tErrValX := dmdDV.cdsRawDataXerrDATAVALUE.AsFloat;
      iErrTypY := Trunc(dmdDV.cdsRawErrTypeYDATAVALUE.AsFloat);
      //iErrTypY := 0;
      tErrValY := dmdDV.cdsRawDataYerrDATAVALUE.AsFloat;
      //iErrTypZ := Trunc(dmdDV.cdsRawErrTypeZDATAVALUE.AsFloat);
      iErrTypZ := 0;
      tErrValZ := dmdDV.cdsRawDataZerrDATAVALUE.AsFloat;
      if (iErrTypX = 0) then tErrValX := tErrValX*tDataValX/100.0; // % data converted to actual
      if (iErrTypY = 0) then tErrValY := tErrValY*tDataValY/100.0;
      if (iErrTypZ = 0) then tErrValZ := tErrValZ*tDataValZ/100.0;
      if (tErrValX < 0.0000001) then tErrValX := 0.000010;
      if (tErrValY < 0.0000001) then tErrValY := 0.000010;
      if (tErrValZ < 0.0000001) then tErrValZ := 0.000010;
      //tDM := dmdDV.cdsRawDataDMDATAVALUE.AsFloat;
      //tDMerr := dmdDV.cdsRawDataDMerrDATAVALUE.AsFloat;
      //if (tDMerr < 0.0000001) then tDMerr := 25.0;
      //tAgeMinusDM := tAge - tDM;
      try
        dmdDV.cdsDataChem.Append;
        dmdDV.cdsDataChemi.AsInteger := i;
        dmdDV.cdsDataChemSampleNo.AsString := dmdDV.cdsRawSmpSAMPLENO.AsString;
        dmdDV.cdsDataChemFrac.AsString := dmdDV.cdsRawSmpFRAC.AsString;
        dmdDV.cdsDataChemZoneID.AsString := dmdDV.cdsRawSmpZONEID.AsString;
        dmdDV.cdsDataChemVar1.AsFloat := tDataValX;        //ThU
        dmdDV.cdsDataChemVar1Sigma.AsFloat := tErrValX;
        dmdDV.cdsDataChemVar2.AsFloat := tDataValY;        //Ti in zr temperature
        dmdDV.cdsDataChemVar2Sigma.AsFloat := tErrValY;    //s Ti in zircon temperature
        dmdDV.cdsDataChemVar3.AsFloat := tDataValZ;        //d18O
        dmdDV.cdsDataChemVar3Sigma.AsFloat := tErrValZ;
        dmdDV.cdsDataChemIncludeYN.AsString := tIncludeYN;
        dmdDV.cdsDataChemPercentConcordance.AsFloat := tConcordance;
        dmdDV.cdsDataChemPreferredAge.AsFloat := tAge;
        dmdDV.cdsDataChemPreferredAgeSigma.AsFloat := tAgeErr;
        dmdDV.cdsDataChem.Post;
      except
      end;
      if (tIncludeYN = 'Y') then iCntIncluded := iCntIncluded + 1;
      //dmUser.SetDeveloperData('AgeChem '+IntToStr(iCnt)+' '+tIncludeYN+'  '+FormatFloat('####0.000',dmdDV.cdsDataChemPreferredAge.AsFloat)+'  '+FormatFloat('####0.00000',tDataValX)+'  '+FormatFloat('##0.000',tConcordance));
      iCnt := iCnt + 1;
    end;
    dmdDV.cdsRawSmp.Next;
  until dmdDV.cdsRawSmp.Eof;
  dmdDV.cdsDataChem.First;
  dmdDV.cdsRawSmp.Close;
  iwlCount.Caption := IntToStr(iCntIncluded)+' of '+IntToStr(iCnt)+' analyses match the criteria for concordance';
  PopulateGraphs;
end;

procedure TISFAgeChem.iwbDownloadDataClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmdDV.cdsDataChem.First;
  //dmdDV.ReportDataHf.Template := DefaultFlexCellFolder+'FlxRawDataChem.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxRawDataChem.xlsx';
  frFileNameStr := 'Raw Data for samples.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDataChem',dmdDV.cdsDataChem);
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

procedure TISFAgeChem.iwbIncludeExcludeDataClick(Sender: TObject);
begin
  dmdDV.cdsDataChem.Edit;
  if (dmdDV.cdsDataChemIncludeYN.AsString = 'Y') then dmdDV.cdsDataChemIncludeYN.AsString := 'N'
                                               else dmdDV.cdsDataChemIncludeYN.AsString := 'Y';
  dmdDV.cdsDataChem.Post;
end;

procedure TISFAgeChem.iwbReturnClick(Sender: TObject);
begin
  dmdDV.cdsData.EmptyDataSet;
  dmdDV.cdsDataChem.EmptyDataSet;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFAgeChem.iwbReturnToSampleListClick(Sender: TObject);
begin
  if (UserSession.UnitSender = 'usIndividualAgeChemP') then   UserSession.UnitSender := 'usIndividualAgeChem';
  if (UserSession.UnitSender = 'usIndividualAgeChemI') then   UserSession.UnitSender := 'usIndividualAgeChem';
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDefineRawDataSampleQuery.Create(WebApplication).Show;
end;

procedure TISFAgeChem.iwbScaleAxesClick(Sender: TObject);
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
  ChartAge1.BottomAxis.SetMinMax(t75Min,t75Max);
  ChartAge1.LeftAxis.SetMinMax(t68Min,t68Max);
  ChartAge2.BottomAxis.SetMinMax(t86Min,t86Max);
  ChartAge2.LeftAxis.SetMinMax(t76Min,t76Max);
  ChartAge3.BottomAxis.SetMinMax(t75Min,t75Max);
  ChartAge3.LeftAxis.SetMinMax(t68Min,t68Max);
  iwcbGraphsAutoscale.Checked := false;
end;

procedure TISFAgeChem.iwcbAutoscaleClick(Sender: TObject);
begin
  if not iwcbGraphsAutoscale.checked then
  begin
    ChartAge1.BottomAxis.Automatic := true;
    ChartAge1.LeftAxis.Automatic := true;
    ChartAge2.BottomAxis.Automatic := true;
    ChartAge2.LeftAxis.Automatic := true;
    ChartAge3.BottomAxis.Automatic := true;
    ChartAge3.LeftAxis.Automatic := true;
 end;
end;

procedure TISFAgeChem.iwcbIncludedExcludedClick(Sender: TObject);
begin
  if iwcbIncluded.Checked then
  begin
    ChartAge1.Series[2].ShowInLegend := true;
    ChartAge1.Series[2].Visible := true;
    ChartAge2.Series[2].ShowInLegend := true;
    ChartAge2.Series[2].Visible := true;
    ChartAge3.Series[2].ShowInLegend := true;
    ChartAge3.Series[2].Visible := true;
  end else
  begin
    ChartAge1.Series[2].ShowInLegend := false;
    ChartAge1.Series[2].Visible := false;
    ChartAge2.Series[2].ShowInLegend := false;
    ChartAge2.Series[2].Visible := false;
    ChartAge3.Series[2].ShowInLegend := false;
    ChartAge3.Series[2].Visible := false;
  end;
  if iwcbExcluded.Checked then
  begin
    ChartAge1.Series[3].ShowInLegend := true;
    ChartAge1.Series[3].Visible := true;
    ChartAge2.Series[3].ShowInLegend := true;
    ChartAge2.Series[3].Visible := true;
    ChartAge3.Series[3].ShowInLegend := true;
    ChartAge3.Series[3].Visible := true;
  end else
  begin
    ChartAge1.Series[3].ShowInLegend := false;
    ChartAge1.Series[3].Visible := false;
    ChartAge2.Series[3].ShowInLegend := false;
    ChartAge2.Series[3].Visible := false;
    ChartAge3.Series[3].ShowInLegend := false;
    ChartAge3.Series[3].Visible := false;
  end;
end;

procedure TISFAgeChem.iwDBgDataColumns0Click(ASender: TObject;
  const AValue: string);
begin
  dmdDV.cdsDataChem.Locate('i',AValue,[loCaseInsensitive,loPartialKey]);
end;

procedure TISFAgeChem.iwDBgDataColumns0TitleClick(Sender: TObject);
begin
  dmdDV.cdsDataChem.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;

end.
