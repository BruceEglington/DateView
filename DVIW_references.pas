unit DVIW_references;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl,
  IWCompLabel;

type
  TISFReferences = class(TIWAppForm)
    iwDBgReferences: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNewReference: TIWButton;
    iwlSortedBy: TIWLabel;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwDBgReferencesColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwbAddNewReferenceClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwDBgReferencesColumns0TitleClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, DVIW_uMain, DVIW_constants, DVIW_refdetails,
  DVIW_dmstrat, usrIW_dm;




procedure TISFReferences.IWAppFormRender(Sender: TObject);
begin
  if UserSession.CanModify then
  begin
    iwbApplyUpdates.Visible := UserSession.CanModify and (dmStrat.cdsReferences.State in [dsEdit,dsInsert]);
    iwbCancelUpdates.Visible := UserSession.CanModify and (dmStrat.cdsReferences.State in [dsEdit,dsInsert]);
    iwbAddNewReference.Enabled := UserSession.CanModify and (dmStrat.cdsReferences.State in [dsBrowse]);
  end;
end;

procedure TISFReferences.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //References
  dmStrat.qReferences.Close;
  dmStrat.qReferences.SQL.Clear;
  dmStrat.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmStrat.qReferences.SQL.Add('  CONTINENTS.CONTINENT, SOURCELIST.SOURCEYEAR');
  dmStrat.qReferences.SQL.Add('FROM SOURCELIST,CONTINENTS');
  dmStrat.qReferences.SQL.Add('WHERE CONTINENTS.CONTINENTID = SOURCELIST.CONTINENTID');
  dmStrat.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT >= :FirstReference');
  dmStrat.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT <= :LastReference');
  dmStrat.qReferences.SQL.Add('AND ( SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedContinentID+'''');
  if (UserSession.IncludeContinentValues) then
  begin
    if (UserSession.ContinentValues.Count > 0) then
    begin
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
  end;
  dmStrat.qReferences.SQL.Add(' ) ');
  dmStrat.qReferences.ParamByName('FIRSTREFERENCE').AsString := UserSession.ReferenceStartFrom;
  dmStrat.qReferences.ParamByName('LASTREFERENCE').AsString := UserSession.ReferenceEndWith;
  if (UserSession.IsDeveloper) then
  begin
    //dmUser.SetDeveloperData(dmStrat.qReferences.SQL.Text);
  end;
  dmStrat.cdsReferences.Close;
  dmStrat.cdsReferences.Open;
  if (UserSession.ParameterChosen = NothingChosen) then
  begin
  end else
  begin
    try
      dmStrat.cdsReferences.Locate('SOURCESHORT',UserSession.ParameterChosen,[]);
    except
    end;
  end;
  dmStrat.cdsContinents.Open;
  dmStrat.cdsCountries.Open;
  iwlPrevPage.Visible := (dmStrat.cdsReferences.RecordCount > iwDBgReferences.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsReferences.RecordCount > iwDBgReferences.RowLimit);
end;

procedure TISFReferences.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFReferences.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsReferences.Post;
  except
  end;
  try
    dmStrat.cdsReferences.ApplyUpdates(0);
  except
  end;
end;

procedure TISFReferences.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsReferences.CancelUpdates;
  except
  end;
end;

procedure TISFReferences.iwDBgReferencesColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.UnitSender := usReferences;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFRefDetails.Create(WebApplication).Show;
end;

procedure TISFReferences.iwbAddNewReferenceClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.SubmitNewReference(WasSuccessful);
  if WasSuccessful then
  begin
    try
      dmStrat.qReferences.Close;
      dmStrat.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'NEW'+UserSession.UserID;
      dmStrat.qReferences.ParamByName('LASTREFERENCE').AsString := 'NEW'+UserSession.UserID;
      dmStrat.cdsReferences.Close;
      dmStrat.cdsReferences.Open;
      UserSession.ParameterChosen := dmStrat.cdsReferencesSOURCENUM.AsString;
      dmStrat.cdsContinents.Open;
      dmStrat.cdsCountries.Open;
    except
      WebApplication.ShowMessage('Not able to find new Reference',smAlert);
    end;
  end else
  begin
    WebApplication.ShowMessage('Not able to create record for new Reference',smAlert);
  end;
  if WasSuccessful then
  begin
    try
      UserSession.UnitSender := usReferences;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFRefDetails.Create(WebApplication).Show;
    except
    end;
  end;
end;

procedure TISFReferences.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsReferences.MoveBy(-1*iwDBgReferences.RowLimit);
end;

procedure TISFReferences.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsReferences.MoveBy(iwDBgReferences.RowLimit);
end;

procedure TISFReferences.iwDBgReferencesColumns0TitleClick(
  Sender: TObject);
begin
  dmStrat.cdsReferences.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

end.
