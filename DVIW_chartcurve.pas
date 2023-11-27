unit DVIW_chartcurve;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  VCLTee.TeEngine, VCLTee.Series,
  Controls, ExtCtrls, TeeProcs, Chart, IWCompExtCtrls, IWCompTeeChart,
  IWHTMLControls, IWCompEdit, IWCompListbox, IWCompLabel, IWVCLBaseControl,
  IWBaseControl, IWControl, IWCompCheckbox, Graphics, IWHTMLTag,
  IWCompButton, IWBaseHTMLControl,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FireDAC.Stan.Intf,
  VCLTee.TeeURL, VCLTee.TeeSeriesTextEd, VCLTee.ErrorBar,
  IWDBStdCtrls, IWCompGrids, IWDBGrids,
  DB, DBClient,
  VclTee.TeeGDIPlus, VCLTee.TeeData, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Forms,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TIWChartInterpretation = class(TIWAppForm)
    FDMemTitles: TFDMemTable;
    FDMemProb: TFDMemTable;
    FDMemTempDataDI: TFDMemTable;
    FDMemTempDataDG: TFDMemTable;
    FDMemTempDataDT: TFDMemTable;
    FDMemProbAge: TFloatField;
    FDMemProbCurve1Value: TFloatField;
    FDMemProbCurve2Value: TFloatField;
    FDMemProbCurve3Value: TFloatField;
    FDMemProbCurve4Value: TFloatField;
    FDMemProbCurve5Value: TFloatField;
    FDMemTempDataDIInterpretation: TStringField;
    FDMemTempDataDIAge: TFloatField;
    FDMemTempDataDIUnitName: TStringField;
    FDMemTempDataDIInterpAbr: TStringField;
    FDMemTempDataDIColumnNo: TIntegerField;
    FDMemTempDataDIAgeErrorAv: TFloatField;
    FDMemTempDataDIAgePlusError: TFloatField;
    FDMemTempDataDIAgeMinusError: TFloatField;
    FDMemTempDataDGGrouping: TStringField;
    FDMemTempDataDGAge: TFloatField;
    FDMemTempDataDGUnitName: TStringField;
    FDMemTempDataDGInterpAbr: TStringField;
    FDMemTempDataDGColumnNo: TIntegerField;
    FDMemTempDataDGAgeErrorAv: TFloatField;
    FDMemTempDataDGAgePlusError: TFloatField;
    FDMemTempDataDGAgeMinusError: TFloatField;
    FDMemTempDataDTGrouping: TStringField;
    FDMemTempDataDTMaterialAbr: TStringField;
    FDMemTempDataDTIsoSystem: TStringField;
    FDMemTempDataDTApproachAbr: TStringField;
    FDMemTempDataDTAge: TFloatField;
    FDMemTempDataDTSuiteName: TStringField;
    FDMemTempDataDTColumnNo: TIntegerField;
    FDMemTempDataDTAgePlusError: TFloatField;
    FDMemTempDataDTAgeMinusError: TFloatField;
    FDMemTempDataDTBlockingT: TFloatField;
    FDMemTempDataDTBlockingTUncertainty: TFloatField;
    FDMemTitlesCurve1Title: TStringField;
    FDMemTitlesCurve2Title: TStringField;
    FDMemTitlesCurve3Title: TStringField;
    FDMemTitlesCurve4Title: TStringField;
    FDMemTitlesCurve5Title: TStringField;
    IWRegion1: TIWRegion;
    iwbClose: TIWButton;
    iwbExportGraphValues: TIWButton;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweYMinimum: TIWEdit;
    iweXMinimum: TIWEdit;
    IWLabel6: TIWLabel;
    IWLabel5: TIWLabel;
    iweYMaximum: TIWEdit;
    iweXMaximum: TIWEdit;
    iwcbAutomaticScaling: TIWCheckBox;
    iwbChangeAxisScales: TIWButton;
    iwcbShowErrorBars: TIWCheckBox;
    iwcbShowLegend: TIWCheckBox;
    iwcbShowBackground: TIWCheckBox;
    IWRegion4: TIWRegion;
    IWRegion3: TIWRegion;
    iwcbSeries1: TIWCheckBox;
    iwcbSeries2: TIWCheckBox;
    iwcbSeries3: TIWCheckBox;
    iwcbSeries4: TIWCheckBox;
    iwcbSeries5: TIWCheckBox;
    IWRegion5: TIWRegion;
    IWRegion2: TIWRegion;
    iwlNormalisationType: TIWLabel;
    iwlMinimumDateUncertainty: TIWLabel;
    iwlPDFType: TIWLabel;
    IWChart1: TIWChart;
    Chart1: TChart;
    Series1: TLineSeries;
    Series3: TLineSeries;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TErrorSeries;
    Series7: TErrorSeries;
    Series8: TErrorSeries;
    Series9: TErrorSeries;
    Series10: TErrorSeries;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwcbShowLegendClick(Sender: TObject);
    procedure iwcbShowBackgroundClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbChangeAxisScalesClick(Sender: TObject);
    procedure iwcbAutomaticScalingClick(Sender: TObject);
    procedure iwcbShowErrorBarsClick(Sender: TObject);
    procedure iwbExportGraphValuesClick(Sender: TObject);
    procedure iwcbSeries1Click(Sender: TObject);
    procedure iwcbSeries2Click(Sender: TObject);
    procedure iwcbSeries3Click(Sender: TObject);
    procedure iwcbSeries4Click(Sender: TObject);
    procedure iwcbSeries5Click(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  private
    MinimumCurveValue : double;
    //NumDataPoints : array[1..5] of integer;
    procedure CreateChart;
    procedure GraphDI(iSeries, iPlotSequence : integer);
    procedure GraphDG(iSeries, iPlotSequence : integer);
    procedure GraphDT(iSeries : integer);
    procedure GraphDateByInterpretation(GraphType : string);
    procedure GraphDateGrouped(GraphType : string);
    procedure GraphClosureTempGrouped(GraphType : string);
  protected
  public
  end;

implementation

uses IWForm, ServerController, DVIW_dmgraphics, DVIW_constants,
  DVIW_mathproc, DVIW_dm, JPEG, TeeJPEG, DVIW_selectgraph, usrIW_dm;

{$R *.dfm}


procedure TIWChartInterpretation.IWAppFormCreate(Sender: TObject);
begin
  //dmUser.SetDeveloperData('StartAtX ChartInterpretationFormCreate = '+FormatFloat('####0.00',UserSession.StartAtX));
  //dmUser.SetDeveloperData('EndAtX ChartInterpretationFormCreate = '+FormatFloat('####0.00',UserSession.EndAtX));
  MinimumCurveValue := 1.0e-8;
  Chart1.BufferedDisplay := false;
  Chart1.Foot.Clear;
  Chart1.Foot.Text.Add(Copyright1);
  Chart1.Foot.Text.Add(Copyright2);
  //iwbExportGraphValues.Visible := UserSession.CanViewPlus;
  iwcbSeries1.Visible := UserSession.CanViewPlus;
  iwcbSeries2.Visible := UserSession.CanViewPlus;
  iwcbSeries3.Visible := UserSession.CanViewPlus;
  iwcbSeries4.Visible := UserSession.CanViewPlus;
  iwcbSeries5.Visible := UserSession.CanViewPlus;
  if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
      (UserSession.GraphType = gtGroupedProbabilityCurves)) then
  begin
    iwbExportGraphValues.Visible := true;
    iwcbSeries1.Visible := true;
    iwcbSeries2.Visible := true;
    iwcbSeries3.Visible := true;
    iwcbSeries4.Visible := true;
    iwcbSeries5.Visible := true;
  end else
  begin
    iwbExportGraphValues.Visible := UserSession.CanViewPlus;
    iwcbSeries1.Visible := UserSession.CanViewPlus;
    iwcbSeries2.Visible := UserSession.CanViewPlus;
    iwcbSeries3.Visible := UserSession.CanViewPlus;
    iwcbSeries4.Visible := UserSession.CanViewPlus;
    iwcbSeries5.Visible := UserSession.CanViewPlus;
  end;
  CreateChart;
  if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
      (UserSession.GraphType = gtInterpretationWithErrorBars) or
      (UserSession.GraphType = gtGalbraith)) then
  begin
    GraphDateByInterpretation(UserSession.GraphType);
  end;
  if ((UserSession.GraphType = gtGroupedProbabilityCurves) or
      (UserSession.GraphType = gtGroupedWithErrorBars)) then
  begin
    GraphDateGrouped(UserSession.GraphType);
  end;
  if ((UserSession.GraphType = gtClosureTemperature)) then
  begin
    GraphClosureTempGrouped(UserSession.GraphType);
  end;
end;

procedure TIWChartInterpretation.CreateChart;
var tmp : TChartSeriesClass;
    tmpSeries : TChartSeries;
begin
  Chart1.Title.Text.Clear;
  Chart1.View3D:=false;
  if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
      (UserSession.GraphType = gtGroupedProbabilityCurves)) then
  begin
    iwlNormalisationType.Caption := UserSession.NormalisationType;
    iwlMinimumDateUncertainty.Caption := 'Minimum uncertainty for errors = '
        +UserSession.MinimumDateUncertainty
        +' '+UserSession.AgeUnitsValue;
    if (UserSession.PDFType = 'AND') then iwlPDFType.Caption := 'Probab. Density Func. by ANDing of Gaussian errors';
    if (UserSession.PDFType = 'OR') then iwlPDFType.Caption := 'Probab. Density Func. by ORing of Gaussian errors';
  end else
  begin
    iwlNormalisationType.Caption := '';
    iwlMinimumDateUncertainty.Caption := '';
    iwlPDFType.Caption := '';
  end;
