unit DVIW_chartinit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, VCLTee.TeEngine, VCLTee.Series,
  Controls, ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, IWCompExtCtrls, IWCompTeeChart,
  IWHTMLControls, IWCompEdit, IWCompListbox, IWCompLabel, IWVCLBaseControl,
  IWBaseControl, IWControl, IWCompCheckbox, Graphics, IWHTMLTag,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWCompButton, IWBaseHTMLControl, VCLTee.TeeURL, VCLTee.TeeSeriesTextEd, VCLTee.ErrorBar,
  VclTee.TeeGDIPlus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TIWChartInit = class(TIWAppForm)
    IWChart1: TIWChart;
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
    FDMemTitles: TFDMemTable;
    FDMemTempDataI: TFDMemTable;
    FDMemTempDataIG: TFDMemTable;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWButton1Click(Sender: TObject);
    procedure iwcbShowLegendClick(Sender: TObject);
    procedure iwcbShowBackgroundClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbChangeAxisScalesClick(Sender: TObject);
    procedure iwcbAutomaticScalingClick(Sender: TObject);
    procedure iwcbSeries1Click(Sender: TObject);
    procedure iwcbSeries2Click(Sender: TObject);
    procedure iwcbSeries3Click(Sender: TObject);
    procedure iwcbSeries4Click(Sender: TObject);
    procedure iwcbSeries5Click(Sender: TObject);
    procedure iwbExportGraphValuesClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  private
    procedure CreateChart;
    procedure GraphInitByInterpretation(GraphType : string);
    procedure GraphInitGrouped(GraphType : string);
  public
  end;

implementation

uses IWForm, ServerController, DVIW_dmgraphics, DVIW_constants,
  DVIW_dm, DBClient, JPEG, TeeJPEG, DVIW_selectgraph;

{$R *.dfm}


procedure TIWChartInit.IWAppFormCreate(Sender: TObject);
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
  if ((UserSession.GraphType = gtInitialRatio) or
      (UserSession.GraphType = gtEpsilon) or
      (UserSession.GraphType = gtMu)) then
    GraphInitByInterpretation(UserSession.GraphType);
  if ((UserSession.GraphType = gtInitialRatioGrouped) or
      (UserSession.GraphType = gtEpsilonGrouped) or
      (UserSession.GraphType = gtMuGrouped)) then
    GraphInitGrouped(UserSession.GraphType);
end;

procedure TIWChartInit.IWAppFormRender(Sender: TObject);
begin
  iwcbSeries1.Visible := UserSession.CanViewPlus and (iwcbSeries1.Text <> 'nothing');
  iwcbSeries2.Visible := UserSession.CanViewPlus and (iwcbSeries2.Text <> 'nothing');
  iwcbSeries3.Visible := UserSession.CanViewPlus and (iwcbSeries3.Text <> 'nothing');
  iwcbSeries4.Visible := UserSession.CanViewPlus and (iwcbSeries4.Text <> 'nothing');
  iwcbSeries5.Visible := UserSession.CanViewPlus and (iwcbSeries5.Text <> 'nothing');
end;

procedure TIWChartInit.CreateChart;
var tmp : TChartSeriesClass;
    tmpSeries : TChartSeries;
begin
  Chart1.Title.Text.Clear;

  Chart1.View3D:=false;
end;

procedure TIWChartInit.IWButton1Click(Sender: TObject);
begin
  CreateChart;
end;

procedure TIWChartInit.iwcbShowLegendClick(Sender: TObject);
begin
  Chart1.Legend.Visible:=iwcbShowLegend.Checked;
end;

procedure TIWChartInit.iwcbShowBackgroundClick(Sender: TObject);
begin
  Chart1.Gradient.Visible:=iwcbShowBackground.Checked;

  if iwcbShowBackground.Checked then
     Chart1.BevelOuter := bvRaised
  else
     Chart1.BevelOuter := bvNone;

  Chart1.Color:=clWhite;
end;

procedure TIWChartInit.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSelectgraph.Create(WebApplication).Show;
end;

procedure TIWChartInit.iwbChangeAxisScalesClick(Sender: TObject);
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
    {
    Chart1.Axes.Left.SetMinMax(24,50);
    }
    UserSession.StartAtX := StrToFloat(iweXMinimum.Text);
    UserSession.EndAtX := StrToFloat(iweXMaximum.Text);
    UserSession.StartAtY := StrToFloat(iweYMinimum.Text);
    UserSession.EndAtY := StrToFloat(iweYMaximum.Text);
  except
  end;
