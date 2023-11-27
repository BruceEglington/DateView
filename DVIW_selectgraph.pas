unit DVIW_selectgraph;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWCompButton,
  IWCompCheckbox, IWCompLabel, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, IWCompListbox, IWCompRectangle,
  IWCompEdit, IWCompMemo;

type
  TISFSelectGraph = class(TIWAppForm)
    iwrgPlotType: TIWRadioGroup;
    IWLabel1: TIWLabel;
    iwcbPlotTypeGrouped: TIWCheckBox;
    iwbSubmitGraphSelection: TIWButton;
    IWLabel2: TIWLabel;
    iwcbGroupBy: TIWComboBox;
    iwrgNormalisationType: TIWRadioGroup;
    IWLabel3: TIWLabel;
    rectLeft: TIWRectangle;
    iwlSpectrumAgeHeading: TIWLabel;
    iwlFromAge: TIWLabel;
    iweToAge: TIWEdit;
    iwlToAge: TIWLabel;
    iweFromAge: TIWEdit;
    iwcbSpectrumAges: TIWCheckBox;
    iwrgPDFType: TIWRadioGroup;
    IWLabel4: TIWLabel;
    iwbReturn: TIWButton;
    TopBar: TISFTopBar;
    iwbReturnToResults: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitGraphSelectionClick(Sender: TObject);
    procedure iwcbSpectrumAgesClick(Sender: TObject);
    procedure iwrgPDFChangeClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbReturnToResultsClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, DVIW_constants, DVIW_dmgraphics,
  DVIW_chartcurve,
  DVIW_chartinit,
  DVIW_chartmapSHP,
  DVIW_dm, DVIW_uMain,
  DVIW_frGrid, usrIW_dm;

{$R *.dfm}


procedure TISFSelectGraph.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweFromAge.Text := FormatFloat('###0.00',UserSession.FromAge);
  iweToAge.Text := FormatFloat('###0.00',UserSession.ToAge);
end;

procedure TISFSelectGraph.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbReturnToResults.Enabled := not UserSession.GoDirectToGraphs;
  //iwlSpectrumAgeHeading.Visible := UserSession.CanViewPlus;
  //iwlFromAge.Visible := UserSession.CanViewPlus;
  //iwlToAge.Visible := UserSession.CanViewPlus;
  //iweFromAge.Visible := UserSession.CanViewPlus;
  //iweToAge.Visible := UserSession.CanViewPlus;
  //iwcbSpectrumAges.Visible := UserSession.CanViewPlus;
  for i := 0 to iwcbGroupBy.Items.Count-1 do
  begin
    if (UserSession.GroupBy = iwcbGroupBy.Items.Strings[i]) then
    begin
      iwcbGroupBy.ItemIndex := i;
      Break;
    end;
  end;
  if (UserSession.NormalisationType = nt100Percent) then
  begin
    iwrgNormalisationType.ItemIndex := 0;
  end else
  begin
    iwrgNormalisationType.ItemIndex := 1;
  end;
  if (UserSession.PDFType = 'AND') then
  begin
    iwrgPDFType.ItemIndex := 0;
  end else
  begin
    iwrgPDFType.ItemIndex := 1;
  end;
end;

procedure TISFSelectGraph.iwbSubmitGraphSelectionClick(Sender: TObject);
var
  AllOkay : boolean;
  iCode : integer;
  i : integer;
