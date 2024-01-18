unit DVIW_chartwtaverage;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, VCLTee.TeEngine, VCLTee.Series,
  Controls, ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, IWCompExtCtrls, IWCompTeeChart,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWHTMLControls, IWCompEdit, IWCompListbox, IWCompLabel, IWVCLBaseControl,
  IWBaseControl, IWControl, IWCompCheckbox, Graphics, IWHTMLTag,
  IWCompButton, IWBaseHTMLControl, VCLTee.TeeURL, VCLTee.TeeSeriesTextEd, VCLTee.ErrorBar,
  VclTee.TeeGDIPlus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TIWChartWtAverage = class(TIWAppForm)
    IWChart1: TIWChart;
    Chart1: TChart;
    iwcbShowLegend: TIWCheckBox;
    iwcbShowBackground: TIWCheckBox;
    iwbClose: TIWButton;
    iwbExportGraphValues: TIWButton;
    Series1: TLineSeries;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweYMinimum: TIWEdit;
    iweXMinimum: TIWEdit;
    iweXMaximum: TIWEdit;
    iweYMaximum: TIWEdit;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    iwbChangeAxisScales: TIWButton;
    iwcbAutomaticScaling: TIWCheckBox;
    iwcbShowErrorBars: TIWCheckBox;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    iwLblWeightedAverage: TIWLabel;
    IWLabel1: TIWLabel;
    iwLblMSWD: TIWLabel;
    iwLblProbofFit: TIWLabel;
    Series5: TLineSeries;
    iwLblComment: TIWLabel;
    IWLabel2: TIWLabel;
    iwePMinimum: TIWEdit;
    IWLabel7: TIWLabel;
    iwePMaximum: TIWEdit;
    iwLblN: TIWLabel;
    Series6: TErrorSeries;
    FDTitles: TFDMemTable;
    FDTitlesApproachID: TStringField;
    FDTitlesApproachDescription: TStringField;
    FDTempDataDI: TFDMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwcbShowLegendClick(Sender: TObject);
    procedure iwcbShowBackgroundClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbChangeAxisScalesClick(Sender: TObject);
    procedure iwcbAutomaticScalingClick(Sender: TObject);
    procedure iwcbShowErrorBarsClick(Sender: TObject);
    procedure iwbExportGraphValuesClick(Sender: TObject);
  private
    procedure CreateChart;
    procedure GraphDI(iSeries, iPlotSequence : integer);
    procedure GraphWeightedAverage(MaxPlotSequence : integer;tMean,tPlus,tMinus : double);    // lines for weighted average and +/- 95% confidence
    procedure GraphDates(GraphType : string);
  public
  end;

implementation

uses IWForm, ServerController, DVIW_dmgraphics, DVIW_constants,
  DVIW_mathproc, DVIW_dm, DBClient, JPEG, TeeJPEG, DVIW_selectgraph;

{$R *.dfm}


procedure TIWChartWtAverage.IWAppFormCreate(Sender: TObject);
begin
  Chart1.BufferedDisplay := false;
  Chart1.Foot.Clear;
  Chart1.Foot.Text.Add(Copyright1);
  Chart1.Foot.Text.Add(Copyright2);
  //iwbExportGraphValues.Visible := UserSession.CanViewPlus;
  CreateChart;
  if ((UserSession.GraphType = gtWeightedAverage)) then
    GraphDates(UserSession.GraphType);
end;

procedure TIWChartWtAverage.CreateChart;
var tmp : TChartSeriesClass;
    tmpSeries : TChartSeries;
begin
  Chart1.Title.Text.Clear;
  Chart1.View3D:=false;
end;

procedure TIWChartWtAverage.iwcbShowLegendClick(Sender: TObject);
begin
  Chart1.Legend.Visible:=iwcbShowLegend.Checked;
end;

procedure TIWChartWtAverage.iwcbShowBackgroundClick(Sender: TObject);
begin
  Chart1.Gradient.Visible:=iwcbShowBackground.Checked;

  if iwcbShowBackground.Checked then
     Chart1.BevelOuter:=bvRaised
  else
     Chart1.BevelOuter:=bvNone;

  Chart1.Color:=clWhite;
