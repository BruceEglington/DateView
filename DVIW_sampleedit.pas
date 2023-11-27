unit DVIW_sampleedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWCompText,
  IWHTMLControls;

type
  TISFSampleEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwDBeSampleNo: TIWDBEdit;
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
    IWText1: TIWText;
    IWLabel10: TIWLabel;
    IWLabel11: TIWLabel;
    IWHRule1: TIWHRule;
    iwbConvert: TIWButton;
    eLatDeg: TIWEdit;
    IWLabel12: TIWLabel;
    eLonDeg: TIWEdit;
    IWLabel13: TIWLabel;
    eLatMin: TIWEdit;
    eLonMin: TIWEdit;
    IWLabel14: TIWLabel;
    eLatSec: TIWEdit;
    eLonSec: TIWEdit;
    iwcbLat: TIWComboBox;
    iwcbLon: TIWComboBox;
    iwbEdit: TIWButton;
    IWLabel15: TIWLabel;
    iwDBeOriginal: TIWDBEdit;
    iwbCopySampleNo: TIWButton;
    TopBar: TISFTopBar;
    iwcbPrecision: TIWComboBox;
    IWLabel16: TIWLabel;
    IWLabel17: TIWLabel;
    IWHRule2: TIWHRule;
    iwbUTM2DD: TIWButton;
    IWLabel18: TIWLabel;
    IWLabel19: TIWLabel;
    eUTMZone: TIWEdit;
    IWLabel20: TIWLabel;
    eUTMnorthing: TIWEdit;
    iwcbUTMHemisphere: TIWComboBox;
    iwcbUTMPrecision: TIWComboBox;
    eUTMeasting: TIWEdit;
    IWLabel22: TIWLabel;
    IWLabel23: TIWLabel;
    IWLabel21: TIWLabel;
    iwdblcbLithology: TIWDBLookupComboBox;
    IWLabel24: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteSampleClick(Sender: TObject);
    procedure iwbConvertClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbCopySampleNoClick(Sender: TObject);
    procedure iwbUTM2DDClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_samples, usrIW_dm, Mathproc;




procedure TISFSampleEdit.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    iwbCopySampleNo.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsEdit,dsInsert]);
    iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsEdit,dsInsert]);
    iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsEdit,dsInsert]);
    iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsBrowse]);
    iwbReturn.Visible := UserSession.CanModify and (dmDV.cdsSmpLoc.State in [dsBrowse]);
  end;
end;