begin
  //if UserSession.CanViewPlus then
  //begin
    //dmUser.SetDeveloperData('iweFromAge Submit 0 = '+iweFromAge.Text);
    //dmUser.SetDeveloperData('iweToAge Submit 0 = '+iweToAge.Text);
    Val(iweFromAge.Text,UserSession.StartAtX,iCode);
      //dmUser.SetDeveloperData('FromAge Submit 0a = '+FormatFloat('####0.00',UserSession.FromAge));
      if (iCode <> 0) then UserSession.StartAtX := SpectrumStartAge;
    Val(iweToAge.Text,UserSession.EndAtX,iCode);
      //dmUser.SetDeveloperData('ToAge Submit 0a = '+FormatFloat('####0.00',UserSession.ToAge));
      if (iCode <> 0) then UserSession.EndAtX := SpectrumEndAge;
    //UserSession.StartAtX := UserSession.FromAge;
    //UserSession.EndAtX := UserSession.ToAge;
    iweFromAge.Text := FormatFloat('###0.00',UserSession.StartAtX);
    iweToAge.Text := FormatFloat('###0.00',UserSession.EndAtX);
    //dmUser.SetDeveloperData('StartAtX Submit 0b = '+FormatFloat('####0.00',UserSession.StartAtX));
    //dmUser.SetDeveloperData('EndAtX Submit 0b = '+FormatFloat('####0.00',UserSession.EndAtX));
  //end;
  AllOkay := true;
  dmgDV.cdsQuerydm.Close;
  dmgDV.cdsTempDataMap.Close;
  dmgDV.cdsTempDataDI.Close;
  dmgDV.cdsTempDataDT.Close;
  dmgDV.cdsTempDataDG.Close;
  dmgDV.cdsTempDataI.Close;
  UserSession.GroupBy := iwcbGroupBy.Text;
  if iwcbPlotTypeGrouped.Checked then
  begin
    if ((UserSession.GroupBy = gbBoundaryPosition) or
        (UserSession.GroupBy = gbChemicalType) or
        (UserSession.GroupBy = gbOrogenicPeriod) or
        (UserSession.GroupBy = gbProvince) or
        (UserSession.GroupBy = gbTerrane) or
        (UserSession.GroupBy = gbLIP) or
        (UserSession.GroupBy = gbGrouping)) then
    begin
      if (UserSession.GroupBy = gbBoundaryPosition) and (not UserSession.IncludeBoundaryValues)
        then iwcbPlotTypeGrouped.Checked := false;
      if (UserSession.GroupBy = gbChemicalType) and (not UserSession.IncludeChemicalTypeValues)
        then iwcbPlotTypeGrouped.Checked := false;
      if (UserSession.GroupBy = gbOrogenicPeriod) and (not UserSession.IncludeOrogenicPeriodValues)
        then iwcbPlotTypeGrouped.Checked := false;
      if (UserSession.GroupBy = gbProvince) and not (UserSession.IncludeProvinceValues)
        then iwcbPlotTypeGrouped.Checked := false;
      if (UserSession.GroupBy = gbTerrane) and (not UserSession.IncludeTerraneValues)
        then iwcbPlotTypeGrouped.Checked := false;
      if (UserSession.GroupBy = gbLIP) and (not UserSession.IncludeLIPValues)
        then iwcbPlotTypeGrouped.Checked := false;
      if (UserSession.GroupBy = gbGrouping) and (not UserSession.IncludeGroupValues)
        then iwcbPlotTypeGrouped.Checked := false;
    end else
    begin
      iwcbPlotTypeGrouped.Checked := false;
    end;
    if not (iwcbPlotTypeGrouped.Checked) then
    begin
      WebApplication.ShowMessage('No grouping criteria were specified in the original data query');
      AllOkay := false;
    end;
    {create UserSession values for each fixed BoundaryPosition, ChemType and Orogenicperiod if these have not been specified in the query}
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbBoundaryPosition) and (UserSession.BoundaryPositionValues.Count=0)) then
    begin
      try
        dmDV.cdsBoundaryPositions.Open;
        UserSession.BoundaryPositionValues.Clear;
        repeat
          UserSession.BoundaryPositionValues.Add(dmDV.cdsBoundaryPositionsBOUNDPOSID.AsString);
          dmDV.cdsBoundaryPositions.Next;
        until dmDV.cdsBoundaryPositions.Eof;
        UserSession.IncludeBoundaryPositionValues := true;
      except
      end;
      dmDV.cdsBoundaryPositions.Close;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbChemicalType) and (UserSession.ChemicalTypeValues.Count=0)) then
    begin
      try
        dmDV.cdsChemTypes.Open;
        UserSession.ChemicalTypeValues.Clear;
        repeat
          UserSession.ChemicalTypeValues.Add(dmDV.cdsChemTypesCHEMTYPEABR.AsString);
          dmDV.cdsChemTypes.Next;
        until dmDV.cdsChemTypes.Eof;
        UserSession.IncludeChemicalTypeValues := true;
      except
      end;
      dmDV.cdsChemTypes.Close;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbOrogenicPeriod) and (UserSession.OrogenicPeriodValues.Count=0)) then
    begin
      try
        dmDV.cdsOrogenicPeriods.Open;
        UserSession.OrogenicPeriodValues.Clear;
        repeat
          UserSession.OrogenicPeriodValues.Add(dmDV.cdsOrogenicPeriodsOROGENICPERIODID.AsString);
          dmDV.cdsOrogenicPeriods.Next;
        until dmDV.cdsOrogenicPeriods.Eof;
        UserSession.IncludeOrogenicPeriodValues := true;
      except
      end;
      dmDV.cdsOrogenicPeriods.Close;
    end;
    {create records in GroupingLink file USEROPTGROUPING}
    if (iwcbPlotTypeGrouped.Checked) then
    begin
      try
        dmgDV.qGroupingLink.Close;
        dmgDV.qGroupingLink.ParamByName('USERID').AsString := UserSession.UserID;
        dmgDV.cdsGroupingLink.Close;
        dmgDV.cdsGroupingLink.Open;
        if (dmgDV.cdsGroupingLink.RecordCount > 0) then
        begin
          dmgDV.cdsGroupingLink.Last;
          repeat
            dmgDV.cdsGroupingLink.Delete;
          until dmgDV.cdsGroupingLink.Bof;
          dmgDV.cdsGroupingLink.ApplyUpdates(-1);
        end;
      except
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbBoundaryPosition) and (UserSession.BoundaryValues.Count>0)) then
    begin
      for i := 0 to UserSession.BoundaryPositionValues.Count-1 do
      begin
        try
          dmgDV.cdsGroupingLink.Append;
          dmgDV.cdsGroupingLinkUSERID.AsString := UserSession.UserID;
          dmgDV.cdsGroupingLinkGROUPINGNUMBER.AsInteger := i + 1;
          dmgDV.cdsGroupingLinkGROUPINGLINK.AsString := UserSession.BoundaryPositionValues.Strings[i];
          dmgDV.cdsGroupingLink.Post;
        except
        end;
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbChemicalType) and (UserSession.ChemicalTypeValues.Count>0)) then
    begin
      for i := 0 to UserSession.ChemicalTypeValues.Count-1 do
      begin
        try
          dmgDV.cdsGroupingLink.Append;
          dmgDV.cdsGroupingLinkUSERID.AsString := UserSession.UserID;
          dmgDV.cdsGroupingLinkGROUPINGNUMBER.AsInteger := i + 1;
          dmgDV.cdsGroupingLinkGROUPINGLINK.AsString := UserSession.ChemicalTypeValues.Strings[i];
          dmgDV.cdsGroupingLink.Post;
        except
        end;
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbOrogenicPeriod) and (UserSession.OrogenicPeriodValues.Count>0)) then
    begin
      for i := 0 to UserSession.OrogenicPeriodValues.Count-1 do
      begin
        try
          dmgDV.cdsGroupingLink.Append;
          dmgDV.cdsGroupingLinkUSERID.AsString := UserSession.UserID;
          dmgDV.cdsGroupingLinkGROUPINGNUMBER.AsInteger := i + 1;
          dmgDV.cdsGroupingLinkGROUPINGLINK.AsString := UserSession.OrogenicPeriodValues.Strings[i];
          dmgDV.cdsGroupingLink.Post;
        except
        end;
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbProvince) and (UserSession.ProvinceValues.Count>0)) then
    begin
      for i := 0 to UserSession.ProvinceValues.Count-1 do
      begin
        try
          dmgDV.cdsGroupingLink.Append;
          dmgDV.cdsGroupingLinkUSERID.AsString := UserSession.UserID;
          dmgDV.cdsGroupingLinkGROUPINGNUMBER.AsInteger := i + 1;
          dmgDV.cdsGroupingLinkGROUPINGLINK.AsString := UserSession.ProvinceValues.Strings[i];
          dmgDV.cdsGroupingLink.Post;
        except
        end;
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbTerrane) and (UserSession.TerraneValues.Count>0)) then
    begin
      for i := 0 to UserSession.TerraneValues.Count-1 do
      begin
        try
          dmgDV.cdsGroupingLink.Append;
          dmgDV.cdsGroupingLinkUSERID.AsString := UserSession.UserID;
          dmgDV.cdsGroupingLinkGROUPINGNUMBER.AsInteger := i + 1;
          dmgDV.cdsGroupingLinkGROUPINGLINK.AsString := UserSession.TerraneValues.Strings[i];
          dmgDV.cdsGroupingLink.Post;
        except
        end;
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbLIP) and (UserSession.LIPValues.Count>0)) then
    begin
      for i := 0 to UserSession.LIPValues.Count-1 do
      begin
        try
          dmgDV.cdsGroupingLink.Append;
          dmgDV.cdsGroupingLinkUSERID.AsString := UserSession.UserID;
          dmgDV.cdsGroupingLinkGROUPINGNUMBER.AsInteger := i + 1;
          dmgDV.cdsGroupingLinkGROUPINGLINK.AsString := UserSession.LIPValues.Strings[i];
          dmgDV.cdsGroupingLink.Post;
          //dmUser.SetDeveloperData(UserSession.LIPValues.Strings[i]);
        except
        end;
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.GroupBy = gbGrouping) and (UserSession.GroupValues.Count>0)) then
    begin
      for i := 0 to UserSession.GroupValues.Count-1 do
      begin
        try
          dmgDV.cdsGroupingLink.Append;
          dmgDV.cdsGroupingLinkUSERID.AsString := UserSession.UserID;
          dmgDV.cdsGroupingLinkGROUPINGNUMBER.AsInteger := i + 1;
          dmgDV.cdsGroupingLinkGROUPINGLINK.AsString := UserSession.GroupValues.Strings[i];
          dmgDV.cdsGroupingLink.Post;
        except
        end;
      end;
    end;
    try
      dmgDV.cdsGroupingLink.ApplyUpdates(-1);
    except
    end;
  end;
  case iwrgPlotType.ItemIndex of
    0 : begin
      UserSession.GraphType := gtInterpretationProbabilityCurves;
      if iwcbPlotTypeGrouped.Checked then UserSession.GraphType := gtGroupedProbabilityCurves;
    end;
    1 : begin
      UserSession.GraphType := gtInterpretationWithErrorBars;
      if iwcbPlotTypeGrouped.Checked then UserSession.GraphType := gtGroupedWithErrorBars;
    end;
    2 : begin
      UserSession.GraphType := gtGalbraith;
      if iwcbPlotTypeGrouped.Checked then iwcbPlotTypeGrouped.Checked := false;
    end;
    3 : begin
      UserSession.GraphType := gtInitialRatio;
      if iwcbPlotTypeGrouped.Checked then UserSession.GraphType := gtInitialRatioGrouped;
    end;
    4 : begin
      UserSession.GraphType := gtEpsilon;
      if iwcbPlotTypeGrouped.Checked then UserSession.GraphType := gtEpsilonGrouped;
    end;
    5 : begin
      UserSession.GraphType := gtMu;
      if iwcbPlotTypeGrouped.Checked then UserSession.GraphType := gtMuGrouped;
    end;
    6 : begin
      UserSession.GraphType := gtClosureTemperature;
    end;
    7 : begin
      UserSession.GraphType := gtMapInterpretation;
      if iwcbPlotTypeGrouped.Checked then UserSession.GraphType := gtMapInterpretationGrouped;
      {
      if iwcbPlotTypeGrouped.Checked then iwcbPlotTypeGrouped.Checked := false;
      }
    end;
    8 : begin
      UserSession.GraphType := gtMapDateBand;
      if iwcbPlotTypeGrouped.Checked then iwcbPlotTypeGrouped.Checked := false;
    end;
    9 : begin
      UserSession.GraphType := gtMapInitialRatioBand;
      if iwcbPlotTypeGrouped.Checked then iwcbPlotTypeGrouped.Checked := false;
    end;
    10 : begin
      UserSession.GraphType := gtMapEpsilonBand;
      if iwcbPlotTypeGrouped.Checked then iwcbPlotTypeGrouped.Checked := false;
    end;
    11 : begin
      UserSession.GraphType := gtMapMuBand;
      if iwcbPlotTypeGrouped.Checked then iwcbPlotTypeGrouped.Checked := false;
    end;
    12 : begin
      if not UserSession.IsDeveloper then WebApplication.ShowMessage('This option is not activated for general use');
      {
      if iwcbPlotTypeGrouped.Checked then iwcbPlotTypeGrouped.Checked := false;
      }
    end;
  end;
  case iwrgNormalisationType.ItemIndex of
    0 : UserSession.NormalisationType := nt100Percent;
    1 : UserSession.NormalisationType := ntTrueProbability;
  end;
  case iwrgPDFType.ItemIndex of
    0 : UserSession.PDFType := 'AND';
    1 : UserSession.PDFType := 'OR';
  end;
  if ((UserSession.IsDeveloper) and (iwrgPlotType.ItemIndex in [12])) then  // test new query with UserOpts
  begin
    if AllOkay then
    begin
      UserSession.AxisChoiceX := 'DATE';
      UserSession.AxisChoiceY := 'EPS';
      if not iwcbPlotTypeGrouped.Checked then
      begin
        dmgDV.cdsTempDataMap.Open;
        //dmgDV.AllocateMapDataInitial2;
      end;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      //TISFTestAllocate.Create(WebApplication).Show;
    end;
  end;
  if ((UserSession.IsDeveloper) and (iwrgPlotType.ItemIndex in [12])) then  // test new query with UserOpts
  begin
    if AllOkay then
    begin
      UserSession.AxisChoiceX := 'DATE';
      UserSession.AxisChoiceY := 'I';
      if not iwcbPlotTypeGrouped.Checked then
      begin
        dmgDV.cdsTempDataMap.Open;
        dmgDV.AllocateMapDataInterp2;
      end;
      if iwcbPlotTypeGrouped.Checked then
      begin
        UserSession.NumRecordsFound := 9;
        dmgDV.cdsTempDataMap.Open;
        dmgDV.AllocateMapDataInterp2Grouped;
      end;
      {
      dmgDV.cdsTempDataMap.Open;
      dmgDV.AllocateMapDataInterp2;
      if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count = 1)
        and (UserSession.ContinentValues.Strings[0] <> 'UND')) then
      begin
        UserSession.MapFileName := DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.shp';
        UserSession.MapDBFName := DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.dbf';
      end else
      begin
        UserSession.MapFileName := DefaultMapFolder+DefaultMapFileName;
        UserSession.MapDBFName := DefaultMapFolder+DefaultMapDBFName;
      end;
      }
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      //TISFTestAllocate.Create(WebApplication).Show;
    end;
  end;
  if iwrgPlotType.ItemIndex in [0,1,2] then  // Galbraith, age error bar and probability plots
  begin
    UserSession.NumRecordsFound := 0;
    if AllOkay then
    begin
      if not iwcbPlotTypeGrouped.Checked then
      begin
        dmgDV.cdsTempDataDI.Open;
        dmgDV.AllocateDataByInterpretation2;
      end;
      if iwcbPlotTypeGrouped.Checked then
      begin
        UserSession.NumRecordsFound := 9;
        dmgDV.cdsTempDataDG.Open;
        dmgDV.AllocateDataGroupedByInterpretation2;
      end;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TIWChartInterpretation.Create(WebApplication).Show;
    end;
  end;
  if iwrgPlotType.ItemIndex in [3,4,5] then   // Initial ratio, epsilon, gamma, mu plots
  begin
    if ((UserSession.GraphType = gtInitialRatio) or (UserSession.GraphType = gtInitialRatioGrouped)) then
    begin
      UserSession.AxisChoiceX := 'DATE';
      UserSession.AxisChoiceY := 'I';
    end;
    if ((UserSession.GraphType = gtEpsilon) or (UserSession.GraphType = gtEpsilonGrouped)) then
    begin
      UserSession.AxisChoiceX := 'DATE';
      UserSession.AxisChoiceY := 'EPS';
    end;
    if ((UserSession.GraphType = gtMu) or (UserSession.GraphType = gtMu)) then
    begin
      UserSession.AxisChoiceX := 'DATE';
      UserSession.AxisChoiceY := 'MU';
    end;
    dmgDV.cdsTempDataI.Open;
    if not iwcbPlotTypeGrouped.Checked then dmgDV.AllocateInitialAndModelRatios2;
    if iwcbPlotTypeGrouped.Checked then dmgDV.AllocateInitialAndModelRatiosGrouped2;
    {
    iwmemo1.Text := dmgDV.QuerydmI.SQL.Text;
    }
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TIWChartInit.Create(WebApplication).Show;
  end;
  if iwrgPlotType.ItemIndex in [6] then     // Closure temperature
  begin
    if iwcbPlotTypeGrouped.Checked then
    begin
      dmgDV.cdsTempDataDT.Open;
      dmgDV.AllocateClosureTempData2;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TIWChartInterpretation.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('Group By was not specified');
    end;
  end;
  if iwrgPlotType.ItemIndex in [7,8] then        // Map graphs
  begin
    //dmUser.SetDeveloperData('DateView map 1');
    dmgDV.cdsTempDataMap.Open;
    //dmUser.SetDeveloperData('DateView map 2');
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.IsDeveloper)) then
    begin
      if (iwrgPlotType.ItemIndex in [7]) then dmgDv.AllocateMapDataInterp2Grouped;
    end else
    begin
      //dmUser.SetDeveloperData('DateView map 3');
      if (iwrgPlotType.ItemIndex in [7]) then dmgDV.AllocateMapDataInterp2;
      if iwrgPlotType.ItemIndex in [8] then dmgDV.AllocateMapDataBand2;
      //dmUser.SetDeveloperData('DateView map 4');
      if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count = 1)
        and (UserSession.ContinentValues.Strings[0] <> 'UND')) then
      begin
        UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.shp';
        UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.dbf';
      end else
      begin
        UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapFolder+DefaultMapFileName;
        UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapFolder+DefaultMapDBFName;
      end;
    end;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.IsDeveloper)) then
    begin
      if (iwrgPlotType.ItemIndex in [7]) then
      begin
        UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
        TIWAppForm(WebApplication.ActiveForm).Release;
        TIWChartMapSHP.Create(WebApplication).Show;
      end else
      begin
        WebApplication.ShowMessage('Grouped option is not available for this choice');
      end;
    end else
    begin
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TIWChartMapSHP.Create(WebApplication).Show;
      //WebApplication.ShowMessage('checking');
    end;
  end;
  if iwrgPlotType.ItemIndex in [9,10,11] then        // Map of initial ratios
  begin
    dmgDV.cdsTempDataMap.Open;
    if ((iwcbPlotTypeGrouped.Checked) and (UserSession.IsDeveloper)) then
    begin
      WebApplication.ShowMessage('Grouped option is not available for this choice');
    end else
    begin
      if iwrgPlotType.ItemIndex in [9] then dmgDv.AllocateMapDataInitial2('0');
      if iwrgPlotType.ItemIndex in [10] then dmgDv.AllocateMapDataInitial2('E');
      if iwrgPlotType.ItemIndex in [11] then dmgDv.AllocateMapDataInitial2('M');
      if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count = 1)
        and (UserSession.ContinentValues.Strings[0] <> 'UND')) then
      begin
        UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.shp';
        UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.dbf';
      end else
      begin
        UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapFolder+DefaultMapFileName;
        UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapFolder+DefaultMapDBFName;
      end;
    end;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TIWChartMapSHP.Create(WebApplication).Show;
  end;
  //dmUser.SetDeveloperData('StartAtX Submit 1 = '+FormatFloat('####0.00',UserSession.StartAtX));
  //dmUser.SetDeveloperData('EndAtX Submit 1 = '+FormatFloat('####0.00',UserSession.EndAtX));
end;

procedure TISFSelectGraph.iwcbSpectrumAgesClick(Sender: TObject);
begin
  if iwcbSpectrumAges.Checked then
  begin
    iweFromAge.Text := FormatFloat('###0.00',SpectrumEndAge);
    iweToAge.Text := FormatFloat('###0.00',SpectrumStartAge);
    iwcbSpectrumAges.Checked := false;
  end;
  UserSession.PDFHasChanged := true;
end;

procedure TISFSelectGraph.iwrgPDFChangeClick(Sender: TObject);
begin
  UserSession.PDFHasChanged := true;
end;

procedure TISFSelectGraph.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFSelectGraph.iwbReturnToResultsClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFGrid.Create(WebApplication).Show;
end;

end.