end;

procedure TIWChartWtAverage.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSelectGraph.Create(WebApplication).Show;
end;

procedure TIWChartWtAverage.GraphDI(iSeries, iPlotSequence : integer);    // sequencial interpretation dates with error bars
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
  end;
end;

procedure TIWChartWtAverage.GraphWeightedAverage(MaxPlotSequence : integer;tMean,tPlus,tMinus : double);    // lines for weighted average and +/- 95% confidence
var
  i : integer;
begin
  i := 0;
  Chart1.Series[2].AddXY(1.0*i, tMean);
  Chart1.Series[3].AddXY(1.0*i, tPlus);
  Chart1.Series[4].AddXY(1.0*i, tMinus);
  for i := 1 to MaxPlotSequence do
  begin
    Chart1.Series[2].AddXY(1.0*i, tMean);
    Chart1.Series[3].AddXY(1.0*i, tPlus);
    Chart1.Series[4].AddXY(1.0*i, tMinus);
  end;
  i := MaxPlotSequence+1;
  Chart1.Series[2].AddXY(1.0*i, tMean);
  Chart1.Series[3].AddXY(1.0*i, tPlus);
  Chart1.Series[4].AddXY(1.0*i, tMinus);
end;

procedure TIWChartWtAverage.GraphDates(GraphType : string);
var
  i, j, k, l, kstart, iPlotSequence, MaxPlotSequence : integer;
  Icnt : integer;
  X1, X2, Y2, temp, tempRD : real;
  SD1, SD2, t1, tempd : double;
  NPts : array[1..MaxSeries] of integer;
  Spectrum2d : array[0..Steps,1..MaxSeries] of double;
  MaxRows : integer;
  tplus, tminus, tx, tx1 : double;
  FromDate, ToDate : double;
  iCode : integer;
  MaxRowCount : integer;
  tSuitName, tInterpAbr, tInterpretation : string;
  tAge, tAgePlusError, tAgeMinusError, tAgeErrorAv : double;
  tColumnNo : integer;
  NumGroupsToUse : integer;
  MinimumUncertainty : double;
  tmpStr : string;
  tWtAver,tMSWD,tWESDoM,tWOSDoM, tProbOfFit : double;
  tN : integer;