end;

procedure TIWChartInterpretation.iwcbShowLegendClick(Sender: TObject);
begin
  Chart1.Legend.Visible:=iwcbShowLegend.Checked;
end;

procedure TIWChartInterpretation.iwcbShowBackgroundClick(Sender: TObject);
begin
  Chart1.Gradient.Visible:=iwcbShowBackground.Checked;

  if iwcbShowBackground.Checked then
     Chart1.BevelOuter := bvRaised
  else
     Chart1.BevelOuter := bvNone;

  Chart1.Color:=clWhite;
end;

procedure TIWChartInterpretation.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSelectGraph.Create(WebApplication).Show;
end;

procedure TIWChartInterpretation.GraphDI(iSeries, iPlotSequence : integer);    // sequencial interpretation dates with error bars
var
  tMean, tPlus, tMinus, tError : double;
begin
  tPlus := dmgDV.cdsTempDataDIAgePlusError.AsFloat;
  tMinus := dmgDV.cdsTempDataDIAgeMinusError.AsFloat;
  if (tPlus = 0.0) and (tMinus > 0.0) then tPlus := tMinus;
  if (tMinus = 0.0) and (tPlus > 0.0) then tMinus := tPlus;
  tMean :=  ((dmgDV.cdsTempDataDIAge.AsFloat + tPlus) + (dmgDV.cdsTempDataDIAge.AsFloat - tMinus))/2.0;
  tError := (tPlus + tMinus)/2.0;
  Chart1.Series[iSeries-1].AddXY(1.0*iPlotSequence, dmgDV.cdsTempDataDIAge.AsFloat);
  case iSeries of
    1 : begin
      Series6.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    2 : begin
      Series7.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    3 : begin
      Series8.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    4 : begin
      Series9.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    5 : begin
      Series10.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
  end;
end;

procedure TIWChartInterpretation.GraphDG(iSeries, iPlotSequence : integer);   // sequential grouped dates with error bars
var
  tMean, tPlus, tMinus, tError : double;
begin
  tPlus := dmgDV.cdsTempDataDGAgePlusError.AsFloat;
  tMinus := dmgDV.cdsTempDataDGAgeMinusError.AsFloat;
  if (tPlus = 0.0) and (tMinus > 0.0) then tPlus := tMinus;
  if (tMinus = 0.0) and (tPlus > 0.0) then tMinus := tPlus;
  tMean :=  ((dmgDV.cdsTempDataDGAge.AsFloat + tPlus) + (dmgDV.cdsTempDataDGAge.AsFloat - tMinus))/2.0;
  tError := (tPlus + tMinus)/2.0;
  Chart1.Series[iSeries-1].AddXY(1.0*iPlotSequence,dmgDV.cdsTempDataDGAge.AsFloat);
  case iSeries of
    1 : begin
      Series6.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    2 : begin
      Series7.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    3 : begin
      Series8.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    4 : begin
      Series9.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
    5 : begin
      Series10.AddErrorBar(1.0*iPlotSequence,tMean,tError);
    end;
  end;
end;

procedure TIWChartInterpretation.GraphDT(iSeries : integer);
var
  tMean, tError : double;
begin
  {
  tPlus := dmgDV.cdsTempDataDTAgePlusError.AsFloat;
  tMinus := dmgDV.cdsTempDataDTAgeMinusError.AsFloat;
  if (tPlus = 0.0) and (tMinus > 0.0) then tPlus := tMinus;
  if (tMinus = 0.0) and (tPlus > 0.0) then tMinus := tPlus;
  tMean :=  ((dmgDV.cdsTempDataDTAge.AsFloat + tPlus) + (dmgDV.cdsTempDataDTAge.AsFloat - tMinus))/2.0;
  tError := (tPlus + tMinus)/2.0;
  }
  tMean := dmgDV.cdsTempDataDTBlockingT.AsFloat;
  tError := dmgDV.cdsTempDataDTBlockingTUncertainty.AsFloat;
  Chart1.Series[iSeries-1].AddXY(dmgDV.cdsTempDataDTAge.AsFloat, dmgDV.cdsTempDataDTBlockingT.AsFloat);
  case iSeries of
    1 : begin
      Series6.AddErrorBar(dmgDV.cdsTempDataDTAge.AsFloat,tMean,tError);
    end;
    2 : begin
      Series7.AddErrorBar(dmgDV.cdsTempDataDTAge.AsFloat,tMean,tError);
    end;
    3 : begin
      Series8.AddErrorBar(dmgDV.cdsTempDataDTAge.AsFloat,tMean,tError);
    end;
    4 : begin
      Series9.AddErrorBar(dmgDV.cdsTempDataDTAge.AsFloat,tMean,tError);
    end;
    5 : begin
      Series10.AddErrorBar(dmgDV.cdsTempDataDTAge.AsFloat,tMean,tError);
    end;
  end;
end;

procedure TIWChartInterpretation.GraphDateByInterpretation(GraphType : string);
var
  i, k, l, iPlotSequence, MaxPlotSequence : integer;
  Icnt : integer;
  X1, X2, Y2 : double;
  tempmax : array[1..MaxSeries] of double;
  SD1, SD2, t1, tempd : double;
  NPts : array[1..MaxSeries] of integer;
  Spectrum2d : array[0..Steps,0..MaxSeries] of double;
  tx, tx1 : double;
  FromDate, ToDate : double;
  iCode : integer;
  MinimumUncertainty : double;
  tmpStr : string;
  tempGauss : double;
  tNpts : double;
