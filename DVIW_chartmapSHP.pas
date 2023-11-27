unit DVIW_chartmapSHP;

interface

uses
  Windows, Messages,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids,
  Buttons,
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWCompExtCtrls,
  IWHTMLControls, IWCompEdit, IWCompListbox, IWCompLabel, IWVCLBaseControl,
  IWBaseControl, IWControl, IWCompCheckbox, IWHTMLTag,
  IWCompButton, IWBaseHTMLControl,
  VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.TeeURL, VCLTee.TeeSeriesTextEd, VCLTee.ErrorBar,
  IWCompTeeChart,
  //VCLTee.TeeComma, VCLTee.TeCanvas,
  //VCLTee.TeeInspector, VCLTee.TeeLisB, VCLTee.TeeLegendScrollBar, VCLTee.TeeTools,
  //TeeGLEditor, TeeGDIPlus,
  TeeMapSeries,
  //TeeWorldSeries,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  VCLTee.TeeSHP, VCLTee.TeeMapSeriesEdit,
  VCLTee.TeeJPEG, VCLTee.TeePNG, VCLTee.TeeGIF, VCLTee.TeeSVGCanvas, VCLTee.TeePDFCanvas,
  //VCLTee.TeePSCanvas, VCLTee.TeeVMLCanvas, VCLTee.TeeLighting, VCLTee.TeeEdiGrad,
  //VCLTee.TeeOpenGL, VCLTee.TeeSurfa,
  IWColor, DB, DBClient,
  IWCompGrids, IWDBGrids, VclTee.TeeGDIPlus,
  VCLTee.TeeWorldSeries, VCLTee.TeeSurfa, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TIWChartMapSHP = class(TIWAppForm)
    Chart1: TChart;
    iwcbShowLegend: TIWCheckBox;
    iwcbShowBackground: TIWCheckBox;
    Series1: TLineSeries;
    Series3: TLineSeries;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    iwbClose: TIWButton;
    iwbExportGraphValues: TIWButton;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweYMinimum: TIWEdit;
    iweXMinimum: TIWEdit;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    iweYMaximum: TIWEdit;
    iweXMaximum: TIWEdit;
    iwbChangeAxisScales: TIWButton;
    iwcbAutomaticScaling: TIWCheckBox;
    iwcbSeries1: TIWCheckBox;
    iwcbSeries2: TIWCheckBox;
    iwcbSeries3: TIWCheckBox;
    iwcbSeries4: TIWCheckBox;
    iwcbSeries5: TIWCheckBox;
    IWChart1: TIWChart;
    iwcbIsometric: TIWCheckBox;
    iwcbSeries6: TIWCheckBox;
    Series6: TWorldSeries;
    Chart2: TChart;
    Series7: TWorldSeries;
    FDMemTitles: TFDMemTable;
    FDMemTempDataMap: TFDMemTable;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwcbShowLegendClick(Sender: TObject);
    procedure iwcbShowBackgroundClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbChangeAxisScalesClick(Sender: TObject);
    procedure iwcbAutomaticScalingClick(Sender: TObject);
    procedure LoadMapDetails;
    procedure iwcbSeries1Click(Sender: TObject);
    procedure iwcbSeries2Click(Sender: TObject);
    procedure iwcbSeries3Click(Sender: TObject);
    procedure iwcbSeries4Click(Sender: TObject);
    procedure iwcbSeries5Click(Sender: TObject);
    procedure iwbExportGraphValuesClick(Sender: TObject);
    procedure iwcbIsometricClick(Sender: TObject);
    procedure iwcbSeries6Click(Sender: TObject);
  private
    procedure CreateChart;
    procedure GraphMapByInterpretation(GraphType : string);
    procedure GraphMapByDateBand(GraphType : string);
    procedure GraphMapByInterpretationGrouped(GraphType : string);
    procedure GraphMapByInitialRatioBand(GraphType : string);
  public
  end;

implementation

uses IWForm, ServerController, DVIW_dmgraphics, DVIW_constants,
  JPEG,
  DVIW_dm, DVIW_selectgraph, DVIW_dmopt, usrIW_dm;

{$R *.dfm}


