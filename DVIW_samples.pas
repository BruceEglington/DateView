unit DVIW_samples;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFSamples = class(TIWAppForm)
    iwDBgSmpLoc: TIWDBGrid;
    iwbClose: TIWButton;
    iwbAddNewSample: TIWButton;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    iwlFirstPage: TIWLink;
    iwlPrevPage: TIWLink;
    iwlPageNum: TIWLabel;
    iwlOf: TIWLabel;
    iwlPageNumTotal: TIWLabel;
    iwlNextPage: TIWLink;
    iwlLastPage: TIWLink;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbAddNewSampleClick(Sender: TObject);
    procedure iwDBgSmpLocColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwlFirstPageClick(Sender: TObject);
    procedure iwlLastPageClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, IWColor, Graphics,
  DVIW_dm, DVIW_uMain, DVIW_constants, DVIW_sampleedit, usrIW_dm;




procedure TISFSamples.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
  iwbAddNewSample.Visible := UserSession.CanModify;
end;

procedure TISFSamples.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //SmpLoc
  dmDV.qSmpLoc.Close;
  dmDV.qSmpLoc.SQL.Clear;
  dmDV.qSmpLoc.SQL.Add('SELECT DISTINCT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR,');
  dmDV.qSmpLoc.SQL.Add('   SMPLOC.LATITUDE, SMPLOC.LONGITUDE, SMPLOC.ELEVATION,');
  dmDV.qSmpLoc.SQL.Add('   SMPLOC.LATITUDEPRECISION, SMPLOC.LONGITUDEPRECISION, SMPLOC.ELEVATIONPRECISION, SMPLOC.ORIGINALNO,');
  dmDV.qSmpLoc.SQL.Add('   SMPLOC.LITHOLOGY,');
  dmDV.qSmpLoc.SQL.Add('   CONTINENT.CONTINENT, COUNTRY.COUNTRY,');
  dmDV.qSmpLoc.SQL.Add('   LITHCLASSES.LITHCLASSID, LITHCLASSES.LITHCLASS,');
  dmDV.qSmpLoc.SQL.Add('   SMPLOC.IGSN');
  dmDV.qSmpLoc.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT,LITHOL,LITHCLASSES');
  dmDV.qSmpLoc.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qSmpLoc.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
  dmDV.qSmpLoc.SQL.Add('AND SMPLOC.LITHOLOGY = LITHOL.LITHOLOGY');
  dmDV.qSmpLoc.SQL.Add('AND LITHOL.LITHCLASSID = LITHCLASSES.LITHCLASSID');
  dmDV.qSmpLoc.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
  dmDV.qSmpLoc.SQL.Add('AND SMPLOC.SAMPLENO >= :FirstSample');
  dmDV.qSmpLoc.SQL.Add('AND SMPLOC.SAMPLENO <= :LastSample');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qSmpLoc.SQL.Add('AND ( SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qSmpLoc.SQL.Add('OR SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSmpLoc.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmDV.qSmpLoc.SQL.Add('AND ( SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDV.qSmpLoc.SQL.Add('OR SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSmpLoc.SQL.Add(' ) ');
  end;
  dmDV.qSmpLoc.SQL.Add('ORDER BY SMPLOC.SAMPLENO');
  //dmUser.SetDeveloperData('SmpLoc query definition');
  //dmUser.SetDeveloperData(dmDV.qSmpLoc.SQL.Text);
  dmDV.qSmpLoc.ParamByName('FIRSTSAMPLE').Value := UserSession.SampleStartFrom;
  dmDV.qSmpLoc.ParamByName('LASTSAMPLE').Value := UserSession.SampleEndWith;
  dmDV.cdsSmpLoc.Close;
  dmDV.cdsSmpLoc.Open;
  dmDV.cdsContinents.Open;
  dmDV.cdsCountries.Open;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := UserSession.NumRecordsFound div iwDBgSmpLoc.RowLimit;
  iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
end;

procedure TISFSamples.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsSmpLoc.MoveBy(-1*iwDBgSmpLoc.RowLimit);
end;

procedure TISFSamples.iwlFirstPageClick(Sender: TObject);
begin
  dmDV.cdsSmpLoc.First;
  UserSession.PageNum := 1;
end;

procedure TISFSamples.iwlLastPageClick(Sender: TObject);
begin
  dmDV.cdsSmpLoc.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFSamples.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsSmpLoc.MoveBy(iwDBgSmpLoc.RowLimit);
end;

procedure TISFSamples.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFSamples.iwbAddNewSampleClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmDV.AddNewSample(WasSuccessful);
  try
    dmDV.qSmpLoc.Close;
    dmDV.qSmpLoc.ParamByName('FIRSTSAMPLE').Value := 'New' + UserSession.UserID;
    dmDV.qSmpLoc.ParamByName('LASTSAMPLE').Value := 'New' +UserSession.UserID;
    //dmUser.SetDeveloperData(dmDV.qSmpLoc.SQL.Text);
    dmDV.cdsSmpLoc.Close;
    dmDV.cdsSmpLoc.Open;
    UserSession.ParameterChosen := 'New'+UserSession.UserID;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSampleEdit.Create(WebApplication).Show;
  except
    WasSuccessful := false;
  end;
  if not WasSuccessful then WebApplication.ShowMessage('Not able to add new Sample.',smAlert);
end;

procedure TISFSamples.iwDBgSmpLocColumns0Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModify then
  begin
    dmDV.qSmpLoc.Close;
    dmDV.qSmpLoc.ParamByName('FIRSTSAMPLE').Value := UserSession.SampleStartFrom;
    dmDV.qSmpLoc.ParamByName('LASTSAMPLE').Value := UserSession.SampleEndWith;
    dmDV.cdsSmpLoc.Close;
    dmDV.cdsSmpLoc.Open;
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSampleEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Sorry, edit rights are required to do this');
  end;
end;

end.