end;

procedure TIWChartInit.GraphInitByInterpretation(GraphType : string);
var
  i : integer;
  VarbNo11, VarbNo12 : integer;
  tmpStr : string;
  FromDate, ToDate : double;
  iCode : integer;
begin
  dmgDV.cdsVariables.Open;
  Chart1.BottomAxis.Title.Caption := dmgDV.cdsVariables.Lookup('VariableAbr',UserSession.AxisChoiceX,'VariableName');
  Chart1.LeftAxis.Title.Caption := dmgDV.cdsVariables.Lookup('VariableAbr',UserSession.AxisChoiceY,'VariableName');
  dmgDV.cdsVariables.Close;
  if (UserSession.StartAtX < 0.0) then UserSession.StartAtX := 0.0;
  if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX + 1.0;
  if (UserSession.EndAtY <= UserSession.StartAtY) then UserSession.EndAtY := UserSession.StartAtY + 1.0;
  if Pos('DATE',UserSession.AxisChoiceX) > 0 then
  begin
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
  end;
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
  for i := 1 to MaxSeries do
  begin
    Chart1.Series[i-1].Clear;
    case i of
      1 : begin
        Chart1.Series[i-1].Title := UserSession.Interpretation1Caption;
        iwcbSeries1.Caption := UserSession.Interpretation1Caption;
        Series1.LinePen.Hide;
        Series1.Pointer.Visible := true;
      end;
      2 : begin
        Chart1.Series[i-1].Title := UserSession.Interpretation2Caption;
        iwcbSeries2.Caption := UserSession.Interpretation2Caption;
        Series2.LinePen.Hide;
        Series2.Pointer.Visible := true;
      end;
      3 : begin
        Chart1.Series[i-1].Title := UserSession.Interpretation3Caption;
        iwcbSeries3.Caption := UserSession.Interpretation3Caption;
        Series3.LinePen.Hide;
        Series3.Pointer.Visible := true;
      end;
      4 : begin
        Chart1.Series[i-1].Title := UserSession.Interpretation4Caption;
        iwcbSeries4.Caption := UserSession.Interpretation4Caption;
        Series4.LinePen.Hide;
        Series4.Pointer.Visible := true;
      end;
      5 : begin
        Chart1.Series[i-1].Title := UserSession.Interpretation5Caption;
        iwcbSeries5.Caption := UserSession.Interpretation5Caption;
        Series5.LinePen.Hide;
        Series5.Pointer.Visible := true;
      end;
    end;
  end;
  dmgDV.cdsTempDataI.First;

  for i := 1 to MaxSeries do
  begin
    dmgDV.cdsTempDataI.Filtered := false;
    dmgDV.cdsTempDataI.First;
    case i of
      1 : dmgDV.cdsTempDataI.Filter := 'Interpretation ='+''''+UserSession.Interpretation1Caption+'''';
      2 : dmgDV.cdsTempDataI.Filter := 'Interpretation ='+''''+UserSession.Interpretation2Caption+'''';
      3 : dmgDV.cdsTempDataI.Filter := 'Interpretation ='+''''+UserSession.Interpretation3Caption+'''';
      4 : dmgDV.cdsTempDataI.Filter := 'Interpretation ='+''''+UserSession.Interpretation4Caption+'''';
      5 : dmgDV.cdsTempDataI.Filter := 'Interpretation ='+''''+UserSession.Interpretation5Caption+'''';
    end;
    dmgDV.cdsTempDataI.Filtered := true;
    dmgDV.cdsTempDataI.First;
    repeat
      if ((dmgDV.cdsTempDataIVariableX.AsFloat <> 0.0)) then
      begin
        Chart1.Series[i-1].AddXY(dmgDV.cdsTempDataIVariableX.AsFloat,dmgDV.cdsTempDataIVariableY.AsFloat);
      end;
      dmgDV.cdsTempDataI.Next;
    until dmgDV.cdsTempDataI.Eof;
  end;
  dmgDV.cdsTempDataI.Filtered := false;
  dmgDV.cdsTempDataI.First;

  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  iweXMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
  iweXMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
  iweYMinimum.Text := FormatFloat('###0.00000',UserSession.StartAtY);
  iweYMaximum.Text := FormatFloat('###0.00000',UserSession.EndAtY);
end;


procedure TIWChartInit.iwcbAutomaticScalingClick(Sender: TObject);
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

