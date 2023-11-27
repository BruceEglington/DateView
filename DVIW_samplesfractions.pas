unit DVIW_samplesfractions;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFSamplesFractions = class(TIWAppForm)
    iwDBgSamplesFractions: TIWDBGrid;
    iwbClose: TIWButton;
    iwbAddNewSample: TIWButton;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    iwDBnSamplesFractions: TIWDBNavigator;
    iwbEdit: TIWButton;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDeleteSample: TIWButton;
    IWLabel1: TIWLabel;
    iwDBeSampleNo: TIWDBEdit;
    IWLabel4: TIWLabel;
    iwDBeFrac: TIWDBEdit;
    IWLabel2: TIWLabel;
    iwdblcbSampleZone: TIWDBLookupComboBox;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbAddNewSampleClick(Sender: TObject);
    procedure iwbDeleteSampleClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwDBgSamplesFractionsColumns1Click(ASender: TObject;
      const AValue: string);
    procedure iwDBgSamplesFractionsColumns0Click(ASender: TObject;
      const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, IWColor, Graphics,
  DVIW_dm, DVIW_uMain, DVIW_constants, DVIW_sampleedit;




procedure TISFSamplesFractions.IWAppFormRender(Sender: TObject);
begin
  iwbAddNewSample.Visible := UserSession.CanModify and (dmDV.cdsSmpFracRange.State in [dsbrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpFracRange.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpFracRange.State in [dsEdit,dsInsert]);
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsSmpFracRange.State in [dsBrowse]);
  iwbDeleteSample.Visible := UserSession.CanDelete and (dmDV.cdsSmpFracRange.State in [dsBrowse]);
  iwDBeFrac.Editable := UserSession.CanModify and (dmDV.cdsSmpFracRange.State in [dsEdit]);
  iwdblcbSampleZone.Editable := UserSession.CanModify and (dmDV.cdsSmpFracRange.State in [dsEdit]);
end;

procedure TISFSamplesFractions.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //SampleZones
  dmDV.cdsSampleZones.Close;
  dmDV.cdsSampleZones.Open;
  //SmpFracRange
  dmDV.qSmpFracRange.Close;
  dmDV.qSmpFracRange.SQL.Clear;
  dmDV.qSmpFracRange.SQL.Add('SELECT SMPFRAC.SAMPLENO, SMPFRAC.FRAC, SMPFRAC.ZONEID');
  dmDV.qSmpFracRange.SQL.Add('FROM SMPFRAC,SMPLOC');
  dmDV.qSmpFracRange.SQL.Add('WHERE SMPFRAC.SAMPLENO >= :FirstSample');
  dmDV.qSmpFracRange.SQL.Add('AND SMPFRAC.SAMPLENO <= :LastSample');
  dmDV.qSmpFracRange.SQL.Add('AND SMPFRAC.SAMPLENO = SMPLOC.SAMPLENO');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qSmpFracRange.SQL.Add('AND ( SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qSmpFracRange.SQL.Add('OR SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSmpFracRange.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmDV.qSmpFracRange.SQL.Add('AND ( SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDV.qSmpFracRange.SQL.Add('OR SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSmpFracRange.SQL.Add(' ) ');
  end;
  dmDV.qSmpFracRange.SQL.Add('ORDER BY SMPFRAC.SAMPLENO,SMPFRAC.FRAC');
  dmDV.qSmpFracRange.ParamByName('FIRSTSAMPLE').Value := UserSession.SampleStartFrom;
  dmDV.qSmpFracRange.ParamByName('LASTSAMPLE').Value := UserSession.SampleEndWith;
  dmDV.cdsSmpFracRange.Close;
  dmDV.cdsSmpFracRange.Open;
end;

procedure TISFSamplesFractions.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpFracRange.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFSamplesFractions.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFSamplesFractions.iwbDeleteSampleClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpFracRange.Delete;
    dmDV.cdsSmpFracRange.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete Fraction.',smAlert);
  end;
end;

procedure TISFSamplesFractions.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsSmpFracRange.Edit;
end;

procedure TISFSamplesFractions.iwbSaveChangesClick(Sender: TObject);
var
  tmpSampleNo : string;
begin
  try
    dmDV.cdsSmpFracRange.Post;
  except
  end;
  tmpSampleNo := dmDV.cdsSmpFracRangeSAMPLENO.AsString;
  try
    dmDV.cdsSmpFracRange.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
  dmDV.cdsSmpFracRange.Locate('SAMPLENO',tmpSampleNo,[]);
  //dmDV.qSmpFracRange.Close;
  //dmDV.qSmpFracRange.ParamByName('FIRSTSAMPLE').Value := tmpSampleNo;
  //dmDV.qSmpFracRange.ParamByName('LASTSAMPLE').Value := tmpSampleNo;
  //dmDV.cdsSmpFracRange.Close;
  //dmDV.cdsSmpFracRange.Open;
end;

procedure TISFSamplesFractions.iwDBgSamplesFractionsColumns0Click(
  ASender: TObject; const AValue: string);
begin
  dmDV.cdsSmpFracRange.Locate('SAMPLENO',AValue,[]);
end;

procedure TISFSamplesFractions.iwDBgSamplesFractionsColumns1Click(
  ASender: TObject; const AValue: string);
begin
  dmDV.cdsSmpFracRange.Locate('FRAC',AValue,[]);
end;

procedure TISFSamplesFractions.iwbAddNewSampleClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmDV.AddNewSampleFrac(WasSuccessful);
  dmDV.cdsSmpFracRange.Close;
  dmDV.cdsSmpFracRange.Open;
  dmDV.cdsSmpFracRange.Locate('FRAC','New',[]);
  if not WasSuccessful then WebApplication.ShowMessage('Not able to add new Sample.',smAlert);
end;

end.