begin
    dmgDV.cdsTempdataDI.IndexFieldNames := 'Age';
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
    Chart1.TopAxis.Automatic := false;
    Chart1.Title.Text.Text := UserSession.GraphType;
    i := 1;
    Chart1.Series[0].Clear;
    Chart1.Series[1].Clear;
    Chart1.Series[2].Clear;
    Chart1.Series[3].Clear;
    Chart1.Series[4].Clear;
    Chart1.Series[5].Clear;
    if (GraphType = gtWeightedAverage) then
    begin
      Chart1.LeftAxis.Title.Visible := true;
      Chart1.BottomAxis.Title.Visible := false;
      iwcbShowErrorBars.Checked := true;
      iwcbShowErrorBars.Visible := true;
      Chart1.Series[0].Title := 'Data';
      Series1.LinePen.Hide;
      Series1.Pointer.Visible := true;
      Series6.Visible := true;
      Series6.MultiBar := TMultiBar.mbNone;
      Chart1.Series[1].Title := 'Probability';
      Series5.LinePen.Show;
      Series5.Pointer.Visible := false;
      Chart1.Series[2].Title := 'Weighted average';
      Series2.LinePen.Show;
      Series2.Pointer.Visible := false;
      Chart1.Series[3].Title := '+95%';
      Series3.LinePen.Show;
      Series3.Pointer.Visible := false;
      Chart1.Series[4].Title := '-95%';
      Series4.LinePen.Show;
      Series4.Pointer.Visible := false;
    end;
    {Plot Interpretation graphs}
    MaxPlotSequence := 0;
    Val(UserSession.MinimumDateUncertainty,MinimumUncertainty,iCode);
    i := 1;
    dmgDV.cdsTempDataDI.Filtered := false;
    dmgDV.cdsTempDataDI.First;
    UserSession.NumberOfPoints := dmgDV.cdsTempDataDI.RecordCount;
    NPts[i] := UserSession.NumberOfPoints;
    dmgDV.WtAverData2(NPts[1],tWtAver,tMSWD,tWESDoM,tWOSDoM,tN);
    tProbOfFit := ProbabilityOfF(tN,999,tMSWD,1);
    iwLblMSWD.Caption := 'MSWD = '+FormatFloat('####0.000',tMSWD);
    iwLblProbOfFit.Caption := 'Prob. of fit = '+FormatFloat('####0.000',tProbOfFit);
    iwLblN.Caption := 'n = '+IntToStr(UserSession.NumberOfPoints);
    iwLblComment.Caption := '';
    if (tProbOfFit > 0.05) then
    begin
      iwLblComment.Caption := 'Data are statistically equivalent';
      GraphWeightedAverage(tN,tWtAver,tWtAver+tWESDoM,tWtAver-tWESDoM);
      iwLblWeightedAverage.Caption := FormatFloat('###0.00',twtAver)+' +/- '+
        FormatFloat('###0.00',tWESDoM)+UserSession.AgeUnitsValue+'  (95% conf.)';
    end else
      iwLblComment.Caption := 'Data are NOT statistically equivalent';
      GraphWeightedAverage(tN,tWtAver,tWtAver+tWOSDoM,tWtAver-tWOSDoM);
      iwLblWeightedAverage.Caption := FormatFloat('###0.00',twtAver)+' +/- '+
        FormatFloat('###0.00',tWOSDoM)+UserSession.AgeUnitsValue+'  (95% conf.)';
    begin
    end;
    {VtChDI}
    if (GraphType = gtWeightedAverage) then
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
    i := 1;
    if (GraphType = gtWeightedAverage) then
    begin
      for k := 1 to Steps do
      begin
        Spectrum2d[k,i] := 0.0;
      end;
      dmgDV.cdsTempDataDI.First;
      repeat
        tx := dmgDV.cdsTempDataDIAge.AsFloat;
        tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
        if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
        for l := 1 to Steps do
        begin
          X1 := UserSession.ToAge + 1.0*l*(UserSession.FromAge-UserSession.ToAge)/Steps;
          Spectrum2d[l,i] := Spectrum2d[l,i] + Gauss(X1,tx,tx1);
        end;
        dmgDV.cdsTempDataDI.Next;
      until dmgDV.cdsTempDataDI.EOF;
    end;
    {VtChCum}
    y2 := 0.0;
    UserSession.NormalisationType := nt100Percent;
    if (GraphType = gtWeightedAverage) then
    begin
      i := 1;
      temp := 0.0;
      for k := 1 to Steps do
      begin
        i := 1;
          if (Spectrum2d[k,i] < 1.0e-3) then Spectrum2d[k,i] := 0.0;
          if (temp < Spectrum2d[k,i]) then temp := Spectrum2d[k,i];
      end;
      if (temp = 0.0) then temp := 1.0e-9;
      for k := 0 to Steps do
      begin
        x2 := UserSession.ToAge + 1.0*k*(UserSession.FromAge-UserSession.ToAge)/Steps;
        if (UserSession.NormalisationType = nt100Percent) then
        begin
          if (k > 0) then y2 := 100.0 * Spectrum2d[k,i]/temp
                     else y2 := 100.0 * Spectrum2d[1,i]/temp;
        end;
        if (UserSession.NormalisationType = ntTrueProbability) then
        begin
          if (NPts[i] > 0) then
          begin
            if (k > 0) then y2 := 100.0 * Spectrum2d[k,i]/(1.0*Npts[i])
                       else y2 := 100.0 * Spectrum2d[1,i]/(1.0*Npts[i]);
          end else
          begin
            y2 := 0.0;
          end;
        end;
        if (y2 < 1.0e-3) then y2 := 0.0;
        Chart1.Series[1].AddXY(y2,x2);
      end;
    end;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX +1;
    if (GraphType = gtWeightedAverage) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      Chart1.TopAxis.Automatic := true;
      iweYMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweYMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
      iweXMinimum.Text := FormatFloat('###0.00',0.0);
      iweXMaximum.Text := FormatFloat('###0.00',MaxPlotSequence+1);
      iwePMinimum.Text := FormatFloat('###0.00',UserSession.StartAtZ);
      iwePMaximum.Text := FormatFloat('###0.00',UserSession.EndAtZ);
      Chart1.LeftAxis.SetMinMax(UserSession.StartAtX,UserSession.EndAtX);
      Chart1.TopAxis.SetMinMax(UserSession.StartAtZ,UserSession.EndAtZ);
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := false;
    Chart1.TopAxis.Automatic := false;
