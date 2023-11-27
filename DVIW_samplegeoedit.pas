unit DVIW_samplegeoedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWCompText;

type
  TISFSampleGeoEdit = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwdblcbContinent: TIWDBLookupComboBox;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWDBEdit5: TIWDBEdit;
    IWDBEdit6: TIWDBEdit;
    IWDBEdit7: TIWDBEdit;
    iwdblcbCountry: TIWDBLookupComboBox;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDeleteSample: TIWButton;
    iwbEdit: TIWButton;
    iwbCopySampleNo: TIWButton;
    IWLabel15: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    TopBar: TISFTopBar;
    IWText1: TIWText;
    IWLabel21: TIWLabel;
    iwdblcbLithology: TIWDBLookupComboBox;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteSampleClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbCopySampleNoClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_detailsedit;




procedure TISFSampleGeoEdit.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    iwbCopySampleNo.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsEdit,dsInsert]);
    iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsEdit,dsInsert]);
    iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsEdit,dsInsert]);
    iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsBrowse]);
  end;
end;

procedure TISFSampleGeoEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.qSmpLoc.Close;
  dmDV.qSmpLoc.SQL.Clear;
  dmDV.qSmpLoc.SQL.Add('SELECT DISTINCT SmpLoc.SampleNo, SmpLoc.ContinentID, SmpLoc.CountryAbr,');
  dmDV.qSmpLoc.SQL.Add('   SmpLoc.Latitude, SmpLoc.Longitude, SmpLoc.Elevation,');
  dmDV.qSmpLoc.SQL.Add('   SmpLoc.LatitudePrecision, SmpLoc.LongitudePrecision, SmpLoc.ElevationPrecision,SmpLoc.ORIGINALNO,');
  dmDV.qSmpLoc.SQL.Add('   Continent.Continent, Country.Country');
  dmDV.qSmpLoc.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
  dmDV.qSmpLoc.SQL.Add('WHERE CONTINENT.ContinentID = COUNTRY.ContinentID');
  dmDV.qSmpLoc.SQL.Add('AND COUNTRY.ContinentID = SMPLOC.ContinentID');
  dmDV.qSmpLoc.SQL.Add('AND COUNTRY.CountryAbr = SMPLOC.CountryAbr');
  dmDV.qSmpLoc.SQL.Add('AND SMPLOC.SampleNo >= :FirstSample');
  dmDV.qSmpLoc.SQL.Add('AND SMPLOC.SampleNo <= :LastSample');
  dmDV.qSmpLoc.ParamByName('FirstSample').AsString := UserSession.ParameterChosen;
  dmDV.qSmpLoc.ParamByName('LastSample').AsString := UserSession.ParameterChosen;
  dmDV.cdsSmpLoc.Close;
  dmDV.cdsSmpLoc.Open;
  dmDV.cdsContinents.Open;
  dmDV.cdsCountries.Open;
  dmDV.cdsLithol.Open;
end;

procedure TISFSampleGeoEdit.iwbReturnClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFSampleGeoEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpLoc.Post;
  except
  end;
  try
    dmDV.cdsSmpLoc.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFSampleGeoEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpLoc.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFSampleGeoEdit.iwbDeleteSampleClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpLoc.Delete;
    dmDV.cdsSmpLoc.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete Sample.',smAlert);
  end;
end;

procedure TISFSampleGeoEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsSmpLoc.Edit;
end;

procedure TISFSampleGeoEdit.iwbCopySampleNoClick(Sender: TObject);
begin
  dmDV.cdsSmpLocORIGINALNO.AsString := dmDV.cdsSmpLocSAMPLENO.AsString;
end;

end.