procedure TIWChartInit.iwcbSeries1Click(Sender: TObject);
begin
  if iwcbSeries1.Checked then
  begin
    Chart1.Series[0].ShowInLegend := true;
    Chart1.Series[0].Visible := true;
  end else
  begin
    Chart1.Series[0].ShowInLegend := false;
    Chart1.Series[0].Visible := false;
  end;
end;

procedure TIWChartInit.iwcbSeries2Click(Sender: TObject);
begin
  if iwcbSeries2.Checked then
  begin
    Chart1.Series[1].ShowInLegend := true;
    Chart1.Series[1].Visible := true;
  end else
  begin
    Chart1.Series[1].ShowInLegend := false;
    Chart1.Series[1].Visible := false;
  end;
end;

procedure TIWChartInit.iwcbSeries3Click(Sender: TObject);
begin
  if iwcbSeries3.Checked then
  begin
    Chart1.Series[2].ShowInLegend := true;
    Chart1.Series[2].Visible := true;
  end else
  begin
    Chart1.Series[2].ShowInLegend := false;
    Chart1.Series[2].Visible := false;
  end;
end;

procedure TIWChartInit.iwcbSeries4Click(Sender: TObject);
begin
  if iwcbSeries4.Checked then
  begin
    Chart1.Series[3].ShowInLegend := true;
    Chart1.Series[3].Visible := true;
  end else
  begin
    Chart1.Series[3].ShowInLegend := false;
    Chart1.Series[3].Visible := false;
  end;
end;

procedure TIWChartInit.iwcbSeries5Click(Sender: TObject);
begin
  if iwcbSeries5.Checked then
  begin
    Chart1.Series[4].ShowInLegend := true;
    Chart1.Series[4].Visible := true;
  end else
  begin
    Chart1.Series[4].ShowInLegend := false;
    Chart1.Series[4].Visible := false;
  end;
end;

procedure TIWChartInit.iwbExportGraphValuesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
    FDMemTitles.Open;
    FDMemTitles.EmptyDataset;
    if ((UserSession.GraphType = gtInitialRatio) or
        (UserSession.GraphType = gtEpsilon) or
        (UserSession.GraphType = gtMu)) then
    begin
      FDMemTitles.AppendRecord([UserSession.Interpretation1Caption,UserSession.Interpretation2Caption,
          UserSession.Interpretation3Caption,UserSession.Interpretation4Caption,UserSession.Interpretation5Caption]);
    end;
    if ((UserSession.GraphType = gtInitialRatioGrouped) or
        (UserSession.GraphType = gtEpsilonGrouped) or
        (UserSession.GraphType = gtMuGrouped)) then
    begin
      FDMemTitles.AppendRecord([UserSession.Group1Caption,UserSession.Group2Caption,
          UserSession.Group3Caption,UserSession.Group4Caption,UserSession.Group5Caption]);
    end;
    if ((UserSession.GraphType = gtInitialRatio) or
        (UserSession.GraphType = gtEpsilon) or
        (UserSession.GraphType = gtMu)) then
    begin
      FDMemTempDataI.Open;
      FDMemTempDataI.EmptyDataset;
      //Report1.Template := DefaultFlexCellFolder+'FlxTempDataI.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataI.xlsx';
      dmgDV.cdsTempDataI.First;
      repeat
        FDMemTempDataI.AppendRecord([dmgDV.cdsTempDataIInterpretation.AsVariant,dmgDV.cdsTempDataIPlotNo.AsVariant,
              dmgDV.cdsTempDataIColumnNo.AsVariant,
              dmgDV.cdsTempDataIVariableX.AsVariant,dmgDV.cdsTempDataIVariableY.AsVariant,
              dmgDV.cdsTempDataIGrouping.AsVariant]);
        dmgDV.cdsTempDataI.Next;
      until dmgDV.cdsTempDataI.Eof;
    end;
    if ((UserSession.GraphType = gtInitialRatioGrouped) or
        (UserSession.GraphType = gtEpsilonGrouped) or
        (UserSession.GraphType = gtMuGrouped)) then
    begin
      FDMemTempDataI.Open;
      FDMemTempDataI.EmptyDataset;
      //Report1.Template := DefaultFlexCellFolder+'FlxTempDataIG.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxTempDataIG.xlsx';
      dmgDV.cdsTempDataI.First;
      repeat
        FDMemTempDataIG.AppendRecord([dmgDV.cdsTempDataIGrouping.AsVariant,dmgDV.cdsTempDataIInterpretation.AsVariant,
              dmgDV.cdsTempDataIPlotNo.AsVariant,dmgDV.cdsTempDataIColumnNo.AsVariant,
              dmgDV.cdsTempDataIVariableX.AsVariant,dmgDV.cdsTempDataIVariableY.AsVariant]);
        dmgDV.cdsTempDataI.Next;
      until dmgDV.cdsTempDataI.Eof;
    end;
  //frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxChemTypes.xlsx';
  frFileNameStr := 'InitialRatioData.xlsx';
  fr := TFlexCelReport.Create(true);
  try
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