procedure TIWChartMapSHP.IWAppFormCreate(Sender: TObject);
begin
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
  CreateChart;
  LoadMapDetails;
  if (UserSession.GraphType = gtMapInterpretation) then
    GraphMapByInterpretation(UserSession.GraphType);
  if (UserSession.GraphType = gtMapDateBand) then
    GraphMapByDateBand(UserSession.GraphType);
  if (UserSession.GraphType = gtMapInterpretationGrouped) then
    GraphMapByInterpretationGrouped(UserSession.GraphType);
  if (UserSession.GraphType = gtMapInitialRatioBand) then
    GraphMapByInitialRatioBand(UserSession.GraphType);
  if (UserSession.GraphType = gtMapEpsilonBand) then
    GraphMapByInitialRatioBand(UserSession.GraphType);
  if (UserSession.GraphType = gtMapMuBand) then
    GraphMapByInitialRatioBand(UserSession.GraphType);
end;

procedure TIWChartMapSHP.CreateChart;
var tmp : TChartSeriesClass;
    tmpSeries : TChartSeries;
begin
  Chart1.Title.Text.Clear;
  Chart1.View3D:=false;
end;

procedure TIWChartMapSHP.iwcbShowLegendClick(Sender: TObject);
begin
  Chart1.Legend.Visible:=iwcbShowLegend.Checked;
  iwcbAutomaticScalingClick(Sender);
end;

procedure TIWChartMapSHP.iwcbShowBackgroundClick(Sender: TObject);
begin
  Chart1.Gradient.Visible:=iwcbShowBackground.Checked;
  if iwcbShowBackground.Checked then
     Chart1.BevelOuter:=bvRaised
  else
     Chart1.BevelOuter:=bvNone;
  Chart1.Color:=clWhite;
end;

procedure TIWChartMapSHP.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSelectGraph.Create(WebApplication).Show;
end;

// After zooming, make sure both the vertical and horizontal axes
// are "isometric", that is, both have an equal pixel to value size
procedure MakeIsoAxis(AChart:TCustomChart);
var tmpX,tmpY,XRange,YRange,Offset,XYScreen:Double;
begin
  With AChart do
  if (ChartHeight>0) and (ChartWidth>0) then
  begin
    With BottomAxis do
    begin
      if (Maximum > 180.0) then Maximum := 180.0;
      if (Minimum < -180.0) then Minimum := -180.0;
      XRange:=Maximum-Minimum;
    end;
    With LeftAxis do
    begin
      if (Maximum > 90.0) then Maximum := 90.0;
      if (Minimum < -90.0) then Minimum := -90.0;
      YRange:=Maximum-Minimum;
    end;
    XYScreen:=UserSession.HORZSIZE/UserSession.VERTSIZE;
    tmpX:=(XRange/ChartWidth);
    tmpY:=(YRange/ChartHeight)*XYScreen;
    if tmpX>tmpY then
    begin
      if tmpY<>0 then
      begin
        Offset:=((YRange*tmpX/tmpY)-YRange)/2.0;
        With LeftAxis do SetMinMax(Minimum-Offset,Maximum+Offset);
      end;
    end else
    begin
      if tmpX<>0 then
      begin
        Offset:=((XRange*tmpY/tmpX)-XRange)/2.0;
        With BottomAxis do SetMinMax(Minimum-Offset,Maximum+Offset);
      end;
    end;
  end;
end;


procedure TIWChartMapSHP.iwbChangeAxisScalesClick(Sender: TObject);
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
    UserSession.LongitudeMin := StrToFloat(iweXMinimum.Text);
    UserSession.LongitudeMax := StrToFloat(iweXMaximum.Text);
    UserSession.LatitudeMin := StrToFloat(iweYMinimum.Text);
    UserSession.LatitudeMax := StrToFloat(iweYMaximum.Text);
  except
  end;
  // After zooming, set axes isometric
  if iwcbIsometric.Checked then MakeIsoAxis(Chart1);
end;

procedure TIWChartMapSHP.GraphMapByInterpretation(GraphType : string);
var
  i : integer;