end;

procedure TIWChartWtAverage.iwbChangeAxisScalesClick(Sender: TObject);
var
  iCode : integer;
begin
  Chart1.LeftAxis.Automatic := true;
  Chart1.BottomAxis.Automatic := true;
  try
    Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
    Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
    Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
    Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
    Chart1.TopAxis.Minimum := StrToFloat(iwePMinimum.Text);
    Chart1.TopAxis.Maximum := StrToFloat(iwePMaximum.Text);
    iwcbAutomaticScaling.Checked := false;
    Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
    Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
    Chart1.TopAxis.Automatic := iwcbAutomaticScaling.Checked;
    UserSession.StartAtX := StrToFloat(iweXMinimum.Text);
    UserSession.EndAtX := StrToFloat(iweXMaximum.Text);
    UserSession.StartAtY := StrToFloat(iweYMinimum.Text);
    UserSession.EndAtY := StrToFloat(iweYMaximum.Text);
    UserSession.StartAtZ := StrToFloat(iwePMinimum.Text);
    UserSession.EndAtZ := StrToFloat(iwePMaximum.Text);
  except
  end;
end;

procedure TIWChartWtAverage.iwcbAutomaticScalingClick(
  Sender: TObject);
begin
  if not iwcbAutomaticScaling.Checked then
  begin
    try
      Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
      Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
      Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
      Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
      Chart1.TopAxis.Minimum := StrToFloat(iwePMinimum.Text);
      Chart1.TopAxis.Maximum := StrToFloat(iwePMaximum.Text);
    except
    end;
  end;
  Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
  Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
  Chart1.TopAxis.Automatic := iwcbAutomaticScaling.Checked;
end;

procedure TIWChartWtAverage.iwcbShowErrorBarsClick(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to MaxSeries do
  begin
    case i of
      1 : begin
        Series6.Visible := iwcbShowErrorBars.Checked;
      end;
    end;
  end;
end;

procedure TIWChartWtAverage.iwbExportGraphValuesClick(
  Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
    FDTitles.Open;
    FDTitles.EmptyDataset;
    FDTitles.AppendRecord([UserSession.Interpretation1Caption,UserSession.Interpretation2Caption,
          UserSession.Interpretation3Caption,UserSession.Interpretation4Caption,UserSession.Interpretation5Caption]);
    FDTempDataDI.Open;
    FDTempDataDI.EmptyDataset;
    dmgDV.cdsTempDataDI.First;
    repeat
      FDTempDataDI.AppendRecord([dmgDV.cdsTempDataDIInterpretation.AsVariant,dmgDV.cdsTempDataDIAge.AsVariant,
            dmgDV.cdsTempDataDISuitName.AsVariant,dmgDV.cdsTempDataDIInterpAbr.AsVariant,
            dmgDV.cdsTempDataDIGrouping.AsVariant,dmgDV.cdsTempDataDIColumnNo.AsVariant,
            dmgDV.cdsTempDataDIAgeErrorAv.AsVariant,dmgDV.cdsTempDataDIAgePlusError.AsVariant,
            dmgDV.cdsTempDataDIAgeMinusError.AsVariant]);
      dmgDV.cdsTempDataDI.Next;
    until dmgDV.cdsTempDataDI.Eof;
    try
      if UserSession.CanExport then
      begin
        //Report1.Template := DefaultFlexCellFolder+'FlxTempDataDI.xls';
        frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataDI.xlsx';
        frFileNameStr := 'WeightedAverageData.xls';
        fr := TFlexCelReport.Create(true);
        try
          fr.AddTable('FDTempDataDI',FDTempDataDI);
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
    except
    end;
end;

end.