procedure TIWChartInit.GraphInitGrouped(GraphType : string);
var
  i, MaxPlotSequence : integer;
  X1, X2, Y2, tempRD : real;
  tempd : double;
  NPts : array[1..MaxSeries] of integer;
  tplus, tminus, tx, tx1 : double;
  FromDate, ToDate : double;
  iCode : integer;
  tSuitName, tInterpAbr, tInterpretation : string;
  NumGroupsToUse : integer;
  tmpStr : string;
begin
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX + 1.0;
    UserSession.StartAtX := 100.0*(Trunc(UserSession.StartAtX) div 100);
    UserSession.EndAtX := 100.0*(Trunc(UserSession.EndAtX) div 100 + 1);
    if (UserSession.EndAtY <= UserSession.StartAtY) then UserSession.EndAtY := UserSession.StartAtY + 1.0;
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
    if ((GraphType = gtInitialRatioGrouped) or
        (GraphType = gtEpsilonGrouped) or
        (GraphType = gtMuGrouped)) then
    begin
      if ((UserSession.GroupValues.Count > 0)
        or (UserSession.ProvinceValues.Count > 0)
        or (UserSession.TerraneValues.Count > 0)
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
          Chart1.LeftAxis.Title.Visible := true;
          Chart1.BottomAxis.Title.Visible := false;
          case i of
            1 : begin
              Series1.LinePen.Hide;
              Series1.Pointer.Visible := true;
            end;
            2 : begin
              Series2.LinePen.Hide;
              Series2.Pointer.Visible := true;
            end;
            3 : begin
              Series3.LinePen.Hide;
              Series3.Pointer.Visible := true;
            end;
            4 : begin
              Series4.LinePen.Hide;
              Series4.Pointer.Visible := true;
            end;
            5 : begin
              Series5.LinePen.Hide;
              Series5.Pointer.Visible := true;
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
        for i := 1 to NumGroupsToUse do
        begin
          dmgDV.cdsTempDataI.Filtered := false;
          dmgDV.cdsTempDataI.First;
          if (UserSession.GroupBy = gbGrouping) then
            dmgDV.cdsTempDataI.Filter := 'Grouping ='+''''+UserSession.GroupValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbProvince) then
            dmgDV.cdsTempDataI.Filter := 'Grouping ='+''''+UserSession.ProvinceValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbTerrane) then
            dmgDV.cdsTempDataI.Filter := 'Grouping ='+''''+UserSession.TerraneValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbOrogenicPeriod) then
            dmgDV.cdsTempDataI.Filter := 'Grouping ='+''''+UserSession.OrogenicPeriodValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbBoundaryPosition) then
            dmgDV.cdsTempDataI.Filter := 'Grouping ='+''''+UserSession.BoundaryPositionValues.Strings[i-1]+'''';
          if (UserSession.GroupBy = gbChemicalType) then
            dmgDV.cdsTempDataI.Filter := 'Grouping ='+''''+UserSession.ChemicalTypeValues.Strings[i-1]+'''';
          dmgDV.cdsTempDataI.Filtered := true;
          NPts[i] := dmgDV.cdsTempDataI.RecordCount;
          dmgDV.cdsTempDataI.First;
          repeat
            Chart1.Series[i-1].AddXY(dmgDV.cdsTempDataIVariableX.AsFloat,dmgDV.cdsTempDataIVariableY.AsFloat);
            dmgDV.cdsTempDataI.Next;
          until dmgDV.cdsTempDataI.EOF;
        end;
      end;
    end else
    begin
      {no data to plot}
    end;
    dmgDV.cdsTempDataI.Filtered := false;
    dmgDV.cdsTempDataI.First;
    dmgDV.cdsQuerydm.Close;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX +1;
    if (UserSession.EndAtY <= UserSession.StartAtY) then UserSession.EndAtY := UserSession.StartAtY +1;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
    iweXMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
    iweXMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
    iweYMinimum.Text := FormatFloat('###0.00',UserSession.StartAtY);
    iweYMaximum.Text := FormatFloat('###0.00',UserSession.EndAtY);
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
end;

end.