begin
  if (UserSession.LongitudeMin < -180.0) then UserSession.LongitudeMin := -180.0;
  if (UserSession.LongitudeMax <= UserSession.LongitudeMin) then UserSession.LongitudeMax := UserSession.LongitudeMin + 1.0;
  if (UserSession.LatitudeMax <= UserSession.LatitudeMin) then UserSession.LatitudeMax := UserSession.LatitudeMin + 1.0;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  Chart1.Title.Text.Text := UserSession.GraphType;
  for i := 1 to MaxSeries do
  begin
    //note change in series value i below to handle map polygons first
    Chart1.Series[i].Clear;
    case i of
      1 : begin
        Chart1.Series[i].Title := UserSession.Interpretation1Caption;
        iwcbSeries1.Caption := UserSession.Interpretation1Caption;
        Series1.LinePen.Hide;
        Series1.Pointer.Visible := true;
      end;
      2 : begin
        Chart1.Series[i].Title := UserSession.Interpretation2Caption;
        iwcbSeries2.Caption := UserSession.Interpretation2Caption;
        Series2.LinePen.Hide;
        Series2.Pointer.Visible := true;
      end;
      3 : begin
        Chart1.Series[i].Title := UserSession.Interpretation3Caption;
        iwcbSeries3.Caption := UserSession.Interpretation3Caption;
        Series3.LinePen.Hide;
        Series3.Pointer.Visible := true;
      end;
      4 : begin
        Chart1.Series[i].Title := UserSession.Interpretation4Caption;
        iwcbSeries4.Caption := UserSession.Interpretation4Caption;
        Series4.LinePen.Hide;
        Series4.Pointer.Visible := true;
      end;
      5 : begin
        Chart1.Series[i].Title := UserSession.Interpretation5Caption;
        iwcbSeries5.Caption := UserSession.Interpretation5Caption;
        Series5.LinePen.Hide;
        Series5.Pointer.Visible := true;
      end;
    end;
  end;
  dmgDV.cdsTempDataMap.First;

  for i := 1 to MaxSeries do
  begin
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    case i of
      1 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Interpretation1Caption+'''';
      2 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Interpretation2Caption+'''';
      3 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Interpretation3Caption+'''';
      4 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Interpretation4Caption+'''';
      5 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Interpretation5Caption+'''';
    end;
    dmgDV.cdsTempDataMap.Filtered := true;
    dmgDV.cdsTempDataMap.First;
    repeat
      if ((dmgDV.cdsTempDataMapLongitude.AsFloat <> 0.0) and
          (dmgDV.cdsTempDataMapLatitude.AsFloat <> 90.0)) then
      begin
        //note change in series value i below to handle map polygons first
        Chart1.Series[i].AddXY(dmgDV.cdsTempDataMapLongitude.AsFloat,dmgDV.cdsTempDataMapLatitude.AsFloat);
      end;
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  dmgDV.cdsTempDataMap.Filtered := false;
  dmgDV.cdsTempDataMap.First;

  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  iweXMinimum.Text := FormatFloat('###0.00',UserSession.LongitudeMin);
  iweXMaximum.Text := FormatFloat('###0.00',UserSession.LongitudeMax);
  iweYMinimum.Text := FormatFloat('###0.00000',UserSession.LatitudeMin);
  iweYMaximum.Text := FormatFloat('###0.00000',UserSession.LatitudeMax);
end;

procedure TIWChartMapSHP.iwcbAutomaticScalingClick(Sender: TObject);
begin
  Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
  Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
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
  // After zooming, set axes isometric
  if iwcbIsometric.Checked then MakeIsoAxis(Chart1);
end;

procedure TIWChartMapSHP.iwcbIsometricClick(Sender: TObject);
begin
  iwcbAutomaticScalingClick(Sender);
end;

procedure TIWChartMapSHP.LoadMapDetails;
// Load a map file and optionally a dBase table with
// map shapes "Z" values.

  procedure TryLoadTable;
  var
    tmp : string;
  begin
    tmp := UserSession.MapDBFName;
    if FileExists(tmp) then
    begin
      dmgDV.cdsTable1.Close;
      dmgDV.cdsTable1.FileName:=ExtractFileName(tmp);
      dmgDV.cdsTable1.Open;
      dmgDV.cdsTable1.First;
    end;
  end;

var
  //tmp : TStrings;
  //tmpGrad : TCustomTeeGradient;
  MapFieldName, MapValueFieldName : string;
begin
  try
    if UserSession.UseDBF then
    begin
      TryLoadTable;
      MapFieldName := UserSession.MapFieldName;
      MapValueFieldName := UserSession.MapValueFieldName;
      try
        LoadMap(Series6,UserSession.MapFileName,dmgDV.cdsTable1,MapFieldName,MapValueFieldName,true);
      finally
        dmgDV.cdsTable1.Close;
      end;
    end else
    begin
      try
        LoadMap(Series6,UserSession.MapFileName);
      except
      end;
    end;
  finally
    Series6.UseColorRange:= true;
    if Series6.UseColorRange then
    begin
      try
        Series6.StartColor:=clLtGray;
        Series6.MidColor:=clWhite;
        Series6.EndColor:=clSilver;
      finally
      end;
    end
    else
    begin
      Series6.UsePalette:=True;
      Series6.PaletteStyle := psPale;
    end;
  end;
end;

procedure TIWChartMapSHP.GraphMapByDateBand(GraphType : string);
var
  i : integer;
begin
  if (UserSession.LongitudeMin < -180.0) then UserSession.LongitudeMin := -180.0;
  if (UserSession.LongitudeMax <= UserSession.LongitudeMin) then UserSession.LongitudeMax := UserSession.LongitudeMin + 1.0;
  if (UserSession.LatitudeMax <= UserSession.LatitudeMin) then UserSession.LatitudeMax := UserSession.LatitudeMin + 1.0;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  Chart1.Title.Text.Text := UserSession.GraphType;
  for i := 1 to MaxSeries do
  begin
    //note change in series value i below to handle map polygons first
    Chart1.Series[i].Clear;
    case i of
      1 : begin
        Chart1.Series[i].Title := UserSession.DateBand1Caption;
        iwcbSeries1.Caption := UserSession.DateBand1Caption;
        Series1.LinePen.Hide;
        Series1.Pointer.Visible := true;
      end;
      2 : begin
        Chart1.Series[i].Title := UserSession.DateBand2Caption;
        iwcbSeries2.Caption := UserSession.DateBand2Caption;
        Series2.LinePen.Hide;
        Series2.Pointer.Visible := true;
      end;
      3 : begin
        Chart1.Series[i].Title := UserSession.DateBand3Caption;
        iwcbSeries3.Caption := UserSession.DateBand3Caption;
        Series3.LinePen.Hide;
        Series3.Pointer.Visible := true;
      end;
      4 : begin
        Chart1.Series[i].Title := UserSession.DateBand4Caption;
        iwcbSeries4.Caption := UserSession.DateBand4Caption;
        Series4.LinePen.Hide;
        Series4.Pointer.Visible := true;
      end;
      5 : begin
        Chart1.Series[i].Title := UserSession.DateBand5Caption;
        iwcbSeries5.Caption := UserSession.DateBand5Caption;
        Series5.LinePen.Hide;
        Series5.Pointer.Visible := true;
      end;
    end;
  end;
  dmgDV.cdsTempDataMap.First;

  for i := 1 to MaxSeries do
  begin
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    case i of
      1 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand1Caption+'''';
      2 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand2Caption+'''';
      3 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand3Caption+'''';
      4 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand4Caption+'''';
      5 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand5Caption+'''';
    end;
    dmgDV.cdsTempDataMap.Filtered := true;
    dmgDV.cdsTempDataMap.First;
    repeat
      if ((dmgDV.cdsTempDataMapLongitude.AsFloat <> 0.0) and
          (dmgDV.cdsTempDataMapLatitude.AsFloat <> 90.0)) then
      begin
        //note change in series value i below to handle map polygons first
        Chart1.Series[i].AddXY(dmgDV.cdsTempDataMapLongitude.AsFloat,dmgDV.cdsTempDataMapLatitude.AsFloat);
      end;
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  dmgDV.cdsTempDataMap.Filtered := false;
  dmgDV.cdsTempDataMap.First;

  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  iweXMinimum.Text := FormatFloat('###0.00',UserSession.LongitudeMin);
  iweXMaximum.Text := FormatFloat('###0.00',UserSession.LongitudeMax);
  iweYMinimum.Text := FormatFloat('###0.00000',UserSession.LatitudeMin);
  iweYMaximum.Text := FormatFloat('###0.00000',UserSession.LatitudeMax);

