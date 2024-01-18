unit DVIW_frProductTree;

interface

uses
  Windows, Messages, SysUtils, {$IFNDEF VER130}Variants,{$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, IWBaseControl, IWControl, IWCompLabel,
  IWHTMLControls, IWCompExtCtrls, IWHTMLTag, IWCompRectangle,
  IWContainer, IWRegion, IWVCLBaseControl, IWBaseHTMLControl,
  IWVCLBaseContainer, IWHTMLContainer, jpeg, IWHTML40Container;

type
  TISFProductTree = class(TFrame)
    IWFrameRegion: TIWRegion;
    rectRight: TIWRectangle;
    iwregPageLinks: TIWRegion;
    iwlMainPage: TIWLink;
    iwlRecordIDsAll: TIWLink;
    iwlDefineQuery: TIWLink;
    iwlGraphResults: TIWLink;
    iwlOptions: TIWLink;
    iwlSamples: TIWLink;
    iwlUnits: TIWLink;
    iwlUnitAreas: TIWLink;
    iwlReferences: TIWLink;
    iwlNewRecord: TIWLink;
    iwlOtherLookups: TIWLink;
    IWImage1: TIWImage;
    iwlCalculations: TIWLink;
    iwlDataLookups: TIWLink;
    iwlDefineSQL: TIWLink;
    iwlSamplesFractions: TIWLink;
    procedure iwlMainPageClick(Sender: TObject);
    procedure iwlRecordIDsAllClick(Sender: TObject);
    procedure iwlDefineQueryClick(Sender: TObject);
    procedure iwlGraphResultsClick(Sender: TObject);
    procedure iwlOptionsClick(Sender: TObject);
    procedure iwlSamplesClick(Sender: TObject);
    procedure iwlUnitsClick(Sender: TObject);
    procedure iwlUnitAreasClick(Sender: TObject);
    procedure iwlReferencesClick(Sender: TObject);
    procedure iwlNewRecordClick(Sender: TObject);
    procedure iwlOtherLookupsClick(Sender: TObject);
    procedure iwlCalculationsClick(Sender: TObject);
    procedure iwlDataLookupsClick(Sender: TObject);
    procedure iwlDefineSQLClick(Sender: TObject);
    procedure iwlSamplesFractionsClick(Sender: TObject);
  protected
  public
  end;

implementation
{$R *.dfm}

uses
  IWColor, IWAppForm, IWForm, IWInit,
//  uDocumentation,
  ServerController, IWApplication, DVIW_uMain,
  DVIW_dm,
  DVIW_definequery, DVIW_selectgraph, DVIW_options,
  DVIW_samplequery, DVIW_unitquery, DVIW_referencequery,
  DVIW_unitlinkquery, DVIW_newrecord1, DVIW_otherlookups,
  DVIW_selectcalculations, DVIW_datalookups,DVIW_defineSQL,
  DVIW_constants;

{ TISFProductTree }

procedure TISFProductTree.iwlMainPageClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFProductTree.iwlRecordIDsAllClick(Sender: TObject);
begin
  {
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TIWRecordIDsAll.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
  }
end;

procedure TISFProductTree.iwlDefineQueryClick(Sender: TObject);
begin
  try
    dmDV.cdsQuery1.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDetailsEdit
    else UserSession.UnitSender := usDetails;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDefineSQLClick(Sender: TObject);
begin
  try
    dmDV.cdsQuery1.Close;
  except
  end;
  if UserSession.LoggedIn and UserSession.IsDeveloper then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDetailsEdit
    else UserSession.UnitSender := usDetails;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineSQL.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlGraphResultsClick(Sender: TObject);
var
  NumRecords : integer;
begin
  if UserSession.LoggedIn then
  begin
    try
      NumRecords := dmDV.cdsQuery1.RecordCount;
    except
      NumRecords := 0;
    end;
    if (NumRecords > 0) then
    begin
      dmDV.cdsQuery1.Close;
      dmDV.cdsRecordIDs.Close;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFSelectGraph.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('No data are selected. Run a query first.');
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlSamplesFractionsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify then UserSession.UnitSender := usSampleFrac;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSampleQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlOptionsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFOptions.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlSamplesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify then UserSession.UnitSender := usSample;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSampleQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlUnitsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'Units';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUnitQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlUnitAreasClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'UnitAreas';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUnitQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlReferencesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFReferenceQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlNewRecordClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFNewRecord1.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlOtherLookupsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFOtherLookups.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlCalculationsClick(Sender: TObject);
var
  NumRecords : integer;
begin
  if UserSession.LoggedIn then
  begin
    try
      NumRecords := dmDV.cdsQuery1.RecordCount;
    except
      NumRecords := 0;
    end;
    if (NumRecords > 0) then
    begin
      dmDV.cdsQuery1.Close;
      dmDV.cdsRecordIDs.Close;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFSelectCalculations.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('No data are selected. Run a query first.');
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDataLookupsClick(Sender: TObject);
begin
  if UserSession.IsDeveloper then
  begin
    if UserSession.LoggedIn then
    begin
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFDataLookups.Create(WebApplication).Show;
    end else
    begin
      UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
    end;
  end;
end;

end.