procedure TISFSampleEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //dmUser.SetDeveloperData('after inserting default new sample '+UserSession.ParameterChosen);
  dmDV.cdsSmpLoc.Locate('SAMPLENO',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
  dmDV.cdsContinents.Open;
  dmDV.cdsCountries.Open;
  dmDV.cdsLithol.Open;
end;

procedure TISFSampleEdit.iwbReturnClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFsamples.Create(WebApplication).Show;
end;

procedure TISFSampleEdit.iwbSaveChangesClick(Sender: TObject);
var
  tmpSampleNo : string;
begin
  try
    dmDV.cdsSmpLoc.Post;
  except
    //dmUser.SetDeveloperData('exception posting SmpLoc record');
  end;
  tmpSampleNo := dmDV.cdsSmpLocSAMPLENO.AsString;
  //dmUser.SetDeveloperData('tmpSampleNo = '+tmpSampleNo);
  try
    dmDV.cdsSmpLoc.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
  dmDV.qSmpLoc.Close;
  //dmUser.SetDeveloperData(dmDV.qSmpLoc.SQL.Text);
  dmDV.qSmpLoc.ParamByName('FIRSTSAMPLE').Value := tmpSampleNo;
  dmDV.qSmpLoc.ParamByName('LASTSAMPLE').Value := tmpSampleNo;
  dmDV.cdsSmpLoc.Close;
  dmDV.cdsSmpLoc.Open;
end;

procedure TISFSampleEdit.iwbUTM2DDClick(Sender: TObject);
const
	k0 : double = 0.9996;
	a : double = 6378137.0; //equatorial radius for WGS84 datum
	eccSquared : double = 0.00669438; //eccentricitySquared for WGS84 datum;
var
  iCode : integer;
  UTMzone : integer;
  UTMnorthing, UTMeasting, LatDeg, LatMin, LatSec, LatDecimal : double;
  LonDeg, LonMin, LonSec, LonDecimal : double;
  LatDirection, LonDirection, UTMhemisphere : string;
  tmpPrecision : double;
	eccPrimeSquared : double;
	e1 : double;
	N1, T1, C1, R1, D, M : double;
	LongOrigin : double;
	mu, phi1, phi1Rad : double;
	x, y : double;
	NorthernHemisphere : integer; //1 for northern hemispher, 0 for southern
begin
  LatDeg := 0.0;
  LatMin := 0.0;
  LatSec := 0.0;
  iCode := 0;
  UTMeasting := 0.0;
  UTMhemisphere := 'N';
  UTMnorthing := 0.0;
  UTMzone := 0;
  if (eUTMzone.Text <> '') then
  begin
    Val(eUTMzone.Text,UTMzone,iCode);
  end;
  if (eUTMnorthing.Text <> '') then
  begin
    Val(eUTMnorthing.Text,UTMnorthing,iCode);
  end;
  if (Length(iwcbUTMhemisphere.Text) = 1) then
  begin
    LatDirection := iwcbUTMhemisphere.Text;
    UTMhemisphere := LatDirection;
  end else
  begin
    iCode := 1;
  end;
  if (iCode = 0) then
  begin
    //LatDecimal := LatDeg + LatMin/60.0 + LatSec/3600.0;
    //if (LatDirection = 'S') then LatDecimal := -1.0 * LatDecimal;
    //dmDV.cdsSmpLoc.Edit;
    //dmDV.cdsSmpLocLATITUDE.AsFloat := LatDecimal;
  end else
  begin
    WebApplication.ShowMessage('Northing is not correctly given');
  end;
  LonDeg := 0.0;
  LonMin := 0.0;
  LonSec := 0.0;
  iCode := 0;
  if (eUTMeasting.Text <> '') then
  begin
    Val(eUTMeasting.Text,UTMeasting,iCode);
  end;
  if (iCode = 0) then
  begin
    //LonDecimal := LonDeg + LonMin/60.0 + LonSec/3600.0;
    //if (LonDirection = 'W') then LonDecimal := -1.0 * LonDecimal;
    //dmDV.cdsSmpLoc.Edit;
    //dmDV.cdsSmpLocLONGITUDE.AsFloat := LonDecimal;
  end else
  begin
    WebApplication.ShowMessage('Easting is not correctly given');
  end;
(*
//converts UTM coords to lat/long.  Equations from USGS Bulletin 1532
//East Longitudes are positive, West longitudes are negative.
//North latitudes are positive, South latitudes are negative
//Lat and Long are in decimal degrees.
//Based on C code written by Chuck Gantz- chuck.gantz@globalstar.com
//taken from URL http://www.gpsy.com/gpsinfo/geotoutm/

	double k0 = 0.9996;
	double a = ellipsoid[ReferenceEllipsoid].EquatorialRadius;
	double eccSquared = ellipsoid[ReferenceEllipsoid].eccentricitySquared;
	double eccPrimeSquared;
	double e1 = (1-sqrt(1-eccSquared))/(1+sqrt(1-eccSquared));
	double N1, T1, C1, R1, D, M;
	double LongOrigin;
	double mu, phi1, phi1Rad;
	double x, y;
	int ZoneNumber;
	char* ZoneLetter;
	int NorthernHemisphere; //1 for northern hemispher, 0 for southern

	x = UTMEasting - 500000.0; //remove 500,000 meter offset for longitude
	y = UTMNorthing;

	ZoneNumber = strtoul(UTMZone, &ZoneLetter, 10);
	if((*ZoneLetter - 'N') >= 0)
		NorthernHemisphere = 1;//point is in northern hemisphere
	else
	{
		NorthernHemisphere = 0;//point is in southern hemisphere
		y -= 10000000.0;//remove 10,000,000 meter offset used for southern hemisphere
	}

	LongOrigin = (ZoneNumber - 1)*6 - 180 + 3;  //+3 puts origin in middle of zone

	eccPrimeSquared = (eccSquared)/(1-eccSquared);

	M = y / k0;
	mu = M/(a*(1-eccSquared/4-3*eccSquared*eccSquared/64-5*eccSquared*eccSquared*eccSquared/256));

	phi1Rad = mu	+ (3*e1/2-27*e1*e1*e1/32)*sin(2*mu)
				+ (21*e1*e1/16-55*e1*e1*e1*e1/32)*sin(4*mu)
				+(151*e1*e1*e1/96)*sin(6*mu);
	phi1 = phi1Rad*rad2deg;

	N1 = a/sqrt(1-eccSquared*sin(phi1Rad)*sin(phi1Rad));
	T1 = tan(phi1Rad)*tan(phi1Rad);
	C1 = eccPrimeSquared*cos(phi1Rad)*cos(phi1Rad);
	R1 = a*(1-eccSquared)/pow(1-eccSquared*sin(phi1Rad)*sin(phi1Rad), 1.5);
	D = x/(N1*k0);

	Lat = phi1Rad - (N1*tan(phi1Rad)/R1)*(D*D/2-(5+3*T1+10*C1-4*C1*C1-9*eccPrimeSquared)*D*D*D*D/24
					+(61+90*T1+298*C1+45*T1*T1-252*eccPrimeSquared-3*C1*C1)*D*D*D*D*D*D/720);
	Lat = Lat * rad2deg;

	Long = (D-(1+2*T1+C1)*D*D*D/6+(5-2*C1+28*T1-3*C1*C1+8*eccPrimeSquared+24*T1*T1)
					*D*D*D*D*D/120)/cos(phi1Rad);
	Long = LongOrigin + Long * rad2deg;

*)
  if (iCode = 0) then
  begin
    e1 := (1.0-sqrt(1.0-eccSquared))/(1.0+sqrt(1.0-eccSquared));
    x := UTMEasting - 500000.0; //remove 500,000 meter offset for longitude
    y := UTMNorthing;
    if (UTMhemisphere = 'N') then	NorthernHemisphere := 1;//point is in northern hemisphere
    if (UTMhemisphere = 'S') then
    begin
      NorthernHemisphere := 0;//point is in southern hemisphere
      y := y - 10000000.0;//remove 10,000,000 meter offset used for southern hemisphere
    end;
    LongOrigin := (UTMzone - 1.0)*6.0 - 180.0 + 3.0;  //+3 puts origin in middle of zone
    eccPrimeSquared := (eccSquared)/(1-eccSquared);
    M := y / k0;
    mu := M/(a*(1.0-eccSquared/4.0-3.0*eccSquared*eccSquared/64.0-5.0*eccSquared*eccSquared*eccSquared/256.0));
    phi1Rad := mu	+ (3.0*e1/2.0-27.0*e1*e1*e1/32.0)*sin(2.0*mu)
          + (21.0*e1*e1/16.0-55.0*e1*e1*e1*e1/32.0)*sin(4.0*mu)
          +(151.0*e1*e1*e1/96.0)*sin(6.0*mu);
    phi1 := phi1Rad*180.0/pi;

    N1 := a/sqrt(1.0-eccSquared*sin(phi1Rad)*sin(phi1Rad));
    T1 := tan(phi1Rad)*tan(phi1Rad);
    C1 := eccPrimeSquared*cos(phi1Rad)*cos(phi1Rad);
    R1 := a*(1.0-eccSquared)/power(1.5,1.0-eccSquared*sin(phi1Rad)*sin(phi1Rad));
    D := x/(N1*k0);

    LatDecimal := phi1Rad - (N1*tan(phi1Rad)/R1)*(D*D/2.0-(5.0+3.0*T1+10.0*C1-4.0*C1*C1-9.0*eccPrimeSquared)*D*D*D*D/24.0
            +(61.0+90.0*T1+298.0*C1+45.0*T1*T1-252.0*eccPrimeSquared-3*C1*C1)*D*D*D*D*D*D/720.0);
    LatDecimal := LatDecimal * 180.0/pi;
    {
    if (UTMhemisphere = 'S') then
    begin
      if (LatDecimal > 0.0) then LatDecimal := LatDecimal - 90.0;
    end;
    }

    LonDecimal := (D-(1.0+2.0*T1+C1)*D*D*D/6.0+(5.0-2.0*C1+28.0*T1-3.0*C1*C1+8.0*eccPrimeSquared+24.0*T1*T1)
            *D*D*D*D*D/120.0)/cos(phi1Rad);
    LonDecimal := LongOrigin + LonDecimal * 180.0/pi;
    dmDV.cdsSmpLoc.Edit;
    dmDV.cdsSmpLocLONGITUDE.AsFloat := LonDecimal;
    dmDV.cdsSmpLocLATITUDE.AsFloat := LatDecimal;
  end;
  tmpPrecision := 0.00001;
  if (iwcbUTMPrecision.ItemIndex > -1) then
  begin
    if (iwcbUTMPrecision.ItemIndex = 1) then tmpPrecision := 0.00001;
    if (iwcbUTMPrecision.ItemIndex = 2) then tmpPrecision := 0.00009;
    if (iwcbUTMPrecision.ItemIndex = 3) then tmpPrecision := 0.00046;
    if (iwcbUTMPrecision.ItemIndex = 4) then tmpPrecision := 0.00091;
    if (iwcbUTMPrecision.ItemIndex = 5) then tmpPrecision := 0.00456;
    if (iwcbUTMPrecision.ItemIndex = 6) then tmpPrecision := 0.00911;
    if (iwcbUTMPrecision.ItemIndex = 7) then tmpPrecision := 0.04557;
    if (iwcbUTMPrecision.ItemIndex = 8) then tmpPrecision := 0.22786;
    dmDV.cdsSmpLoc.Edit;
    dmDV.cdsSmpLocLATITUDEPRECISION.AsFloat := tmpPrecision;
    dmDV.cdsSmpLocLONGITUDEPRECISION.AsFloat := tmpPrecision;
  end;
end;

procedure TISFSampleEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpLoc.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFSampleEdit.iwbDeleteSampleClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpLoc.Delete;
    dmDV.cdsSmpLoc.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete Sample.',smAlert);
  end;
end;

procedure TISFSampleEdit.iwbConvertClick(Sender: TObject);
var
  iCode : integer;
  LatDeg, LatMin, LatSec, LatDecimal : double;
  LonDeg, LonMin, LonSec, LonDecimal : double;
  LatDirection, LonDirection : string;
  tmpPrecision : double;
begin
  LatDeg := 0.0;
  LatMin := 0.0;
  LatSec := 0.0;
  iCode := 0;
  LatDirection := '';
  LonDirection := '';
  if (eLatDeg.Text <> '') then
  begin
    Val(eLatDeg.Text,LatDeg,iCode);
  end;
  if (eLatMin.Text <> '') then
  begin
    Val(eLatMin.Text,LatMin,iCode);
  end;
  if (eLatSec.Text <> '') then
  begin
    Val(eLatSec.Text,LatSec,iCode);
  end;
  if (Length(iwcbLat.Text) > 0) then
  begin
    LatDirection := iwcbLat.Text;
  end else
  begin
    iCode := 1;
  end;
  if (iCode = 0) then
  begin
    LatDecimal := LatDeg + LatMin/60.0 + LatSec/3600.0;
    if (LatDirection = 'S') then LatDecimal := -1.0 * LatDecimal;
    dmDV.cdsSmpLoc.Edit;
    dmDV.cdsSmpLocLATITUDE.AsFloat := LatDecimal;
  end else
  begin
    WebApplication.ShowMessage('Latitude is not correctly given');
  end;
  LonDeg := 0.0;
  LonMin := 0.0;
  LonSec := 0.0;
  iCode := 0;
  if (eLonDeg.Text <> '') then
  begin
    Val(eLonDeg.Text,LonDeg,iCode);
  end;
  if (eLonMin.Text <> '') then
  begin
    Val(eLonMin.Text,LonMin,iCode);
  end;
  if (eLonSec.Text <> '') then
  begin
    Val(eLonSec.Text,LonSec,iCode);
  end;
  if (Length(iwcbLon.Text) = 1) then
  begin
    LonDirection := iwcbLon.Text;
  end else
  begin
    iCode := 1;
  end;
  if (iCode = 0) then
  begin
    LonDecimal := LonDeg + LonMin/60.0 + LonSec/3600.0;
    if (LonDirection = 'W') then LonDecimal := -1.0 * LonDecimal;
    dmDV.cdsSmpLoc.Edit;
    dmDV.cdsSmpLocLONGITUDE.AsFloat := LonDecimal;
  end else
  begin
    WebApplication.ShowMessage('Longitude is not correctly given');
  end;
  tmpPrecision := 0.00001;
  if (iwcbPrecision.ItemIndex > -1) then
  begin
    if (iwcbPrecision.ItemIndex = 1) then tmpPrecision := 0.00001;
    if (iwcbPrecision.ItemIndex = 2) then tmpPrecision := 0.00009;
    if (iwcbPrecision.ItemIndex = 3) then tmpPrecision := 0.00046;
    if (iwcbPrecision.ItemIndex = 4) then tmpPrecision := 0.00091;
    if (iwcbPrecision.ItemIndex = 5) then tmpPrecision := 0.00456;
    if (iwcbPrecision.ItemIndex = 6) then tmpPrecision := 0.00911;
    if (iwcbPrecision.ItemIndex = 7) then tmpPrecision := 0.04557;
    if (iwcbPrecision.ItemIndex = 8) then tmpPrecision := 0.22786;
    dmDV.cdsSmpLoc.Edit;
    dmDV.cdsSmpLocLATITUDEPRECISION.AsFloat := tmpPrecision;
    dmDV.cdsSmpLocLONGITUDEPRECISION.AsFloat := tmpPrecision;
  end;
end;

procedure TISFSampleEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsSmpLoc.Edit;
end;

procedure TISFSampleEdit.iwbCopySampleNoClick(Sender: TObject);
begin
  {
  dmDV.cdsSmpLoc.Post;
  dmDV.cdsSmpLoc.Edit;
  }
  dmDV.cdsSmpLocORIGINALNO.AsString := dmDV.cdsSmpLocSAMPLENO.AsString;
end;

end.