end;

procedure TIWChartMapSHP.GraphMapByInitialRatioBand(GraphType : string);
var
  i : integer;
begin
  if (UserSession.LongitudeMin < -180.0) then UserSession.LongitudeMin := -180.0;
  if (UserSession.LongitudeMax <= UserSession.LongitudeMin) then UserSession.LongitudeMax := UserSession.LongitudeMin + 1.0;
  if (UserSession.LatitudeMax <= UserSession.LatitudeMin) then UserSession.LatitudeMax := UserSession.LatitudeMin + 1.0;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  Chart1.Title.Text.Text := UserSession.GraphType;
  if (UserSession.GraphType = gtMapEpsilonBand) then dmOpt.GetUserGraphOptions('E');
  if (UserSession.GraphType = gtMapInitialRatioBand) then dmOpt.GetUserGraphOptions('0');
  if (UserSession.GraphType = gtMapMuBand) then dmOpt.GetUserGraphOptions('M');
  for i := 1 to MaxSeries do
  begin
    //note change in series value i below to handle map polygons first
    Chart1.Series[i].Clear;
    case i of
      1 : begin
        Chart1.Series[i].Title := UserSession.ItemBand1Caption;
        iwcbSeries1.Caption := UserSession.ItemBand1Caption;
        Series1.LinePen.Hide;
        Series1.Pointer.Visible := true;
      end;
      2 : begin
        Chart1.Series[i].Title := UserSession.ItemBand2Caption;
        iwcbSeries2.Caption := UserSession.ItemBand2Caption;
        Series2.LinePen.Hide;
        Series2.Pointer.Visible := true;
      end;
      3 : begin
        Chart1.Series[i].Title := UserSession.ItemBand3Caption;
        iwcbSeries3.Caption := UserSession.ItemBand3Caption;
        Series3.LinePen.Hide;
        Series3.Pointer.Visible := true;
      end;
      4 : begin
        Chart1.Series[i].Title := UserSession.ItemBand4Caption;
        iwcbSeries4.Caption := UserSession.ItemBand4Caption;
        Series4.LinePen.Hide;
        Series4.Pointer.Visible := true;
      end;
      5 : begin
        Chart1.Series[i].Title := UserSession.ItemBand5Caption;
        iwcbSeries5.Caption := UserSession.ItemBand5Caption;
        Series5.LinePen.Hide;
        Series5.Pointer.Visible := true;
      end;
    end;
  end;
  dmgDV.cdsTempDataMap.First;
  for i := 1 to MaxSeries do
  begin
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    case i of
      1 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.ItemBand1Caption+'''';
      2 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.ItemBand2Caption+'''';
      3 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.ItemBand3Caption+'''';
      4 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.ItemBand4Caption+'''';
      5 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.ItemBand5Caption+'''';
    end;
    dmgDV.cdsTempDataMap.Filtered := true;
    dmgDV.cdsTempDataMap.First;
    repeat
      if ((dmgDV.cdsTempDataMapLongitude.AsFloat <> 0.0) and
          (dmgDV.cdsTempDataMapLatitude.AsFloat <> 90.0)) then
      begin
        //note change in series value i below to handle map polygons first
        Chart1.Series[i].AddXY(dmgDV.cdsTempDataMapLongitude.AsFloat,dmgDV.cdsTempDataMapLatitude.AsFloat);
      end;
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  dmgDV.cdsTempDataMap.Filtered := false;
  dmgDV.cdsTempDataMap.First;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  iweXMinimum.Text := FormatFloat('###0.00',UserSession.LongitudeMin);
  iweXMaximum.Text := FormatFloat('###0.00',UserSession.LongitudeMax);
  iweYMinimum.Text := FormatFloat('###0.00000',UserSession.LatitudeMin);
  iweYMaximum.Text := FormatFloat('###0.00000',UserSession.LatitudeMax);
end;

procedure TIWChartMapSHP.iwcbSeries1Click(Sender: TObject);
begin
  if iwcbSeries1.Checked then
  begin
    Chart1.Series[1].ShowInLegend := true;
    Chart1.Series[1].Visible := true;
  end else
  begin
    Chart1.Series[1].ShowInLegend := false;
    Chart1.Series[1].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries2Click(Sender: TObject);
begin
  if iwcbSeries2.Checked then
  begin
    Chart1.Series[2].ShowInLegend := true;
    Chart1.Series[2].Visible := true;
  end else
  begin
    Chart1.Series[2].ShowInLegend := false;
    Chart1.Series[2].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries3Click(Sender: TObject);
begin
  if iwcbSeries3.Checked then
  begin
    Chart1.Series[3].ShowInLegend := true;
    Chart1.Series[3].Visible := true;
  end else
  begin
    Chart1.Series[3].ShowInLegend := false;
    Chart1.Series[3].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries4Click(Sender: TObject);
begin
  if iwcbSeries4.Checked then
  begin
    Chart1.Series[4].ShowInLegend := true;
    Chart1.Series[4].Visible := true;
  end else
  begin
    Chart1.Series[4].ShowInLegend := false;
    Chart1.Series[4].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries5Click(Sender: TObject);
begin
  if iwcbSeries5.Checked then
  begin
    Chart1.Series[5].ShowInLegend := true;
    Chart1.Series[5].Visible := true;
  end else
  begin
    Chart1.Series[5].ShowInLegend := false;
    Chart1.Series[5].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries6Click(Sender: TObject);
begin
  if iwcbSeries5.Checked then
  begin
    Chart1.Series[0].ShowInLegend := true;
    //Chart1.Series[0].Visible := true;
    Series6.Visible := true;
  end else
  begin
    Chart1.Series[0].ShowInLegend := false;
    //Chart1.Series[0].Visible := false;
    Series6.Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwbExportGraphValuesClick(Sender: TObject);
const
  DataTypeID : integer = 2;   //Summary data
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  i : integer;
  MaxAllowed : integer;
begin
  //First, define the titles for each category
  FDMemTitles.Open;
  FDMemTitles.EmptyDataset;
  if (UserSession.GraphType = gtMapInterpretation) then
  begin
    FDMemTitles.AppendRecord([UserSession.Interpretation1Caption,UserSession.Interpretation2Caption,
        UserSession.Interpretation3Caption,UserSession.Interpretation4Caption,UserSession.Interpretation5Caption]);
  end;
  if (UserSession.GraphType = gtMapDateBand) then
  begin
    FDMemTitles.AppendRecord([UserSession.Group1Caption,UserSession.Group2Caption,
        UserSession.Group3Caption,UserSession.Group4Caption,UserSession.Group5Caption]);
  end;
  if (UserSession.GraphType = gtMapInterpretationGrouped) then
  begin
    FDMemTitles.AppendRecord([UserSession.Group1Caption,UserSession.Group2Caption,
        UserSession.Group3Caption,UserSession.Group4Caption,UserSession.Group5Caption]);
  end;
  if ((UserSession.GraphType = gtMapInitialRatioBand) or (UserSession.GraphType = gtMapEpsilonBand)
   or (UserSession.GraphType = gtMapMuBand)) then
  begin
    FDMemTitles.AppendRecord([UserSession.ItemBand1Caption,UserSession.ItemBand2Caption,
        UserSession.ItemBand3Caption,UserSession.ItemBand4Caption,UserSession.ItemBand5Caption]);
  end;
  //Now, organise the data for output
  MaxAllowed := dmUser.GetUserRowLimit(UserSession.UserID,DataTypeID);
  if (UserSession.GraphType = gtMapInterpretation) then
  begin
    FDMemTempDataMap.Open;
    FDMemTempDataMap.EmptyDataset;
    //Report1.Template := WebApplication.ApplicationPath+DefaultFlexCellFolder+'FlxTempDataMapInterp.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataMapInterp.xlsx';
    dmgDV.cdsTempDataMap.First;
    i := 1;
    repeat
      FDMemTempDataMap.AppendRecord([dmgDV.cdsTempDataMapInterpretation.AsVariant,dmgDV.cdsTempDataMapAgeBand.AsVariant,
            dmgDV.cdsTempDataMapInterpAbr.AsVariant,dmgDV.cdsTempDataMapColumnNo.AsVariant,
            dmgDV.cdsTempDataMapSampleNo.AsVariant,dmgDV.cdsTempDataMapAge.AsVariant,
            dmgDV.cdsTempDataMapAgePlus.AsVariant,dmgDV.cdsTempDataMapAgeMinus.AsVariant,
            dmgDV.cdsTempDataMapLatitude.AsVariant,dmgDV.cdsTempDataMapLongitude.AsVariant,
            dmgDV.cdsTempDataMapElevation.AsVariant,dmgDV.cdsTempDataMapColumnNoDate.AsVariant,
            dmgDV.cdsTempDataMapRecordID.AsVariant]);
      dmgDV.cdsTempDataMap.Next;
      i := i + 1;
    until ((dmgDV.cdsTempDataMap.Eof) or (i > MaxAllowed));
  end;
  if (UserSession.GraphType = gtMapDateBand) then
  begin
    FDMemTempDataMap.Open;
    FDMemTempDataMap.EmptyDataset;
    //Report1.Template := DefaultFlexCellFolder+'FlxTempDataMapAgeBand.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataMapAgeBand.xlsx';
    dmgDV.cdsTempDataMap.First;
    i := 1;
    repeat
      FDMemTempDataMap.AppendRecord([dmgDV.cdsTempDataMapInterpretation.AsVariant,dmgDV.cdsTempDataMapAgeBand.AsVariant,
            dmgDV.cdsTempDataMapInterpAbr.AsVariant,dmgDV.cdsTempDataMapColumnNo.AsVariant,
            dmgDV.cdsTempDataMapSampleNo.AsVariant,dmgDV.cdsTempDataMapAge.AsVariant,
            dmgDV.cdsTempDataMapAgePlus.AsVariant,dmgDV.cdsTempDataMapAgeMinus.AsVariant,
            dmgDV.cdsTempDataMapLatitude.AsVariant,dmgDV.cdsTempDataMapLongitude.AsVariant,
            dmgDV.cdsTempDataMapElevation.AsVariant,dmgDV.cdsTempDataMapColumnNoDate.AsVariant,
            dmgDV.cdsTempDataMapRecordID.AsVariant]);
      dmgDV.cdsTempDataMap.Next;
      i := i + 1;
    until ((dmgDV.cdsTempDataMap.Eof) or (i > MaxAllowed));
  end;
  if (UserSession.GraphType = gtMapInterpretationGrouped) then
  begin
    FDMemTempDataMap.Open;
    FDMemTempDataMap.EmptyDataset;
    //Report1.Template := WebApplication.ApplicationPath+DefaultFlexCellFolder+'FlxTempDataMapInterp.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataMapInterp.xlsx';
    dmgDV.cdsTempDataMap.First;
    i := 1;
    repeat
      FDMemTempDataMap.AppendRecord([dmgDV.cdsTempDataMapInterpretation.AsVariant,dmgDV.cdsTempDataMapAgeBand.AsVariant,
            dmgDV.cdsTempDataMapInterpAbr.AsVariant,dmgDV.cdsTempDataMapColumnNo.AsVariant,
            dmgDV.cdsTempDataMapSampleNo.AsVariant,dmgDV.cdsTempDataMapAge.AsVariant,
            dmgDV.cdsTempDataMapAgePlus.AsVariant,dmgDV.cdsTempDataMapAgeMinus.AsVariant,
            dmgDV.cdsTempDataMapLatitude.AsVariant,dmgDV.cdsTempDataMapLongitude.AsVariant,
            dmgDV.cdsTempDataMapElevation.AsVariant,dmgDV.cdsTempDataMapColumnNoDate.AsVariant,
            dmgDV.cdsTempDataMapRecordID.AsVariant]);
      dmgDV.cdsTempDataMap.Next;
      i := i + 1;
    until ((dmgDV.cdsTempDataMap.Eof) or (i > MaxAllowed));
  end;
  if ((UserSession.GraphType = gtMapInitialRatioBand) or (UserSession.GraphType = gtMapEpsilonBand)
   or (UserSession.GraphType = gtMapMuBand)) then
  begin
    FDMemTempDataMap.Open;
    FDMemTempDataMap.EmptyDataset;
    //Report1.Template := DefaultFlexCellFolder+'FlxTempDataMapRatioBand.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataMapRatioBand.xlsx';
    dmgDV.cdsTempDataMap.First;
    i := 1;
    repeat
      FDMemTempDataMap.AppendRecord([dmgDV.cdsTempDataMapInterpretation.AsVariant,dmgDV.cdsTempDataMapAgeBand.AsVariant,
            dmgDV.cdsTempDataMapInterpAbr.AsVariant,dmgDV.cdsTempDataMapColumnNo.AsVariant,
            dmgDV.cdsTempDataMapSampleNo.AsVariant,dmgDV.cdsTempDataMapAge.AsVariant,
            dmgDV.cdsTempDataMapAgePlus.AsVariant,dmgDV.cdsTempDataMapAgeMinus.AsVariant,
            dmgDV.cdsTempDataMapLatitude.AsVariant,dmgDV.cdsTempDataMapLongitude.AsVariant,
            dmgDV.cdsTempDataMapElevation.AsVariant,dmgDV.cdsTempDataMapColumnNoDate.AsVariant,
            dmgDV.cdsTempDataMapRecordID.AsVariant]);
      dmgDV.cdsTempDataMap.Next;
      i := i + 1;
    until ((dmgDV.cdsTempDataMap.Eof) or (i > MaxAllowed));
  end;
  if (i > MaxAllowed) then
  begin
    WebApplication.ShowMessage('Only the first '+IntToStr(MaxAllowed)+' records will be downloaded');
  end;
  //frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxChemTypes.xlsx';
  frFileNameStr := 'MapData.xlsx';
  fr := TFlexCelReport.Create(true);
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
end;

procedure TIWChartMapSHP.GraphMapByInterpretationGrouped(GraphType : string);
var
  i : integer;
  tmpStr : string;
  NumGroupsToUse : integer;
begin
  NumGroupsToUse := MaxSeries;
  {
  iwcbSeries1.Visible := false;
  iwcbSeries2.Visible := false;
  iwcbSeries3.Visible := false;
  iwcbSeries4.Visible := false;
  iwcbSeries5.Visible := false;
  Series1.Visible := false;
  Series2.Visible := false;
  Series3.Visible := false;
  Series4.Visible := false;
  Series5.Visible := false;
  }
  if (UserSession.LongitudeMin < -180.0) then UserSession.LongitudeMin := -180.0;
  if (UserSession.LongitudeMax <= UserSession.LongitudeMin) then UserSession.LongitudeMax := UserSession.LongitudeMin + 1.0;
  if (UserSession.LatitudeMax <= UserSession.LatitudeMin) then UserSession.LatitudeMax := UserSession.LatitudeMin + 1.0;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  Chart1.Title.Text.Text := UserSession.GraphType;
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
    //note change in series value i below to handle map polygons first
    Chart1.Series[i].Clear;
    case i of
      1 : begin
        Chart1.Series[i].Title := UserSession.Group1Caption;
        iwcbSeries1.Caption := UserSession.Group1Caption;
        if UserSession.CanViewPlus then iwcbSeries1.Visible := false;
        Series1.LinePen.Hide;
        Series1.Pointer.Visible := true;
        Series1.Visible := true;
      end;
      2 : begin
        Chart1.Series[i].Title := UserSession.Group2Caption;
        iwcbSeries2.Caption := UserSession.Group2Caption;
        if UserSession.CanViewPlus then iwcbSeries2.Visible := false;
        Series2.LinePen.Hide;
        Series2.Pointer.Visible := true;
        Series2.Visible := true;
      end;
      3 : begin
        Chart1.Series[i].Title := UserSession.Group3Caption;
        iwcbSeries3.Caption := UserSession.Group3Caption;
        if UserSession.CanViewPlus then iwcbSeries3.Visible := false;
        Series3.LinePen.Hide;
        Series3.Pointer.Visible := true;
        Series3.Visible := true;
      end;
      4 : begin
        Chart1.Series[i].Title := UserSession.Group4Caption;
        iwcbSeries4.Caption := UserSession.Group4Caption;
        if UserSession.CanViewPlus then iwcbSeries4.Visible := false;
        Series4.LinePen.Hide;
        Series4.Pointer.Visible := true;
        Series4.Visible := true;
      end;
      5 : begin
        Chart1.Series[i].Title := UserSession.Group5Caption;
        iwcbSeries5.Caption := UserSession.Group5Caption;
        if UserSession.CanViewPlus then iwcbSeries5.Visible := false;
        Series5.LinePen.Hide;
        Series5.Pointer.Visible := true;
        Series5.Visible := true;
      end;
    end;
  end;
  dmgDV.cdsTempDataMap.First;

  for i := 1 to NumGroupsToUse do
  begin
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    case i of
      1 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Group1Caption+'''';
      2 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Group2Caption+'''';
      3 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Group3Caption+'''';
      4 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Group4Caption+'''';
      5 : dmgDV.cdsTempDataMap.Filter := 'Interpretation ='+''''+UserSession.Group5Caption+'''';
    end;
    dmgDV.cdsTempDataMap.Filtered := true;
    dmgDV.cdsTempDataMap.First;
    repeat
      if ((dmgDV.cdsTempDataMapLongitude.AsFloat <> 0.0) and
          (dmgDV.cdsTempDataMapLatitude.AsFloat <> 90.0)) then
      begin
        {note change in series value i below to handle map polygons first}
        Chart1.Series[i].AddXY(dmgDV.cdsTempDataMapLongitude.AsFloat,dmgDV.cdsTempDataMapLatitude.AsFloat);
      end;
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  dmgDV.cdsTempDataMap.Filtered := false;
  dmgDV.cdsTempDataMap.First;

  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  iweXMinimum.Text := FormatFloat('###0.00',UserSession.LongitudeMin);
  iweXMaximum.Text := FormatFloat('###0.00',UserSession.LongitudeMax);
  iweYMinimum.Text := FormatFloat('###0.00000',UserSession.LatitudeMin);
  iweYMaximum.Text := FormatFloat('###0.00000',UserSession.LatitudeMax);
end;

end.
