unit DVIW_frGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, DVIW_frTopBar, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  DVIW_framemenu, Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFGrid = class(TIWAppForm)
    lblRecordCount: TIWLabel;
    iwDBgResults: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlSortedBy: TIWLabel;
    iwlPageNum: TIWLabel;
    IWLabel3: TIWLabel;
    iwlPageNumTotal: TIWLabel;
    iwlFirstPage: TIWLink;
    iwlLastPage: TIWLink;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    FrameMenu: TISFFrameMenu;
    iwbDownloadSampleCoordinates: TIWButton;
    iwbDownloadInit: TIWButton;
    iwlCanDownload: TIWLabel;
    FDMemTable1: TFDMemTable;
    FDMemTableInit: TFDMemTable;
    FDMemTable2: TFDMemTable;
    FDMemTable1Region: TStringField;
    FDMemTable1UnitName: TStringField;
    FDMemTable1Lithology: TStringField;
    FDMemTable1MaterialDescription: TStringField;
    FDMemTable1IsoSystem: TStringField;
    FDMemTable1Interpretation: TStringField;
    FDMemTable1RAge: TFloatField;
    FDMemTable1RAgePError: TFloatField;
    FDMemTable1RAgeMError: TFloatField;
    FDMemTable1AgeUnits: TStringField;
    FDMemTable1ApproachDescription: TStringField;
    FDMemTable1Technique: TStringField;
    FDMemTable1RecordID: TLargeintField;
    FDMemTable1SourceShort: TStringField;
    FDMemTable1MethodID: TStringField;
    FDMemTableInitRegion: TStringField;
    FDMemTableInitUnitName: TStringField;
    FDMemTableInitLithology: TStringField;
    FDMemTableInitMaterialDescription: TStringField;
    FDMemTableInitIsoSystem: TStringField;
    FDMemTableInitInterpretation: TStringField;
    FDMemTableInitRAge: TFloatField;
    FDMemTableInitRAgePError: TFloatField;
    FDMemTableInitRAgeMError: TFloatField;
    FDMemTableInitAgeUnits: TStringField;
    FDMemTableInitApproachDescription: TStringField;
    FDMemTableInitTechnique: TStringField;
    FDMemTableInitRecordID: TLargeintField;
    FDMemTableInitSourceShort: TStringField;
    FDMemTableInitMethodID: TStringField;
    FDMemTableInitInitRatio: TFloatField;
    FDMemTableInitInitRatioError: TFloatField;
    FDMemTableInitEpsilon: TFloatField;
    FDMemTableInitEpsilonError: TFloatField;
    FDMemTableInitMu: TFloatField;
    FDMemTableInitMuPError: TFloatField;
    FDMemTableInitMuMError: TFloatField;
    FDMemTableInitInitModel: TStringField;
    FDMemTableInitPrefLevel: TSmallintField;
    FDMemTable1PrefLevel: TSmallintField;
    FDMemTablesamples: TFDMemTable;
    FDMemTablesamplesRecordID: TIntegerField;
    FDMemTablesamplesCOID: TStringField;
    FDMemTablesamplesCountryID: TStringField;
    FDMemTablesamplesSampleNo: TStringField;
    FDMemTablesamplesFrac: TStringField;
    FDMemTablesamplesOriginalNo: TStringField;
    FDMemTablesamplesIncludeYN: TStringField;
    FDMemTablesamplesLongitude: TFloatField;
    FDMemTablesamplesLatitude: TFloatField;
    FDMemTablesamplesElevation: TFloatField;
    FDMemTablesamplesLongitudePrecision: TFloatField;
    FDMemTablesamplesLatitudePrecision: TFloatField;
    FDMemTablesamplesElevationPrecision: TFloatField;
    FDMemTablesamplesLithology: TStringField;
    iwbDownloadCombined: TIWButton;
    FDMemTableCombined: TFDMemTable;
    FDMemTableCombinedRegion: TStringField;
    FDMemTableCombinedUnitName: TStringField;
    FDMemTableCombinedLithology: TStringField;
    FDMemTableCombinedMaterialDescription: TStringField;
    FDMemTableCombinedIsoSystem: TStringField;
    FDMemTableCombinedInterpretation: TStringField;
    FDMemTableCombinedPrefLevel: TIntegerField;
    FDMemTableCombinedRAge: TFloatField;
    FDMemTableCombinedRAgePError: TFloatField;
    FDMemTableCombinedRAgeMError: TFloatField;
    FDMemTableCombinedAgeUnits: TStringField;
    FDMemTableCombinedApproachDescription: TStringField;
    FDMemTableCombinedTechnique: TStringField;
    FDMemTableCombinedRecordID: TIntegerField;
    FDMemTableCombinedSourceShort: TStringField;
    FDMemTableCombinedMethodID: TStringField;
    FDMemTableCombinedSampleNo: TStringField;
    FDMemTableCombinedFrac: TStringField;
    FDMemTableCombinedLongitude: TFloatField;
    FDMemTableCombinedLatitude: TFloatField;
    FDMemTableCombinedElevation: TFloatField;
    FDMemTableCombinedIncluded: TStringField;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0Click(ASender: TObject;
      const AValue: String);
    procedure IWDBGrid1ColumnsTitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwlFirstPageClick(Sender: TObject);
    procedure iwlLastPageClick(Sender: TObject);
    procedure iwDBgResultsColumns14Click(ASender: TObject;
      const AValue: String);
    procedure IWButton1Click(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbDownloadSampleCoordinatesClick(Sender: TObject);
    procedure iwbDownloadCombinedClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_details, DVIW_constants, DVIW_detailsedit,
  DVIW_refdetails, usrIW_dm;

procedure TISFGrid.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
end;

procedure TISFGrid.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := AValue;
  //dmUser.SetDeveloperData('TISFGrid.IWDBGrid1Columns0Click - '+UserSession.RecordChosen);
  {
  dmDV.qRecordIDs.Close;
  dmDV.qRecordIDs.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
  dmDV.cdsRecordIDs.Close;
  dmDV.cdsRecordIDs.Open;
  }
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  if UserSession.CanModify then
  begin
    TISFDetailsEdit.Create(WebApplication).Show;
  end else
  begin
    //TISFDetails.Create(WebApplication).Show;
    TISFDetailsEdit.Create(WebApplication).Show;
  end;
end;

procedure TISFGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmDV.cdsQuery1.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsQuery1.MoveBy(-1*iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFGrid.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsQuery1.MoveBy(iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFGrid.IWAppFormCreate(Sender: TObject);
const
  DataTypeID : integer = 2;   //Summary data
var
  i, nRec : integer;
  MaxAllowed : integer;
begin
  //dmUser.SetDeveloperData('DateView - Grid FormCreate 0');
  FrameMenu.DefineSQL1.Visible := UserSession.IsDeveloper;
  FrameMenu.RawDataIdentifyAgePeaks1.Enabled := UserSession.CanModifyPlus;
  iwlPrevPage.Visible := false;
  iwlNextPage.Visible := false;
  iwlFirstPage.Visible := false;
  iwlLastPage.Visible := false;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := 1;
  if UserSession.LoggedIn then
  begin
    MaxAllowed := dmUser.GetUserRowLimit(UserSession.UserID,DataTypeID);
    iwbDownload.Enabled := (MaxAllowed > 0);
    iwbDownloadCombined.Enabled := (MaxAllowed > 0);
    iwbDownloadInit.Enabled := (MaxAllowed > 0);
    iwbDownloadSampleCoordinates.Enabled := (MaxAllowed > 0);
    dmDV.Query1.Close;
    dmDV.Query1.ParamByName('USERID').AsString := UserSession.UserID;
    dmDV.cdsQuery1.Close;
    //dmUser.SetDeveloperData('DateView - Grid FormCreate 1');
    UserSession.NumberOfPoints := 0;
    dmDV.Query1RecordCount;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData('frGrid cdsQuery1RecCOUNT ' + IntToStr(UserSession.NumberOfPoints));
    end;
    try
      dmDV.cdsQuery1.Open;
      {
      if (UserSession.UserID = 'guest') then
      begin
        nRec := UserSession.NumberOfPoints;
        if (nRec > MaxGuestRecords) then
        begin
          dmDV.cdsQuery1.Last;
          for i := nRec downto MaxGuestRecords+1 do
          begin
            dmDV.cdsQuery1.Delete;
          end;
        end;
      end;
      }
      iwlPrevPage.Visible := (UserSession.NumberOfPoints > iwDBgResults.RowLimit);
      iwlNextPage.Visible := (UserSession.NumberOfPoints > iwDBgResults.RowLimit);
      iwlFirstPage.Visible := (UserSession.NumberOfPoints > iwDBgResults.RowLimit);
      iwlLastPage.Visible := (UserSession.NumberOfPoints > iwDBgResults.RowLimit);
      UserSession.PageNum := 1;
      UserSession.PageNumTotal := UserSession.NumberOfPoints div iwDBgResults.RowLimit;
      if ((UserSession.NumberOfPoints mod iwDBgResults.RowLimit) <> 0) then UserSession.PageNumTotal := UserSession.PageNumTotal +1;
      iwlPageNum.Caption := IntToStr(UserSession.PageNum);
      iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
      lblRecordCount.Text := IntToStr(UserSession.NumberOfPoints)+' records found';
      lblRecordCount.NoWrap := true;
      //if (UserSession.UserID = 'guest') then lblRecordCount.Text := lblRecordCount.Text + ' (guest is limited to 10 records)';
    except
    end;
  //dmUser.SetDeveloperData('DateView - Grid FormCreate 2');
  end;
  if (MaxAllowed > 0) then
  begin
    iwlCanDownload.Left := 750;
    iwlCanDownload.Caption := 'Maximum download limit = '+IntToStr(MaxAllowed);
  end else
  begin
    iwlCanDownload.Left := 750;
    iwlCanDownload.Caption := 'Users who contribute data can download summary information';
  end;
end;

procedure TISFGrid.iwlFirstPageClick(Sender: TObject);
begin
  dmDV.cdsQuery1.First;
  UserSession.PageNum := 1;
end;

procedure TISFGrid.iwlLastPageClick(Sender: TObject);
begin
  dmDV.cdsQuery1.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFGrid.iwDBgResultsColumns14Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.UnitSender := usGrid;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFRefDetails.Create(WebApplication).Show;
end;

procedure TISFGrid.IWButton1Click(Sender: TObject);
begin
  dmDV.qRecordIDs.Close;
  dmDV.qRecordIDs.ParamByName('RECORDID').AsString := '1785';
  dmDV.cdsRecordIDs.Close;
  dmDV.cdsRecordIDs.Open;
end;

procedure TISFGrid.iwbDownloadClick(Sender: TObject);
const
  DataTypeID : integer = 2;   //Summary data
var
  i : integer;
  MaxAllowed : integer;
  IsInitialRatio : boolean;
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  IsInitialRatio := false;
  if (Sender = iwbDownload) then
  begin
    IsInitialRatio := false;
    //dmUser.SetDeveloperData('IsInitialRatio false');
  end;
  if (Sender = iwbDownloadInit) then
  begin
    IsInitialRatio := true;
    //dmUser.SetDeveloperData('IsInitialRatio true');
  end;
  MaxAllowed := dmUser.GetUserRowLimit(UserSession.UserID,DataTypeID);
  if (UserSession.NumberOfPoints >= MaxAllowed) then
  begin
    WebApplication.ShowMessage('Only the first '+IntToStr(MaxAllowed)+' records will be downloaded');
  end;
  //dmUser.SetDeveloperData('MaxAllowed = '+IntToStr(MaxAllowed)+' but query has '+IntToStr(UserSession.NumberOfPoints)+' records');
  if (not IsInitialRatio) then
  begin
    //dmUser.SetDeveloperData(dmDV.Query1.SQL.Text);
    FDMemTable1.Open;
    dmDV.cdsQuery1.First;
    i := 1;
    repeat
      FDMemTable1.AppendRecord([dmDV.cdsQuery1COUNTRY.AsVariant,dmDV.cdsQuery1UNITNAME.AsVariant,
            dmDV.cdsQuery1LITHOLOGY.AsVariant,dmDV.cdsQuery1MATERIALDESCRIPTION.AsVariant,
            dmDV.cdsQuery1ISOSYSTEMNAME.AsVariant,dmDV.cdsQuery1INTERPRETATION.AsVariant,
            dmDV.cdsQuery1PREFLEVEL.AsVariant,dmDV.cdsQuery1RAGE.AsVariant,
            dmDV.cdsQuery1RAGEPERROR.AsVariant,dmDV.cdsQuery1RAGEMERROR.AsVariant,
            dmDV.cdsQuery1AGEUNITS.AsVariant,dmDV.cdsQuery1APPROACHDESCRIPTION.AsVariant,
            dmDV.cdsQuery1TECHNIQUE.AsVariant,dmDV.cdsQuery1RECORDID.AsVariant,
            dmDV.cdsQuery1SOURCESHORT.AsVariant,dmDV.cdsQuery1METHODABR.AsVariant]);
      dmDV.cdsQuery1.Next;
      i := i + 1;
    until ((dmDV.cdsQuery1.Eof) or (i > MaxAllowed));
    FDMemTable1.First;
    //Report1.Template := DefaultFlexCellFolder+'FlxQuery1.xlsx';
    dmDV.cdsQuery1.First;
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQuery1.xlsx';
    frFileNameStr := 'Query_results.xlsx';
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
  if (IsInitialRatio) then
  begin
    //dmUser.SetDeveloperData(dmDV.QueryInit.SQL.Text);
    FDMemTableInit.Open;
    dmDV.cdsQueryInit.Open;
    i := 1;
    repeat
      FDMemTableInit.AppendRecord([dmDV.cdsQueryInitCOUNTRY.AsVariant,dmDV.cdsQueryInitUNITNAME.AsVariant,
            dmDV.cdsQueryInitLITHOLOGY.AsVariant,dmDV.cdsQueryInitMATERIALDESCRIPTION.AsVariant,
            dmDV.cdsQueryInitISOSYSTEMNAME.AsVariant,dmDV.cdsQueryInitINTERPRETATION.AsVariant,
            dmDV.cdsQueryInitPREFLEVEL.AsVariant,dmDV.cdsQueryInitRAGE.AsVariant,
            dmDV.cdsQueryInitRAGEPERROR.AsVariant,dmDV.cdsQueryInitRAGEMERROR.AsVariant,
            dmDV.cdsQueryInitAGEUNITS.AsVariant,dmDV.cdsQueryInitAPPROACHDESCRIPTION.AsVariant,
            dmDV.cdsQueryInitTECHNIQUE.AsVariant,dmDV.cdsQueryInitRECORDID.AsVariant,
            dmDV.cdsQueryInitSOURCESHORT.AsVariant,dmDV.cdsQueryInitMETHODABR.AsVariant,
            dmDV.cdsQueryInitINITRATIO.AsVariant,dmDV.cdsQueryInitINITRATIOERROR.AsVariant,
            dmDV.cdsQueryInitEPSILON.AsVariant,dmDV.cdsQueryInitEPSILONERROR.AsVariant,
            dmDV.cdsQueryInitMU.AsVariant,dmDV.cdsQueryInitMUPERROR.AsVariant,
            dmDV.cdsQueryInitMUMERROR.AsVariant,dmDV.cdsQueryInitMODEL.AsVariant]);
      dmDV.cdsQueryInit.Next;
      i := i + 1;
    until ((dmDV.cdsQueryInit.Eof) or (i > MaxAllowed));
    FDMemTableInit.First;
    dmDV.cdsQueryInit.First;
    //ReportInit.Template := DefaultFlexCellFolder+'FlxQueryInit.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQueryInit.xlsx';
    frFileNameStr := 'Query_results_initial_composition.xlsx';
    if ((UserSession.IncludeIsotopeSystemValues) and (UserSession.IsotopeSystemValues[0] = 'PbPb')) then
    begin
      //ReportInit.Template := DefaultFlexCellFolder+'FlxQueryMuSource.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQueryMuSource.xlsx';
    end;
    fr := TFlexCelReport.Create(true);
    try
      fr.AddTable('FDMemTableInit',FDMemTableInit);
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
end;

procedure TISFGrid.iwbDownloadCombinedClick(Sender: TObject);
const
  DataTypeID : integer = 2;   //Summary data
var
  i : integer;
  MaxAllowed : integer;
  IsInitialRatio : boolean;
  IsCombined : boolean;
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  IsInitialRatio := false;
  if ((Sender = iwbDownload) or (Sender = iwbDownloadCombined)) then
  begin
    IsInitialRatio := false;
    dmUser.SetDeveloperData('IsInitialRatio false');
  end;
  if (Sender = iwbDownload) then
  begin
    IsCombined := false;
    dmUser.SetDeveloperData('IsCombined false');
  end;
  if (Sender = iwbDownloadCombined) then
  begin
    IsCombined := true;
    dmUser.SetDeveloperData('IsCombined true');
  end;
  if (Sender = iwbDownloadInit) then
  begin
    IsInitialRatio := true;
    IsCombined := false;
    //dmUser.SetDeveloperData('IsInitialRatio true');
  end;
  MaxAllowed := dmUser.GetUserRowLimit(UserSession.UserID,DataTypeID);
  if (UserSession.NumberOfPoints >= MaxAllowed) then
  begin
    WebApplication.ShowMessage('Only the first '+IntToStr(MaxAllowed)+' records will be downloaded');
  end;
  //dmUser.SetDeveloperData('MaxAllowed = '+IntToStr(MaxAllowed)+' but query has '+IntToStr(UserSession.NumberOfPoints)+' records');
  if ((not IsInitialRatio) and (not IsCombined)) then
  begin
    //dmUser.SetDeveloperData(dmDV.Query1.SQL.Text);
    FDMemTable1.Open;
    dmDV.cdsQuery1.First;
    i := 1;
    repeat
      FDMemTable1.AppendRecord([dmDV.cdsQuery1COUNTRY.AsVariant,dmDV.cdsQuery1UNITNAME.AsVariant,
            dmDV.cdsQuery1LITHOLOGY.AsVariant,dmDV.cdsQuery1MATERIALDESCRIPTION.AsVariant,
            dmDV.cdsQuery1ISOSYSTEMNAME.AsVariant,dmDV.cdsQuery1INTERPRETATION.AsVariant,
            dmDV.cdsQuery1PREFLEVEL.AsVariant,dmDV.cdsQuery1RAGE.AsVariant,
            dmDV.cdsQuery1RAGEPERROR.AsVariant,dmDV.cdsQuery1RAGEMERROR.AsVariant,
            dmDV.cdsQuery1AGEUNITS.AsVariant,dmDV.cdsQuery1APPROACHDESCRIPTION.AsVariant,
            dmDV.cdsQuery1TECHNIQUE.AsVariant,dmDV.cdsQuery1RECORDID.AsVariant,
            dmDV.cdsQuery1SOURCESHORT.AsVariant,dmDV.cdsQuery1METHODABR.AsVariant]);
      dmDV.cdsQuery1.Next;
      i := i + 1;
    until ((dmDV.cdsQuery1.Eof) or (i > MaxAllowed));
    FDMemTable1.First;
    //Report1.Template := DefaultFlexCellFolder+'FlxQuery1.xlsx';
    dmDV.cdsQuery1.First;
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQuery1.xlsx';
    frFileNameStr := 'Query_results.xlsx';
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
      FDMemTable1.Close;
    end;
  end;
  if (IsInitialRatio) then
  begin
    //dmUser.SetDeveloperData(dmDV.QueryInit.SQL.Text);
    FDMemTableInit.Open;
    dmDV.cdsQueryInit.Open;
    i := 1;
    repeat
      FDMemTableInit.AppendRecord([dmDV.cdsQueryInitCOUNTRY.AsVariant,dmDV.cdsQueryInitUNITNAME.AsVariant,
            dmDV.cdsQueryInitLITHOLOGY.AsVariant,dmDV.cdsQueryInitMATERIALDESCRIPTION.AsVariant,
            dmDV.cdsQueryInitISOSYSTEMNAME.AsVariant,dmDV.cdsQueryInitINTERPRETATION.AsVariant,
            dmDV.cdsQueryInitPREFLEVEL.AsVariant,dmDV.cdsQueryInitRAGE.AsVariant,
            dmDV.cdsQueryInitRAGEPERROR.AsVariant,dmDV.cdsQueryInitRAGEMERROR.AsVariant,
            dmDV.cdsQueryInitAGEUNITS.AsVariant,dmDV.cdsQueryInitAPPROACHDESCRIPTION.AsVariant,
            dmDV.cdsQueryInitTECHNIQUE.AsVariant,dmDV.cdsQueryInitRECORDID.AsVariant,
            dmDV.cdsQueryInitSOURCESHORT.AsVariant,dmDV.cdsQueryInitMETHODABR.AsVariant,
            dmDV.cdsQueryInitINITRATIO.AsVariant,dmDV.cdsQueryInitINITRATIOERROR.AsVariant,
            dmDV.cdsQueryInitEPSILON.AsVariant,dmDV.cdsQueryInitEPSILONERROR.AsVariant,
            dmDV.cdsQueryInitMU.AsVariant,dmDV.cdsQueryInitMUPERROR.AsVariant,
            dmDV.cdsQueryInitMUMERROR.AsVariant,dmDV.cdsQueryInitMODEL.AsVariant]);
      dmDV.cdsQueryInit.Next;
      i := i + 1;
    until ((dmDV.cdsQueryInit.Eof) or (i > MaxAllowed));
    FDMemTableInit.First;
    dmDV.cdsQueryInit.First;
    //ReportInit.Template := DefaultFlexCellFolder+'FlxQueryInit.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQueryInit.xlsx';
    frFileNameStr := 'Query_results_initial_composition.xlsx';
    if ((UserSession.IncludeIsotopeSystemValues) and (UserSession.IsotopeSystemValues[0] = 'PbPb')) then
    begin
      //ReportInit.Template := DefaultFlexCellFolder+'FlxQueryMuSource.xlsx';
      frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQueryMuSource.xlsx';
    end;
    fr := TFlexCelReport.Create(true);
    try
      fr.AddTable('FDMemTableInit',FDMemTableInit);
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
      FDMemTableInit.Close;
    end;
  end;
  if (IsCombined) then
  begin
    dmUser.SetDeveloperData('frGrid IsCombined '+dmDV.QueryCombined.SQL.Text);
    FDMemTableCombined.Open;
    dmUser.SetDeveloperData('frGrid IsCombined 2');
    dmDV.cdsQueryCombined.Open;
    dmUser.SetDeveloperData('frGrid IsCombined 3');
    dmDV.cdsQueryCombined.First;
    i := 1;
    repeat
      FDMemTableCombined.AppendRecord([dmDV.cdsQueryCombinedCOUNTRY.AsVariant,dmDV.cdsQueryCombinedUNITNAME.AsVariant,
            dmDV.cdsQueryCombinedLITHOLOGY.AsVariant,dmDV.cdsQueryCombinedMATERIALDESCRIPTION.AsVariant,
            dmDV.cdsQueryCombinedISOSYSTEMNAME.AsVariant,dmDV.cdsQueryCombinedINTERPRETATION.AsVariant,
            dmDV.cdsQueryCombinedPREFLEVEL.AsVariant,dmDV.cdsQueryCombinedRAGE.AsVariant,
            dmDV.cdsQueryCombinedRAGEPERROR.AsVariant,dmDV.cdsQueryCombinedRAGEMERROR.AsVariant,
            dmDV.cdsQueryCombinedAGEUNITS.AsVariant,dmDV.cdsQueryCombinedAPPROACHDESCRIPTION.AsVariant,
            dmDV.cdsQueryCombinedTECHNIQUE.AsVariant,dmDV.cdsQueryCombinedRECORDID.AsVariant,
            dmDV.cdsQueryCombinedSOURCESHORT.AsVariant,dmDV.cdsQueryCombinedMETHODABR.AsVariant,
            dmDV.cdsQueryCombinedSampleNo.AsVariant,dmDV.cdsQueryCombinedFrac.AsVariant,
            dmDV.cdsQueryCombinedLongitude.AsVariant,dmDV.cdsQueryCombinedLatitude.AsVariant,
            dmDV.cdsQueryCombinedElevation.AsVariant,dmDV.cdsQueryCombinedIncluded.AsVariant]);
      dmDV.cdsQueryCombined.Next;
      i := i + 1;
    until ((dmDV.cdsQueryCombined.Eof) or (i > MaxAllowed));
    FDMemTableCombined.First;
    //Report1.Template := DefaultFlexCellFolder+'FlxQueryCombined.xlsx';
    dmDV.cdsQueryCombined.First;
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQueryCombined.xlsx';
    frFileNameStr := 'Query_results_combined.xlsx';
    fr := TFlexCelReport.Create(true);
    try
      fr.AddTable('FDMemTableCombined',FDMemTableCombined);
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
      FDMemTableCombined.Close;
    end;
  end;
end;

procedure TISFGrid.iwbDownloadSampleCoordinatesClick(Sender: TObject);
const
  DataTypeID : integer = 2;   //Summary data
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  i : integer;
  MaxAllowed : integer;
  iCode : integer;
  tempStr : string;
  tmp : double;
  FromDate, ToDate : double;
  FromEpsilon, ToEpsilon : double;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  MaxAllowed := dmUser.GetUserRowLimit(UserSession.UserID,DataTypeID);
  dmDV.cdsQuerySamples.Close;
  dmDV.QuerySamples.Close;
  dmDV.QuerySamples.SQL.Clear;
  dmDV.QuerySamples.SQL.Add('SELECT DISTINCT ISORGR30.RECORDID, ');
  dmDV.QuerySamples.SQL.Add('smploc.continentid, smploc.countryabr,smploc.sampleno,smpreg.frac,');
  dmDV.QuerySamples.SQL.Add('smploc.originalno,smpreg.included, ');
  dmDV.QuerySamples.SQL.Add('smploc.longitude,smploc.latitude,smploc.elevation, ');
  dmDV.QuerySamples.SQL.Add('smploc.longitudeprecision,smploc.latitudeprecision,smploc.elevationprecision, ');
  dmDV.QuerySamples.SQL.Add('smploc.lithology ');
  dmDV.QuerySamples.SQL.Add('FROM ISORGR30');
  if UserSession.IsDeveloper then
  begin
      //dmUser.SetDeveloperData('SubmitQuerySamplesa '+dmDV.QuerySamples.SQL.Text);
  end;
  if (UserSession.IncludeAreaValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeUnitValues
      or UserSession.IncludeLithologyValues
      or UserSession.IncludeMaterialValues
      or UserSession.IncludeIsotopeSystemValues
      or UserSession.IncludeApproachValues
      or UserSession.IncludeInterpretationValues
      or UserSession.IncludeTechniqueValues
      or UserSession.IncludeMethodValues
      or UserSession.IncludeGroupValues
      or UserSession.IncludeProvinceValues
      or UserSession.IncludeTerraneValues
      or UserSession.IncludeLIPValues
      or UserSession.IncludeOrogenicPeriodValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeChemicalTypeValues
      or UserSession.IncludeIsochronOnlyValue
      or UserSession.IncludeWhoForValues
      or UserSession.IncludeUsersContributedValues
      or (UserSession.PreferenceLevelValue <> '')
      or UserSession.IncludeCoordinates
      or UserSession.IncludeEpsilonFromValue
      or UserSession.IncludeEpsilonToValue
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeUserOrgID
      or UserSession.IncludeDateToValue) then
  begin
    tmpStringList := TStringList.Create;
    try
      dmDV.ConstructQuerySamplesStringListJoin(QueryUse,tmpStringList);
      i := tmpStringList.Count;
      for i := 0 to tmpStringList.Count - 1 do
      begin
        dmDV.QuerySamples.SQL.Add(tmpStringList.Strings[i]);
      end;
    finally
      FreeAndNil(tmpStringList);
    end;
    dmDV.QuerySamples.SQL.Add('ORDER by ISORGR30.RECORDID,SMPREG.SAMPLENO,SMPREG.FRAC');
    dmDV.QuerySamples.SQL.Add(' ');
  end;
  if UserSession.IsDeveloper then
  begin
      //dmUser.SetDeveloperData('SubmitQuerySamplesb '+dmDV.QuerySamples.SQL.Text);
  end;
  dmDV.QuerySamples.ParamByName('USERID').AsString := UserSession.UserID;
  {
  if (UserSession.NumberOfPoints >= MaxAllowed) then
  begin
    WebApplication.ShowMessage('Only the first '+IntToStr(MaxAllowed)+' records will be downloaded');
  end;
  //dmUser.SetDeveloperData('MaxAllowed = '+IntToStr(MaxAllowed)+' but query has '+IntToStr(UserSession.NumberOfPoints)+' records');
  }
  FDMemTableSamples.Open;
  FDMemTableSamples.EmptyDataset;
  dmDV.cdsQuerySamples.Open;
  dmDV.cdsQuerySamples.First;
  i := 1;
  repeat
    FDMemTableSamples.AppendRecord([dmDV.cdsQuerySamplesSAMPLENO.AsVariant,dmDV.cdsQuerySamplesFRAC.AsVariant,
      dmDV.cdsQuerySamplesLONGITUDE.AsVariant,dmDV.cdsQuerySamplesLATITUDE.AsVariant,
      dmDV.cdsQuerySamplesELEVATION.AsVariant,dmDV.cdsQuerySamplesLONGITUDEPRECISION.AsVariant,
      dmDV.cdsQuerySamplesLATITUDEPRECISION.AsVariant,dmDV.cdsQuerySamplesELEVATIONPRECISION.AsVariant,
      dmDV.cdsQuerySamplesCONTINENTID.AsVariant,dmDV.cdsQuerySamplesCOUNTRYABR.AsVariant,
      dmDV.cdsQuerySamplesINCLUDED.AsVariant,
      dmDV.cdsQuerySamplesORIGINALNO.AsVariant,
      dmDV.cdsQuerySamplesRECORDID.AsVariant,
      dmDV.cdsQuerySamplesLITHOLOGY.AsVariant]);
    dmDV.cdsQuerySamples.Next;
    i := i + 1;
  until ((dmDV.cdsQuerySamples.Eof) or (i > MaxAllowed));
  dmDV.cdsQuerySamples.Close;
  FDMemTableSamples.First;
  //FlexcelReportSamples.Template := DefaultFlexCellFolder+'FlxQuerySamples.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxQuerySamples.xlsx';
  frFileNameStr := 'Query Samples.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTableSamples',FDMemTableSamples);
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

end.