begin
    MinimumUncertainty := 2.0;
    Val(UserSession.MinimumDateUncertainty,MinimumUncertainty,iCode);
    MinimumUncertainty := MinimumUncertainty/1.96;
    dmgDV.cdsTempdataDI.IndexFieldNames := 'Age';
    if (UserSession.StartAtX < 0.0) then UserSession.StartAtX := 0.0;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX + 1.0;
    //UserSession.StartAtX := 100.0*(Trunc(UserSession.StartAtX) div 100);
    //UserSession.EndAtX := 100.0*(Trunc(UserSession.EndAtX) div 100 + 1);
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      if (iCode = 0) then
      begin
        UserSession.StartAtX := FromDate;
      end;
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      if (iCode = 0) then
      begin
        UserSession.EndAtX := ToDate;
      end;
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
    Chart1.Title.Text.Text := UserSession.GraphType;
    for l := 0 to Steps do
    begin
      X1 := UserSession.FromAge + 1.0*l*(UserSession.ToAge-UserSession.FromAge)/Steps;
      Spectrum2d[l,0] := X1;
    end;
    for i := 1 to MaxSeries do
    begin
      dmgDV.cdsTempDataDI.Filtered := false;
      dmgDV.cdsTempDataDI.First;
      case i of
        1 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation1Caption+'''';
        2 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation2Caption+'''';
        3 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation3Caption+'''';
        4 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation4Caption+'''';
        5 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation5Caption+'''';
      end;
      dmgDV.cdsTempDataDI.Filtered := true;
      NPts[i] := 0;
      NPts[i] := dmgDV.cdsTempDataDI.RecordCount;
      Chart1.Series[i-1].Clear;
      Chart1.Series[MaxSeries+i-1].Clear;
      if (GraphType = gtInterpretationWithErrorBars) then
      begin
        Chart1.LeftAxis.Title.Caption := 'Date';
        Chart1.BottomAxis.Title.Caption := '';
        Chart1.LeftAxis.Title.Visible := true;
        Chart1.BottomAxis.Title.Visible := false;
        iwcbShowErrorBars.Checked := true;
        iwcbShowErrorBars.Visible := true;
        case i of
          1 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation1Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries1.Caption := UserSession.Interpretation1Caption;
            Series1.LinePen.Hide;
            Series1.Pointer.Visible := true;
            Series6.Visible := true;
            Series6.MultiBar := TMultiBar.mbNone;
          end;
          2 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation2Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries2.Caption := UserSession.Interpretation2Caption;
            Series2.LinePen.Hide;
            Series2.Pointer.Visible := true;
            Series7.Visible := true;
            Series7.MultiBar := TMultiBar.mbNone;
          end;
          3 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation3Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries3.Caption := UserSession.Interpretation3Caption;
            Series3.LinePen.Hide;
            Series3.Pointer.Visible := true;
            Series8.Visible := true;
            Series8.MultiBar := TMultiBar.mbNone;
          end;
          4 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation4Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries4.Caption := UserSession.Interpretation4Caption;
            Series4.LinePen.Hide;
            Series4.Pointer.Visible := true;
            Series9.Visible := true;
            Series9.MultiBar := TMultiBar.mbNone;
          end;
          5 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation5Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries5.Caption := UserSession.Interpretation5Caption;
            Series5.LinePen.Hide;
            Series5.Pointer.Visible := true;
            Series10.Visible := true;
            Series10.MultiBar := TMultiBar.mbNone;
          end;
        end;
      end;
      if (GraphType = gtInterpretationProbabilityCurves) then
      begin
        Chart1.LeftAxis.Title.Caption := 'Probability (%)';
        Chart1.BottomAxis.Title.Caption := 'Date';
        Chart1.LeftAxis.Title.Visible := true;
        Chart1.BottomAxis.Title.Visible := true;
        iwcbShowErrorBars.Checked := false;
        iwcbShowErrorBars.Visible := false;
        case i of
          1 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation1Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries1.Caption := UserSession.Interpretation1Caption;
            Series1.LinePen.Show;
            Series1.Pointer.Visible := false;
            Series6.Visible := false;
          end;
          2 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation2Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries2.Caption := UserSession.Interpretation2Caption;
            Series2.LinePen.Show;
            Series2.Pointer.Visible := false;
            Series7.Visible := false;
          end;
          3 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation3Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries3.Caption := UserSession.Interpretation3Caption;
            Series3.LinePen.Show;
            Series3.Pointer.Visible := false;
            Series8.Visible := false;
          end;
          4 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation4Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries4.Caption := UserSession.Interpretation4Caption;
            Series4.LinePen.Show;
            Series4.Pointer.Visible := false;
            Series9.Visible := false;
          end;
          5 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation5Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries5.Caption := UserSession.Interpretation5Caption;
            Series5.LinePen.Show;
            Series5.Pointer.Visible := false;
            Series10.Visible := false;
          end;
        end;
      end;
      if (GraphType = gtGalbraith) then
      begin
        Chart1.LeftAxis.Title.Caption := 'Date';
        Chart1.BottomAxis.Title.Caption := '1/sigma';
        Chart1.LeftAxis.Title.Visible := false;
        Chart1.BottomAxis.Title.Visible := false;
        iwcbShowErrorBars.Checked := false;
        iwcbShowErrorBars.Visible := false;
        case i of
          1 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation1Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries1.Caption := UserSession.Interpretation1Caption;
            Series1.LinePen.Hide;
            Series1.Pointer.Visible := true;
            Series6.Visible := false;
          end;
          2 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation2Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries2.Caption := UserSession.Interpretation2Caption;
            Series2.LinePen.Hide;
            Series2.Pointer.Visible := true;
            Series7.Visible := false;
          end;
          3 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation3Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries3.Caption := UserSession.Interpretation3Caption;
            Series3.LinePen.Hide;
            Series3.Pointer.Visible := true;
            Series8.Visible := false;
          end;
          4 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation4Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries4.Caption := UserSession.Interpretation4Caption;
            Series4.LinePen.Hide;
            Series4.Pointer.Visible := true;
            Series9.Visible := false;
          end;
          5 : begin
            Chart1.Series[i-1].Title := UserSession.Interpretation5Caption+' (n='+IntToStr(Npts[i])+')';
            iwcbSeries5.Caption := UserSession.Interpretation5Caption;
            Series5.LinePen.Hide;
            Series5.Pointer.Visible := true;
            Series10.Visible := false;
          end;
        end;
      end;
    end;
    dmgDV.cdsTempDataDI.First;
    {Plot Interpretation graphs}
    for l := 0 to Steps do
    begin
      X1 := UserSession.FromAge + 1.0*l*(UserSession.ToAge-UserSession.FromAge)/Steps;
      Spectrum2d[l,0] := X1;
    end;
    MaxPlotSequence := 0;
    for i := 1 to MaxSeries do
    begin
      dmgDV.cdsTempDataDI.Filtered := false;
      dmgDV.cdsTempDataDI.First;
      case i of
        1 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation1Caption+'''';
        2 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation2Caption+'''';
        3 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation3Caption+'''';
        4 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation4Caption+'''';
        5 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation5Caption+'''';
      end;
      dmgDV.cdsTempDataDI.Filtered := true;
      if (NPts[i] > 0) then
      begin
        {VtChDI}
        if (GraphType = gtInterpretationWithErrorBars) then
        begin
          iPlotSequence := 0;
          dmgDV.cdsTempDataDI.First;
          repeat
            iPlotSequence := iPlotSequence + 1;
            GraphDI(i,iPlotSequence);
            dmgDV.cdsTempDataDI.Next;
          until dmgDV.cdsTempDataDI.EOF;
          if (MaxPlotSequence < iPlotSequence) then MaxPlotSequence := iPlotSequence;
        end;
        {VtChCum}
        if (GraphType = gtInterpretationProbabilityCurves) then
        begin
          for k := 0 to Steps do
          begin
            Spectrum2d[k,i] := 0.0;
          end;
          dmgDV.cdsTempDataDI.First;
          repeat
            tx := dmgDV.cdsTempDataDIAge.AsFloat;
            tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
            if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
            for l := 0 to Steps do
            begin
              X1 := Spectrum2d[l,0];
              tempGauss := Gauss(X1,tx,tx1);
              if (UserSession.PDFType = 'AND') then Spectrum2d[l,i] := Spectrum2d[l,i] + tempGauss;
              if (UserSession.PDFType = 'OR') then
              begin
                if (Spectrum2d[l,i] < tempGauss) then Spectrum2d[l,i] := tempGauss;
              end;
            end;
            dmgDV.cdsTempDataDI.Next;
          until dmgDV.cdsTempDataDI.EOF;
        end;
      end else
      begin
        if (GraphType = gtInterpretationProbabilityCurves) then
        begin
          for k := 1 to Steps do
          begin
            Spectrum2d[k,i] := 0.0;
          end;
        end;
      end;
    end;
    {VtChCum}
    if (GraphType = gtInterpretationProbabilityCurves) then
    begin
      for i := 1 to MaxSeries do
      begin
        tempmax[i] := 0.0;
      end;
      for k := 0 to Steps do
      begin
        for i := 1 to MaxSeries do
        begin
          if (tempmax[i] < Spectrum2d[k,i]) then tempmax[i] := Spectrum2d[k,i];
        end;
      end;
      for i := 1 to MaxSeries do
      begin
        if (tempmax[i] <= 0.0) then tempmax[i] := 1.0e-9;
        if (UserSession.NormalisationType = nt100Percent) then
        begin
          tempmax[i] := 100.0/tempmax[i];
        end;
        if (UserSession.NormalisationType = ntTrueProbability) then
        begin
          tNpts := 1.0*NPts[i];
          if (NPts[i] < 1) then tNPts := 1.0;
          tempmax[i] := tempmax[i]/(tNpts);
          if (tempmax[i] <= 0.0) then tempmax[i] := 1.0e-9;
          {
          if UserSession.IsDeveloper then
          begin
              dmUser.SetDeveloperData('GraphDateByInterpretation a '+IntToStr(i)+'***'+IntToStr(NPts[i])+'***'+FormatFloat(###0.000000000',tempmax[i]+'***');
          end;
          }
          if (UserSession.PDFType = 'AND') then
          begin
            tempmax[i] := 1.0/tempmax[i];
          end;
          {
          if UserSession.IsDeveloper then
          begin
              dmUser.SetDeveloperData('GraphDateByInterpretation b '+IntToStr(i)+'***'+FormatFloat(###0.000000000',tempmax[i]+'***');
          end;
          }
          if (UserSession.PDFType = 'OR') then
          begin
            tempmax[i] := 1.0;
          end;
        end;
        if (tempmax[i] <= 0.0) then tempmax[i] := 1.0e-9;
        for k := 0 to Steps do
        begin
          x2 := Spectrum2d[k,0];
          y2 := Spectrum2d[k,i]*tempmax[i];
          if (y2 < MinimumCurveValue) then y2 := 0.0;
          Chart1.Series[i-1].AddXY(x2,y2);
        end;
      end;
    end;
    dmgDV.cdsTempDataDI.First;
    if (GraphType = gtInterpretationProbabilityCurves) then
    begin
      {output to clientdataset}
      dmgDV.cdsTempDataProb.Open;
      dmgDV.cdsTempDataProb.EmptyDataSet;
//Change
      for i := 1 to MaxSeries do
      begin
        case i of
          1 : tmpStr := UserSession.Interpretation1Caption+' (n='+IntToStr(Npts[i])+')';
          2 : tmpStr := UserSession.Interpretation2Caption+' (n='+IntToStr(Npts[i])+')';
          3 : tmpStr := UserSession.Interpretation3Caption+' (n='+IntToStr(Npts[i])+')';
          4 : tmpStr := UserSession.Interpretation4Caption+' (n='+IntToStr(Npts[i])+')';
          5 : tmpStr := UserSession.Interpretation5Caption+' (n='+IntToStr(Npts[i])+')';
        end;
        for k := Steps downto 0 do
        begin
          dmgDV.cdsTempDataProb.Append;
          dmgDV.cdsTempDataProbCurveNumber.AsInteger := i;
          dmgDV.cdsTempDataProbCurveTitle.AsString := tmpStr;
          x2 := Spectrum2d[k,0];
          y2 := Spectrum2d[k,i]*tempmax[i];
          if (y2 < MinimumCurveValue) then y2 := 0.0;
          dmgDV.cdsTempDataProbAge.AsFloat := x2;
          dmgDV.cdsTempDataProbCurveValue.AsFloat := y2;
        end;
      end;
    end;
    UserSession.NumberOfPoints := dmgDV.cdsTempDataDI.RecordCount;;
    dmgDV.cdsTempDataDI.First;
    dmgDV.cdsTempDataDI.Filtered := false;
    {Galbraith plot}
    if (GraphType = gtGalbraith) then
    begin
      dmgDV.WtAverData2(UserSession.NumberOfPoints,tempd,t1,SD1,SD2,Icnt);
      for i := 1 to MaxSeries do
      begin
        dmgDV.cdsTempDataDI.Filtered := false;
        dmgDV.cdsTempDataDI.First;
        case i of
          1 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation1Caption+'''';
          2 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation2Caption+'''';
          3 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation3Caption+'''';
          4 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation4Caption+'''';
          5 : dmgDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation5Caption+'''';
        end;
        dmgDV.cdsTempDataDI.Filtered := true;
        dmgDV.cdsTempDataDI.First;
        repeat
            if (dmgDV.cdsTempDataDIAgeErrorAv.AsFloat > 0.0) then
            begin
              Chart1.Series[i-1].AddXY(1.0/dmgDV.cdsTempDataDIAgeErrorAv.AsFloat,((dmgDV.cdsTempDataDIAge.AsFloat-tempd)/dmgDV.cdsTempDataDIAgeErrorAv.AsFloat));
            end;
          dmgDV.cdsTempDataDI.Next;
        until dmgDV.cdsTempDataDI.EOF;
      end;
    end;
    dmgDV.cdsTempDataDI.Filtered := false;
    dmgDV.cdsTempDataDI.First;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX +1;
    if (GraphType = gtInterpretationWithErrorBars) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweYMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweYMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
      iweXMinimum.Text := FormatFloat('###0.00',0.0);
      iweXMaximum.Text := FormatFloat('###0.00',MaxPlotSequence);
    end;
    if (GraphType = gtInterpretationProbabilityCurves) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweXMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweXMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
      if (UserSession.NormalisationType = nt100Percent) then
      begin
        iweYMinimum.Text := FormatFloat('###0.00',0.0);
        iweYMaximum.Text := FormatFloat('###0.00',100.0);
      end else
      begin
        iweYMinimum.Text := FormatFloat('###0.00',Chart1.LeftAxis.Minimum);
        iweYMaximum.Text := FormatFloat('###0.00',Chart1.LeftAxis.Maximum);
      end;
    end;
    if (GraphType = gtGalbraith) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweXMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweXMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
      iweYMinimum.Text := FormatFloat('###0.00',Chart1.LeftAxis.Minimum);
      iweYMaximum.Text := FormatFloat('###0.00',Chart1.LeftAxis.Maximum);
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
end;

procedure TIWChartInterpretation.GraphDateGrouped(GraphType : string);
var
  i, k, l, iPlotSequence, MaxPlotSequence : integer;
  X1, X2, Y2 : double;
  tempmax : array[1..MaxSeries] of double;
  NPts : array[1..MaxSeries] of integer;
  Spectrum2d : array[0..Steps,0..MaxSeries] of double;
  tx, tx1 : double;
  FromDate, ToDate : double;
  iCode : integer;
  NumGroupsToUse : integer;
  MinimumUncertainty : double;
  tmpStr : string;
  tempGauss : double;
begin
    //dmUser.SetDeveloperData('StartAtX 0 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.StartAtX));
    //dmUser.SetDeveloperData('EndAtX 0 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.EndAtX));
    MaxPlotSequence := 0;
    MinimumUncertainty := 2.0;
    Val(UserSession.MinimumDateUncertainty,MinimumUncertainty,iCode);
    MinimumUncertainty := MinimumUncertainty/1.96;
    dmgDV.cdsTempdataDG.IndexFieldNames := 'Age';
    if (UserSession.StartAtX < 0.0) then UserSession.StartAtX := 0.0;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX + 1.0;
    //UserSession.StartAtX := 100.0*(Trunc(UserSession.StartAtX) div 100);
    //UserSession.EndAtX := 100.0*(Trunc(UserSession.EndAtX) div 100 + 1);
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      if (iCode = 0) then UserSession.StartAtX := FromDate;
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      if (iCode = 0) then UserSession.EndAtX := ToDate;
    end;
    //dmUser.SetDeveloperData('StartAtX 1 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.StartAtX));
    //dmUser.SetDeveloperData('EndAtX 1 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.EndAtX));
    //dmUser.SetDeveloperData('FromAge 1 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.FromAge));
    //dmUser.SetDeveloperData('ToAge 1 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.ToAge));
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
    Chart1.Title.Text.Text := UserSession.GraphType;
    //use FromAge and ToAge to define the step increment for probability curves
    //FromAge and ToAge need to span the full range of ages to be considered
    //allowing one to change viewports into the curves by changing StartAtX and EndAtX
    for l := 0 to Steps do
    begin
      X1 := UserSession.FromAge + 1.0*l*(UserSession.ToAge-UserSession.FromAge)/Steps;
      Spectrum2d[l,0] := X1;
    end;
    {Plot Grouping graphs}
    if ((GraphType = gtGroupedWithErrorBars) or
        (GraphType = gtGroupedProbabilityCurves)) then
    begin
      if ((UserSession.GroupValues.Count > 0)
        or (UserSession.ProvinceValues.Count > 0)
        or (UserSession.TerraneValues.Count > 0)
        or (UserSession.LIPValues.Count > 0)
        or (UserSession.OrogenicPeriodValues.Count > 0)
        or (UserSession.BoundaryPositionValues.Count > 0)
        or (UserSession.ChemicalTypeValues.Count > 0)) then
      begin
        NumGroupsToUse := MaxSeries;
        iwcbSeries1.Visible := false;
        iwcbSeries2.Visible := false;
        iwcbSeries3.Visible := false;
        iwcbSeries4.Visible := false;
        iwcbSeries5.Visible := false;
        iwcbSeries1.Text := 'nothing';
        iwcbSeries2.Text := 'nothing';
        iwcbSeries3.Text := 'nothing';
        iwcbSeries4.Text := 'nothing';
        iwcbSeries5.Text := 'nothing';
        for i := 1 to NumGroupsToUse do
        begin
          Chart1.Series[i-1].Clear;
          Chart1.Series[MaxSeries+i-1].Clear;
          if (GraphType = gtGroupedWithErrorBars) then
          begin
            Chart1.LeftAxis.Title.Caption := 'Date';
            Chart1.BottomAxis.Title.Caption := '';
            Chart1.LeftAxis.Title.Visible := true;
            Chart1.BottomAxis.Title.Visible := false;
            iwcbShowErrorBars.Checked := true;
            iwcbShowErrorBars.Visible := true;
            case i of
              1 : begin
                Series1.LinePen.Hide;
                Series1.Pointer.Visible := true;
                Series6.Visible := true;
                Series6.MultiBar := TMultiBar.mbNone;
              end;
              2 : begin
                Series2.LinePen.Hide;
                Series2.Pointer.Visible := true;
                Series7.Visible := true;
                Series7.MultiBar := TMultiBar.mbNone;
              end;
              3 : begin
                Series3.LinePen.Hide;
                Series3.Pointer.Visible := true;
                Series8.Visible := true;
                Series8.MultiBar := TMultiBar.mbNone;
              end;
              4 : begin
                Series4.LinePen.Hide;
                Series4.Pointer.Visible := true;
                Series9.Visible := true;
                Series9.MultiBar := TMultiBar.mbNone;
              end;
              5 : begin
                Series5.LinePen.Hide;
                Series5.Pointer.Visible := true;
                Series10.Visible := true;
                Series10.MultiBar := TMultiBar.mbNone;
              end;
            end;
          end;
          if (GraphType = gtGroupedProbabilityCurves) then
          begin
            Chart1.LeftAxis.Title.Caption := 'Probability (%)';
            Chart1.BottomAxis.Title.Caption := 'Date';
            Chart1.LeftAxis.Title.Visible := false;
            Chart1.BottomAxis.Title.Visible := true;
            iwcbShowErrorBars.Checked := false;
            iwcbShowErrorBars.Visible := false;
            case i of
              1 : begin
                Series1.LinePen.Show;
                Series1.Pointer.Visible := false;
                Series6.Visible := false;
              end;
              2 : begin
                Series2.LinePen.Show;
                Series2.Pointer.Visible := false;
                Series7.Visible := false;
              end;
              3 : begin
                Series3.LinePen.Show;
                Series3.Pointer.Visible := false;
                Series8.Visible := false;
              end;
              4 : begin
                Series4.LinePen.Show;
                Series4.Pointer.Visible := false;
                Series9.Visible := false;
              end;
              5 : begin
                Series5.LinePen.Show;
                Series5.Pointer.Visible := false;
                Series10.Visible := false;
              end;
            end;
          end;
          Chart1.Series[i-1].Visible := false;
        end;
        if (UserSession.GroupBy = gbGrouping) then
        begin
          NumGroupsToUse := UserSession.GroupValues.Count;
          if (NumGroupsToUse > MaxSeries) then NumGroupsToUse := MaxSeries;
          dmDV.cdsGroupingList.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsGroupingList.Lookup('GROUPING',UserSession.GroupValues.Strings[i-1],'GROUPING');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsGroupingList.Close;
        end;
        if (UserSession.GroupBy = gbProvince) then
        begin
          NumGroupsToUse := UserSession.ProvinceValues.Count;
          if (NumGroupsToUse > MaxSeries) then NumGroupsToUse := MaxSeries;
          dmDV.cdsProvinces.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsProvinces.Lookup('DOMAINID',UserSession.ProvinceValues.Strings[i-1],'DOMAINNAME');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsProvinces.Close;
        end;
        if (UserSession.GroupBy = gbTerrane) then
        begin
          NumGroupsToUse := UserSession.TerraneValues.Count;
          if (NumGroupsToUse > MaxSeries) then NumGroupsToUse := MaxSeries;
          dmDV.cdsTerranes.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsTerranes.Lookup('DOMAINID',UserSession.TerraneValues.Strings[i-1],'DOMAINNAME');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsTerranes.Close;
        end;
        if (UserSession.GroupBy = gbLIP) then
        begin
          NumGroupsToUse := UserSession.LIPValues.Count;
          if (NumGroupsToUse > MaxSeries) then NumGroupsToUse := MaxSeries;
          dmDV.cdsLIPS.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsLIPS.Lookup('LIPID',UserSession.LIPValues.Strings[i-1],'LIPNAME');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsLIPs.Close;
        end;
        if (UserSession.GroupBy = gbOrogenicPeriod) then
        begin
          NumGroupsToUse := UserSession.OrogenicPeriodValues.Count;
          if (NumGroupsToUse > MaxSeries) then NumGroupsToUse := MaxSeries;
          dmDV.cdsOrogenicPeriods.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsOrogenicPeriods.Lookup('OROGENICPERIODID',UserSession.OrogenicPeriodValues.Strings[i-1],'OROGENICPERIOD');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsOrogenicPeriods.Close;
        end;
        if (UserSession.GroupBy = gbBoundaryPosition) then
        begin
          NumGroupsToUse := UserSession.BoundaryPositionValues.Count;
          if (NumGroupsToUse > MaxSeries) then NumGroupsToUse := MaxSeries;
          dmDV.cdsBoundaryPositions.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsBoundaryPositions.Lookup('BOUNDPOSID',UserSession.BoundaryPositionValues.Strings[i-1],'BOUNDARYPOSITION');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsBoundaryPositions.Close;
        end;
        if (UserSession.GroupBy = gbChemicalType) then
        begin
          NumGroupsToUse := UserSession.ChemicalTypeValues.Count;
          if (NumGroupsToUse > MaxSeries) then NumGroupsToUse := MaxSeries;
          dmDV.cdsChemTypes.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsChemTypes.Lookup('CHEMTYPEABR',UserSession.ChemicalTypeValues.Strings[i-1],'CHEMICALTYPE');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsChemTypes.Close;
        end;
        for i := 1 to NumGroupsToUse do
        begin
          dmgDV.cdsTempDataDG.Filtered := false;
          dmgDV.cdsTempDataDG.First;
          if (UserSession.GroupBy = gbGrouping) then
            dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.GroupValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbProvince) then
            dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.ProvinceValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbTerrane) then
            dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.TerraneValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbLIP) then
            dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.LIPValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbOrogenicPeriod) then
            dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.OrogenicPeriodValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbBoundaryPosition) then
            dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.BoundaryPositionValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbChemicalType) then
            dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.ChemicalTypeValues.Strings[i-1]+'''';
          dmgDV.cdsTempDataDG.Filtered := true;
          NPts[i] := dmgDV.cdsTempDataDG.RecordCount;
          if (GraphType = gtGroupedWithErrorBars) then
          begin
            case i of
              1 : begin
                Chart1.Series[i-1].Title := UserSession.Group1Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries1.Caption := UserSession.Group1Caption;
              end;
              2 : begin
                Chart1.Series[i-1].Title := UserSession.Group2Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries2.Caption := UserSession.Group2Caption;
              end;
              3 : begin
                Chart1.Series[i-1].Title := UserSession.Group3Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries3.Caption := UserSession.Group3Caption;
              end;
              4 : begin
                Chart1.Series[i-1].Title := UserSession.Group4Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries4.Caption := UserSession.Group4Caption;
              end;
              5 : begin
                Chart1.Series[i-1].Title := UserSession.Group5Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries5.Caption := UserSession.Group5Caption;
              end;
            end;
          end;
          if (GraphType = gtGroupedProbabilityCurves) then
          begin
            case i of
              1 : begin
                Chart1.Series[i-1].Title := UserSession.Group1Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries1.Caption := UserSession.Group1Caption;
              end;
              2 : begin
                Chart1.Series[i-1].Title := UserSession.Group2Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries2.Caption := UserSession.Group2Caption;
              end;
              3 : begin
                Chart1.Series[i-1].Title := UserSession.Group3Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries3.Caption := UserSession.Group3Caption;
              end;
              4 : begin
                Chart1.Series[i-1].Title := UserSession.Group4Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries4.Caption := UserSession.Group4Caption;
              end;
              5 : begin
                Chart1.Series[i-1].Title := UserSession.Group5Caption+' (n='+IntToStr(Npts[i])+')';
                iwcbSeries5.Caption := UserSession.Group5Caption;
              end;
            end;
          end;
        end;
        for i := 1 to MaxSeries do
        begin
          Chart1.Series[i-1].Visible := false;
          case i of
            1 : iwcbSeries1.Visible := false;
            2 : iwcbSeries2.Visible := false;
            3 : iwcbSeries3.Visible := false;
            4 : iwcbSeries4.Visible := false;
            5 : iwcbSeries5.Visible := false;
          end;
        end;
        for i := 1 to NumGroupsToUse do
        begin
          Chart1.Series[i-1].Visible := true;
          case i of
            1 : iwcbSeries1.Visible := true;
            2 : iwcbSeries2.Visible := true;
            3 : iwcbSeries3.Visible := true;
            4 : iwcbSeries4.Visible := true;
            5 : iwcbSeries5.Visible := true;
          end;
        end;
        {VtChDG}
        if (GraphType = gtGroupedWithErrorBars) then
        begin
          MaxPlotSequence := 0;
          for i := 1 to NumGroupsToUse do
          begin
            dmgDV.cdsTempDataDG.Filtered := false;
            dmgDV.cdsTempDataDG.First;
            if (UserSession.GroupBy = gbGrouping) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.GroupValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbProvince) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.ProvinceValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbTerrane) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.TerraneValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbLIP) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.LIPValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbOrogenicPeriod) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.OrogenicPeriodValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbBoundaryPosition) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.BoundaryPositionValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbChemicalType) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.ChemicalTypeValues.Strings[i-1]+'''';
            dmgDV.cdsTempDataDG.Filtered := true;
            if (NPts[i] > 0) then
            begin
              if (GraphType = gtGroupedWithErrorBars) then
              begin
                iPlotSequence := 0;
                dmgDV.cdsTempDataDG.First;
                repeat
                  iPlotSequence := iPlotSequence + 1;
                  GraphDG(i, iPlotSequence);
                  dmgDV.cdsTempDataDG.Next;
                until dmgDV.cdsTempDataDG.EOF;
                if (MaxPlotSequence < iPlotSequence) then MaxPlotSequence := iPlotSequence;
              end;
            end else
            begin
              for k := 1 to Steps do
              begin
                Spectrum2d[k,i] := 0.0;
              end;
            end;
          end;
        end;
        {VtChCG}
        if (GraphType = gtGroupedProbabilityCurves) then
        begin
          for i := 1 to NumGroupsToUse do
          begin
            dmgDV.cdsTempDataDG.Filtered := false;
            dmgDV.cdsTempDataDG.First;
            if (UserSession.GroupBy = gbGrouping) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.GroupValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbProvince) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.ProvinceValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbTerrane) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.TerraneValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbLIP) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.LIPValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbOrogenicPeriod) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.OrogenicPeriodValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbBoundaryPosition) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.BoundaryPositionValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbChemicalType) then
              dmgDV.cdsTempDataDG.Filter := 'Grouping ='+''''+UserSession.ChemicalTypeValues.Strings[i-1]+'''';
            dmgDV.cdsTempDataDG.Filtered := true;
            NPts[i] := dmgDV.cdsTempDataDG.RecordCount;

            for k := 0 to Steps do
            begin
              Spectrum2d[k,i] := 0.0;
            end;
            dmgDV.cdsTempDataDG.First;
            repeat
              tx := dmgDV.cdsTempDataDGAge.AsFloat;
              tx1 := dmgDV.cdsTempDataDGAgeErrorAv.AsFloat;
              if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
              for l := 0 to Steps do
              begin
                X1 := Spectrum2d[l,0];
                tempGauss := Gauss(X1,tx,tx1);
                if (UserSession.PDFType = 'AND') then Spectrum2d[l,i] := Spectrum2d[l,i] + tempGauss;
                if (UserSession.PDFType = 'OR') then
                begin
                  if (Spectrum2d[l,i] < tempGauss) then Spectrum2d[l,i] := tempGauss;
                end;
              end;
              dmgDV.cdsTempDataDG.Next;
            until dmgDV.cdsTempDataDG.EOF;
            dmgDV.cdsTempDataDG.First;
            tempmax[i] := 0.0;
          end;
          for k := 0 to Steps do
          begin
            for l := 1 to NumGroupsToUse do
            begin
              if (tempmax[l] < Spectrum2d[k,l]) then tempmax[l] := Spectrum2d[k,l];
            end;
          end;
          for i := 1 to NumGroupsToUse do
          begin
            if (tempmax[i] <= 0.0) then tempmax[i] := 1.0e-9;
            if (UserSession.NormalisationType = nt100Percent) then
            begin
              tempmax[i] := 100.0/tempmax[i];
            end;
            if (UserSession.NormalisationType = ntTrueProbability) then
            begin
              tempmax[i] := 1.0*Npts[i];
              if (UserSession.PDFType = 'AND') then
              begin
                tempmax[i] := 1.0/tempmax[i];
              end;
              if (UserSession.PDFType = 'OR') then
              begin
                tempmax[i] := 1.0;
              end;
            end;
            if (tempmax[i] <= 0.0) then tempmax[i] := 1.0e-9;
            for k := 0 to Steps do
            begin
              x2 := Spectrum2d[k,0];
              y2 := Spectrum2d[k,i]*tempmax[i];
              if (y2 < MinimumCurveValue) then y2 := 0.0;
              Chart1.Series[i-1].AddXY(x2,y2);
            end;
          end;
          if (GraphType = gtGroupedProbabilityCurves) then
          begin
            {output to clientdataset}
            dmgDV.cdsTempDataProb.Open;
            dmgDV.cdsTempDataProb.EmptyDataSet;
            dmgDV.cdsTempDataProb.Filtered := false;
//Change
            for i := 1 to NumGroupsToUse do
            begin
              case i of
                1 : tmpStr := UserSession.Group1Caption+' (n='+IntToStr(Npts[i])+')';
                2 : tmpStr := UserSession.Group2Caption+' (n='+IntToStr(Npts[i])+')';
                3 : tmpStr := UserSession.Group3Caption+' (n='+IntToStr(Npts[i])+')';
                4 : tmpStr := UserSession.Group4Caption+' (n='+IntToStr(Npts[i])+')';
                5 : tmpStr := UserSession.Group5Caption+' (n='+IntToStr(Npts[i])+')';
              end;
              for k := Steps downto 0 do
              begin
                dmgDV.cdsTempDataProb.Append;
                dmgDV.cdsTempDataProbCurveNumber.AsInteger := i;
                dmgDV.cdsTempDataProbCurveTitle.AsString := tmpStr;
                x2 := Spectrum2d[k,0];
                y2 := Spectrum2d[k,i]*tempmax[i];
                if (y2 < MinimumCurveValue) then y2 := 0.0;
                dmgDV.cdsTempDataProbAge.AsFloat := x2;
                dmgDV.cdsTempDataProbCurveValue.AsFloat := y2;
              end;
            end;
            dmgDV.cdsTempDataProb.First;
          end;
        end;
      end;
    end else
    begin
      {no data to plot}
    end;
    dmgDV.cdsTempDataDG.Filtered := false;
    dmgDV.cdsTempDataDG.First;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX +1;
    if (GraphType = gtGroupedProbabilityCurves) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweXMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweXMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
      if (UserSession.NormalisationType = nt100Percent) then
      begin
        iweYMinimum.Text := FormatFloat('###0.00',0.0);
        iweYMaximum.Text := FormatFloat('###0.00',100.0);
      end else
      begin
        iweYMinimum.Text := FormatFloat('###0.00',Chart1.LeftAxis.Minimum);
        iweYMaximum.Text := FormatFloat('###0.00',Chart1.LeftAxis.Maximum);
      end;
    end;
    if (GraphType = gtGroupedWithErrorBars) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweYMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweYMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
      iweXMinimum.Text := FormatFloat('###0.00',0.0);
      iweXMaximum.Text := FormatFloat('###0.00',MaxPlotSequence);
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
    //dmUser.SetDeveloperData('iweYMinimum 2 GraphDataGrouped = '+iweYMinimum.Text);
    //dmUser.SetDeveloperData('iweYMaximum 2 GraphDataGrouped = '+iweYMaximum.Text);
    //dmUser.SetDeveloperData('StartAtX 2 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.StartAtX));
    //dmUser.SetDeveloperData('EndAtX 2 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.EndAtX));
    //dmUser.SetDeveloperData('iweXMinimum 2 GraphDataGrouped = '+iweXMinimum.Text);
    //dmUser.SetDeveloperData('iweXMaximum 2 GraphDataGrouped = '+iweXMaximum.Text);
    //dmUser.SetDeveloperData('FromAge 2 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.FromAge));
    //dmUser.SetDeveloperData('ToAge 2 GraphDataGrouped = '+FormatFloat('###0.00',UserSession.ToAge));
end;

procedure TIWChartInterpretation.iwbChangeAxisScalesClick(Sender: TObject);
begin
  Chart1.LeftAxis.Automatic := true;
  Chart1.BottomAxis.Automatic := true;
  try
    Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
    Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
    Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
    Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
    iwcbAutomaticScaling.Checked := false;
    Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
    Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
    UserSession.StartAtX := StrToFloat(iweXMinimum.Text);
    UserSession.EndAtX := StrToFloat(iweXMaximum.Text);
    UserSession.StartAtY := StrToFloat(iweYMinimum.Text);
    UserSession.EndAtY := StrToFloat(iweYMaximum.Text);
  except
  end;
end;

procedure TIWChartInterpretation.iwcbAutomaticScalingClick(
  Sender: TObject);
begin
  if not iwcbAutomaticScaling.Checked then
  begin
    try
      Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
      Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
      Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
      Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
    except
    end;
  end;
  Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
  Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
end;

procedure TIWChartInterpretation.iwcbShowErrorBarsClick(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to MaxSeries do
  begin
    case i of
      1 : begin
        Series6.Visible := iwcbShowErrorBars.Checked and iwcbSeries1.Checked;
      end;
      2 : begin
        Series7.Visible := iwcbShowErrorBars.Checked and iwcbSeries2.Checked;
      end;
      3 : begin
        Series8.Visible := iwcbShowErrorBars.Checked and iwcbSeries3.Checked;
      end;
      4 : begin
        Series9.Visible := iwcbShowErrorBars.Checked and iwcbSeries4.Checked;
      end;
      5 : begin
        Series10.Visible := iwcbShowErrorBars.Checked and iwcbSeries5.Checked;
      end;
    end;
  end;
end;

procedure TIWChartInterpretation.iwbExportGraphValuesClick(
  Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
  Spectrum2d : array[0..Steps,0..MaxSeries] of double;
begin
    FDMemTitles.Open;
    FDMemTitles.EmptyDataset;
    if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
        (UserSession.GraphType = gtGalbraith) or
        (UserSession.GraphType = gtInterpretationWithErrorBars)) then
    begin
      FDMemTitles.AppendRecord([UserSession.Interpretation1Caption,UserSession.Interpretation2Caption,
          UserSession.Interpretation3Caption,UserSession.Interpretation4Caption,UserSession.Interpretation5Caption]);
    end;
    if ((UserSession.GraphType = gtGroupedProbabilityCurves) or
        (UserSession.GraphType = gtGroupedWithErrorBars)) then
    begin
      FDMemTitles.AppendRecord([UserSession.Group1Caption,UserSession.Group2Caption,
          UserSession.Group3Caption,UserSession.Group4Caption,UserSession.Group5Caption]);
    end;
    if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
        (UserSession.GraphType = gtGroupedProbabilityCurves)) then
    begin
      //Report1.Template := DefaultFlexCellFolder+'DataProb.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\DataProb.xlsx';
      frFileNameStr := 'CurveData.xlsx';
      dmgDV.cdsTempDataProb.First;
      for i := 1 to MaxSeries do
      begin
        for l := 0 to Steps do
        begin
          Spectrum2d[l,0] := dmgDV.cdsTempDataProbAge.AsFloat;
          Spectrum2d[l,i] := dmgDV.cdsTempDataProbCurveValue.AsFloat;
          dmgDV.cdsTempDataProb.Next;
        end;
      end;
      FDMemProb.Open;
      FDMemProb.EmptyDataset;
      for l := 0 to Steps do
      begin
        FDMemProb.AppendRecord([Spectrum2d[l,0],Spectrum2d[l,1],Spectrum2d[l,2],Spectrum2d[l,3],Spectrum2d[l,4],Spectrum2d[l,5]]);
      end;
    end;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars) or
        (UserSession.GraphType = gtGalbraith)) then
    begin
      FDMemTempDataDI.Open;
      FDMemTempDataDI.EmptyDataset;
      //Report1.Template := DefaultFlexCellFolder+'FlxTempDataDI.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataDI.xlsx';
      frFileNameStr := 'DataDI.xlsx';
      dmgDV.cdsTempDataDI.First;
      repeat
        FDMemTempDataDI.AppendRecord([dmgDV.cdsTempDataDIInterpretation.AsVariant,dmgDV.cdsTempDataDIAge.AsVariant,
              dmgDV.cdsTempDataDISuitName.AsVariant,dmgDV.cdsTempDataDIInterpAbr.AsVariant,
              dmgDV.cdsTempDataDIGrouping.AsVariant,dmgDV.cdsTempDataDIColumnNo.AsVariant,
              dmgDV.cdsTempDataDIAgeErrorAv.AsVariant,dmgDV.cdsTempDataDIAgePlusError.AsVariant,
              dmgDV.cdsTempDataDIAgeMinusError.AsVariant]);
        dmgDV.cdsTempDataDI.Next;
      until dmgDV.cdsTempDataDI.Eof;
    end;
    if ((UserSession.GraphType = gtGroupedWithErrorBars)) then
    begin
      FDMemTempDataDG.Open;
      FDMemTempDataDG.EmptyDataset;
      //Report1.Template := DefaultFlexCellFolder+'FlxTempDataDG.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataDG.xlsx';
      frFileNameStr := 'DataDG.xlsx';
      dmgDV.cdsTempDataDG.First;
      repeat
        FDMemTempDataDG.AppendRecord([dmgDV.cdsTempDataDGGrouping.AsVariant,dmgDV.cdsTempDataDGAge.AsVariant,
              dmgDV.cdsTempDataDGSuitName.AsVariant,dmgDV.cdsTempDataDGInterpAbr.AsVariant,
              dmgDV.cdsTempDataDGInterpretation.AsVariant,dmgDV.cdsTempDataDGColumnNo.AsVariant,
              dmgDV.cdsTempDataDGAgeErrorAv.AsVariant,dmgDV.cdsTempDataDGAgePlusError.AsVariant,
              dmgDV.cdsTempDataDGAgeMinusError.AsVariant]);
        dmgDV.cdsTempDataDG.Next;
      until dmgDV.cdsTempDataDG.Eof;
    end;
    if ((UserSession.GraphType = gtClosureTemperature)) then
    begin
      FDMemTempDataDT.Open;
      FDMemTempDataDT.EmptyDataset;
      //Report1.Template := DefaultFlexCellFolder+'FlxTempDataDT.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataDT.xlsx';
      frFileNameStr := 'DataDT.xlsx';
      dmgDV.cdsTempDataDT.First;
      repeat
        FDMemTempDataDT.AppendRecord([dmgDV.cdsTempDataDTGrouping.AsVariant,dmgDV.cdsTempDataDTMaterialAbr.AsVariant,
              dmgDV.cdsTempDataDTIsoSystem.AsVariant,dmgDV.cdsTempDataDTApproachAbr.AsVariant,
              dmgDV.cdsTempDataDTAge.AsVariant,dmgDV.cdsTempDataDTSuitName.AsVariant,
              dmgDV.cdsTempDataDTColumnNo.AsVariant,dmgDV.cdsTempDataDTAgePlusError.AsVariant,
              dmgDV.cdsTempDataDTAgeMinusError.AsVariant,dmgDV.cdsTempDataDTBlockingT.AsVariant,
              dmgDV.cdsTempDataDTBlockingTUncertainty.AsVariant]);
        dmgDV.cdsTempDataDT.Next;
      until dmgDV.cdsTempDataDT.Eof;
    end;
  {
  tmpPath := WebApplication.UserCacheDir; // by putting the file in the cache folder, it will
                                         // automatically be deleted when the session terminates
  tmpFileName := 'CurveData.xml';
  try
    if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
        (UserSession.GraphType = gtGroupedProbabilityCurves)) then
    begin
      dmgDV.cdsTempDataProb.SaveToFile(tmpPath+tmpFileName,dfXML);
    end;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars) or
        (UserSession.GraphType = gtGalbraith)) then
    begin
      dmgDV.cdsTempDataDI.SaveToFile(tmpPath+tmpFileName,dfXML);
    end;
    if ((UserSession.GraphType = gtGroupedWithErrorBars)) then
    begin
      dmgDV.cdsTempDataDG.SaveToFile(tmpPath+tmpFileName,dfXML);
    end;
    if ((UserSession.GraphType = gtClosureTemperature)) then
    begin
      dmgDV.cdsTempDataDT.SaveToFile(tmpPath+tmpFileName,dfXML);
    end;
    WebApplication.SendFile(tmpPath+tmpFileName,true, '', tmpFileName);
  except
  end;
  }
  //frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxChemTypes.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    //fr.AddTable('FDMemTable1',FDMemTable1);
    if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
        (UserSession.GraphType = gtGroupedProbabilityCurves)) then
    begin
      fr.AddTable('FDMemTitles',FDMemTitles);
      fr.AddTable('FDMemProb',FDMemProb);
    end;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars) or
        (UserSession.GraphType = gtGalbraith)) then
    begin
      fr.AddTable('FDMemTempDataDI',FDMemTempDataDI);
    end;
    if ((UserSession.GraphType = gtGroupedWithErrorBars)) then
    begin
      fr.AddTable('FDMemTempDataDG',FDMemTempDataDG);
    end;
    if ((UserSession.GraphType = gtClosureTemperature)) then
    begin
      fr.AddTable('FDMemTempDataDT',FDMemTempDataDT);
    end;
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

procedure TIWChartInterpretation.iwcbSeries1Click(Sender: TObject);
begin
  if iwcbSeries1.Checked then
  begin
    Chart1.Series[0].ShowInLegend := true;
    Chart1.Series[0].Visible := true;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars)
      or (UserSession.GraphType = gtClosureTemperature)
      or (UserSession.GraphType = gtGroupedWithErrorBars)) then Series6.Visible := true;
  end else
  begin
    Chart1.Series[0].ShowInLegend := false;
    Chart1.Series[0].Visible := false;
    Series6.Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries2Click(Sender: TObject);
begin
  if iwcbSeries2.Checked then
  begin
    Chart1.Series[1].ShowInLegend := true;
    Chart1.Series[1].Visible := true;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars)
      or (UserSession.GraphType = gtClosureTemperature)
      or (UserSession.GraphType = gtGroupedWithErrorBars)) then Series7.Visible := true;
  end else
  begin
    Chart1.Series[1].ShowInLegend := false;
    Chart1.Series[1].Visible := false;
    Series7.Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries3Click(Sender: TObject);
begin
  if iwcbSeries3.Checked then
  begin
    Chart1.Series[2].ShowInLegend := true;
    Chart1.Series[2].Visible := true;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars)
      or (UserSession.GraphType = gtClosureTemperature)
      or (UserSession.GraphType = gtGroupedWithErrorBars)) then Series8.Visible := true;
  end else
  begin
    Chart1.Series[2].ShowInLegend := false;
    Chart1.Series[2].Visible := false;
    Series8.Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries4Click(Sender: TObject);
begin
  if iwcbSeries4.Checked then
  begin
    Chart1.Series[3].ShowInLegend := true;
    Chart1.Series[3].Visible := true;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars)
      or (UserSession.GraphType = gtClosureTemperature)
      or (UserSession.GraphType = gtGroupedWithErrorBars)) then Series9.Visible := true;
  end else
  begin
    Chart1.Series[3].ShowInLegend := false;
    Chart1.Series[3].Visible := false;
    Series9.Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries5Click(Sender: TObject);
begin
  if iwcbSeries5.Checked then
  begin
    Chart1.Series[4].ShowInLegend := true;
    Chart1.Series[4].Visible := true;
    if ((UserSession.GraphType = gtInterpretationWithErrorBars)
      or (UserSession.GraphType = gtClosureTemperature)
      or (UserSession.GraphType = gtGroupedWithErrorBars)) then Series10.Visible := true;
  end else
  begin
    Chart1.Series[4].ShowInLegend := false;
    Chart1.Series[4].Visible := false;
    Series10.Visible := false;
  end;
end;

procedure TIWChartInterpretation.GraphClosureTempGrouped(GraphType : string);
var
  i : integer;
  NPts : array[1..MaxSeries] of integer;
  FromDate, ToDate : double;
  iCode : integer;
  NumGroupsToUse : integer;
  tmpStr : string;
begin
    dmgDV.cdsTempDataDT.IndexFieldNames := 'Age';
    if (UserSession.StartAtX < 0.0) then UserSession.StartAtX := 0.0;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX + 1.0;
    UserSession.StartAtX := 100.0*(Trunc(UserSession.StartAtX) div 100);
    UserSession.EndAtX := 100.0*(Trunc(UserSession.EndAtX) div 100 + 1);
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      if (iCode = 0) then UserSession.StartAtX := FromDate;
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      if (iCode = 0) then UserSession.EndAtX := ToDate;
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
    Chart1.Title.Text.Text := UserSession.GraphType;
    {Plot Grouping graphs}
    if ((GraphType = gtClosureTemperature)) then
    begin
      if ((UserSession.GroupValues.Count > 0)
        or (UserSession.ProvinceValues.Count > 0)
        or (UserSession.TerraneValues.Count > 0)
        or (UserSession.LIPValues.Count > 0)
        or (UserSession.OrogenicPeriodValues.Count > 0)
        or (UserSession.BoundaryPositionValues.Count > 0)
        or (UserSession.ChemicalTypeValues.Count > 0)) then
      begin
        NumGroupsToUse := 5;
        iwcbSeries1.Visible := false;
        iwcbSeries2.Visible := false;
        iwcbSeries3.Visible := false;
        iwcbSeries4.Visible := false;
        iwcbSeries5.Visible := false;
        iwcbSeries1.Text := 'nothing';
        iwcbSeries2.Text := 'nothing';
        iwcbSeries3.Text := 'nothing';
        iwcbSeries4.Text := 'nothing';
        iwcbSeries5.Text := 'nothing';
        for i := 1 to NumGroupsToUse do
        begin
          Chart1.Series[i-1].Clear;
          Chart1.Series[MaxSeries+i-1].Clear;
          if (GraphType = gtClosureTemperature) then
          begin
            Chart1.LeftAxis.Title.Caption := 'Temperature';
            Chart1.BottomAxis.Title.Caption := 'Date';
            Chart1.LeftAxis.Title.Visible := true;
            Chart1.BottomAxis.Title.Visible := true;
            iwcbShowErrorBars.Checked := true;
            iwcbShowErrorBars.Visible := true;
            case i of
              1 : begin
                Series1.LinePen.Hide;
                Series1.Pointer.Visible := true;
                Series6.Visible := true;
                Series6.MultiBar := TMultiBar.mbNone;
              end;
              2 : begin
                Series2.LinePen.Hide;
                Series2.Pointer.Visible := true;
                Series7.Visible := true;
                Series7.MultiBar := TMultiBar.mbNone;
              end;
              3 : begin
                Series3.LinePen.Hide;
                Series3.Pointer.Visible := true;
                Series8.Visible := true;
                Series8.MultiBar := TMultiBar.mbNone;
              end;
              4 : begin
                Series4.LinePen.Hide;
                Series4.Pointer.Visible := true;
                Series9.Visible := true;
                Series9.MultiBar := TMultiBar.mbNone;
              end;
              5 : begin
                Series5.LinePen.Hide;
                Series5.Pointer.Visible := true;
                Series10.Visible := true;
                Series10.MultiBar := TMultiBar.mbNone;
              end;
            end;
          end;
          Chart1.Series[i-1].Visible := false;
        end;
        if (UserSession.GroupBy = gbGrouping) then
        begin
          NumGroupsToUse := UserSession.GroupValues.Count;
          dmDV.cdsGroupingList.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsGroupingList.Lookup('GROUPING',UserSession.GroupValues.Strings[i-1],'GROUPING');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsGroupingList.Close;
        end;
        if (UserSession.GroupBy = gbProvince) then
        begin
          NumGroupsToUse := UserSession.ProvinceValues.Count;
          dmDV.cdsProvinces.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsProvinces.Lookup('DOMAINID',UserSession.ProvinceValues.Strings[i-1],'DOMAINNAME');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsProvinces.Close;
        end;
        if (UserSession.GroupBy = gbTerrane) then
        begin
          NumGroupsToUse := UserSession.TerraneValues.Count;
          dmDV.cdsTerranes.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsTerranes.Lookup('DOMAINID',UserSession.TerraneValues.Strings[i-1],'DOMAINNAME');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsTerranes.Close;
        end;
        if (UserSession.GroupBy = gbLIP) then
        begin
          NumGroupsToUse := UserSession.LIPValues.Count;
          dmDV.cdsLIPS.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsLIPS.Lookup('LIPID',UserSession.LIPValues.Strings[i-1],'LIPNAME');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsLIPS.Close;
        end;
        if (UserSession.GroupBy = gbOrogenicPeriod) then
        begin
          NumGroupsToUse := UserSession.OrogenicPeriodValues.Count;
          dmDV.cdsOrogenicPeriods.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsOrogenicPeriods.Lookup('OROGENICPERIODID',UserSession.OrogenicPeriodValues.Strings[i-1],'OROGENICPERIOD');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsOrogenicPeriods.Close;
        end;
        if (UserSession.GroupBy = gbBoundaryPosition) then
        begin
          NumGroupsToUse := UserSession.BoundaryPositionValues.Count;
          dmDV.cdsBoundaryPositions.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsBoundaryPositions.Lookup('BOUNDPOSID',UserSession.BoundaryPositionValues.Strings[i-1],'BOUNDARYPOSITION');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsBoundaryPositions.Close;
        end;
        if (UserSession.GroupBy = gbChemicalType) then
        begin
          NumGroupsToUse := UserSession.ChemicalTypeValues.Count;
          dmDV.cdsChemTypes.Open;
          for i := 1 to NumGroupsToUse do
          begin
            try
              tmpStr := dmDV.cdsChemTypes.Lookup('CHEMTYPEABR',UserSession.ChemicalTypeValues.Strings[i-1],'CHEMICALTYPE');
              case i of
                1 : begin
                  UserSession.Group1Caption := tmpStr;
                end;
                2 : begin
                  UserSession.Group2Caption := tmpStr;
                end;
                3 : begin
                  UserSession.Group3Caption := tmpStr;
                end;
                4 : begin
                  UserSession.Group4Caption := tmpStr;
                end;
                5 : begin
                  UserSession.Group5Caption := tmpStr;
                end;
              end;
            except
            end;
          end;
          dmDV.cdsChemTypes.Close;
        end;
        for i := 1 to NumGroupsToUse do
        begin
          if (GraphType = gtClosureTemperature) then
          begin
            case i of
              1 : begin
                Chart1.Series[i-1].Title := UserSession.Group1Caption;
                iwcbSeries1.Caption := UserSession.Group1Caption;
              end;
              2 : begin
                Chart1.Series[i-1].Title := UserSession.Group2Caption;
                iwcbSeries2.Caption := UserSession.Group2Caption;
              end;
              3 : begin
                Chart1.Series[i-1].Title := UserSession.Group3Caption;
                iwcbSeries3.Caption := UserSession.Group3Caption;
              end;
              4 : begin
                Chart1.Series[i-1].Title := UserSession.Group4Caption;
                iwcbSeries4.Caption := UserSession.Group4Caption;
              end;
              5 : begin
                Chart1.Series[i-1].Title := UserSession.Group5Caption;
                iwcbSeries5.Caption := UserSession.Group5Caption;
              end;
            end;
          end;
        end;
        for i := 1 to MaxSeries do
        begin
          Chart1.Series[i-1].Visible := false;
          case i of
            1 : iwcbSeries1.Visible := false;
            2 : iwcbSeries2.Visible := false;
            3 : iwcbSeries3.Visible := false;
            4 : iwcbSeries4.Visible := false;
            5 : iwcbSeries5.Visible := false;
          end;
        end;
        for i := 1 to NumGroupsToUse do
        begin
          Chart1.Series[i-1].Visible := true;
          case i of
            1 : iwcbSeries1.Visible := true;
            2 : iwcbSeries2.Visible := true;
            3 : iwcbSeries3.Visible := true;
            4 : iwcbSeries4.Visible := true;
            5 : iwcbSeries5.Visible := true;
          end;
        end;
        if (GraphType = gtClosureTemperature) then
        begin
          for i := 1 to NumGroupsToUse do
          begin
            dmgDV.cdsTempDataDT.Filtered := false;
            dmgDV.cdsTempDataDT.First;
            if (UserSession.GroupBy = gbGrouping) then
              dmgDV.cdsTempDataDT.Filter := 'Grouping ='+''''+UserSession.GroupValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbProvince) then
              dmgDV.cdsTempDataDT.Filter := 'Grouping ='+''''+UserSession.ProvinceValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbTerrane) then
              dmgDV.cdsTempDataDT.Filter := 'Grouping ='+''''+UserSession.TerraneValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbLIP) then
              dmgDV.cdsTempDataDT.Filter := 'Grouping ='+''''+UserSession.LIPValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbOrogenicPeriod) then
              dmgDV.cdsTempDataDT.Filter := 'Grouping ='+''''+UserSession.OrogenicPeriodValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbBoundaryPosition) then
              dmgDV.cdsTempDataDT.Filter := 'Grouping ='+''''+UserSession.BoundaryPositionValues.Strings[i-1]+'''';
            if (UserSession.GroupBy = gbChemicalType) then
              dmgDV.cdsTempDataDT.Filter := 'Grouping ='+''''+UserSession.ChemicalTypeValues.Strings[i-1]+'''';
            dmgDV.cdsTempDataDT.Filtered := true;
            NPts[i] := dmgDV.cdsTempDataDT.RecordCount;
            if (GraphType = gtClosureTemperature) then
            begin
              dmgDV.cdsTempDataDT.First;
              repeat
                GraphDT(i);
                dmgDV.cdsTempDataDT.Next;
              until dmgDV.cdsTempDataDT.EOF;
            end;
          end;
        end;
      end;
    end else
    begin
      {no data to plot}
    end;
    dmgDV.cdsTempDataDT.Filtered := false;
    dmgDV.cdsTempDataDT.First;
    dmgDV.cdsQuerydm.Close;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX +1;
    if (GraphType = gtClosureTemperature) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweXMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweXMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
      iweYMinimum.Text := FormatFloat('###0.00',0.0);
      iweYMaximum.Text := FormatFloat('###0.00',1000.0);
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
end;

procedure TIWChartInterpretation.IWAppFormRender(Sender: TObject);
begin
  if ((UserSession.GraphType = gtInterpretationProbabilityCurves) or
      (UserSession.GraphType = gtGroupedProbabilityCurves)) then
  begin
    iwbExportGraphValues.Visible := true;
  end else
  begin
    iwbExportGraphValues.Visible := UserSession.CanViewPlus;
  end;
  iwcbSeries1.Visible := UserSession.CanViewPlus and (iwcbSeries1.Text <> 'nothing');
  iwcbSeries2.Visible := UserSession.CanViewPlus and (iwcbSeries2.Text <> 'nothing');
  iwcbSeries3.Visible := UserSession.CanViewPlus and (iwcbSeries3.Text <> 'nothing');
  iwcbSeries4.Visible := UserSession.CanViewPlus and (iwcbSeries4.Text <> 'nothing');
  iwcbSeries5.Visible := UserSession.CanViewPlus and (iwcbSeries5.Text <> 'nothing');
end;

end.
