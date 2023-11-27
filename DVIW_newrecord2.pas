unit DVIW_newrecord2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWCompEdit;

type
  TISFNewRecord2 = class(TIWAppForm)
    iwbNextStageOfQuery: TIWButton;
    iwcbArea: TIWComboBox;
    IWLabel1: TIWLabel;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    TopBar: TISFTopBar;
    iweUnitTo: TIWEdit;
    iweUnitFrom: TIWEdit;
    IWLabel10: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iweSampleFrom: TIWEdit;
    IWLabel4: TIWLabel;
    iweSampleTo: TIWEdit;
    IWLabel5: TIWLabel;
    iweProvinceFrom: TIWEdit;
    IWLabel6: TIWLabel;
    iweProvinceTo: TIWEdit;
    IWLabel7: TIWLabel;
    iweTerraneFrom: TIWEdit;
    IWLabel8: TIWLabel;
    iweTerraneTo: TIWEdit;
    IWLabel9: TIWLabel;
    iweReferenceFrom: TIWEdit;
    IWLabel11: TIWLabel;
    iweReferenceTo: TIWEdit;
    IWText2: TIWText;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  end;

implementation

uses DVIW_dm, ServerController, DVIW_newrecord3, DB_List_Combo, DVIW_uMain,
  usrIW_dm;

{$R *.dfm}


procedure TISFNewRecord2.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iweUnitFrom.Text := UserSession.UnitStartFrom;
  iweUnitTo.Text := UserSession.UnitEndWith;
  iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
  iweReferenceTo.Text := UserSession.ReferenceEndWith;
  iweSampleFrom.Text := UserSession.SampleStartFrom;
  iweSampleTo.Text := UserSession.SampleEndWith;
  iweProvinceFrom.Text := UserSession.ProvinceStartFrom;
  iweProvinceTo.Text := UserSession.ProvinceEndWith;
  iweTerraneFrom.Text := UserSession.TerraneStartFrom;
  iweTerraneTo.Text := UserSession.TerraneEndWith;
  dmDV.qCountries.Close;
  dmDV.qCountries.SQL.Clear;
  dmDV.qCountries.SQL.Add('select COUNTRY.COUNTRYABR, COUNTRY.COUNTRY, COUNTRY.COUNTRYOFFSET,');
  dmDV.qCountries.SQL.Add('  COUNTRY.COUNTRYOFFSET2, COUNTRY.COUNTRYOFFSET3, COUNTRY.CONTINENTID,');
  dmDV.qCountries.SQL.Add('  CONTINENT.CONTINENT, COUNTRY.COUNTRYHASRECORDS');
  dmDV.qCountries.SQL.Add('from COUNTRY, CONTINENT');
  dmDV.qCountries.SQL.Add('where COUNTRY.CONTINENTID=CONTINENT.CONTINENTID');
  dmDV.qCountries.SQL.Add('order by COUNTRY.COUNTRY');
  dmDV.cdsCountries.Close;
  dmDV.cdsCountries.Open;
  dmDV.cdsCountries.Filter := 'CONTINENTID='+''''+UserSession.NewContinentID+'''';
  dmDV.cdsCountries.Filtered := true;
  SetComboBox(iwcbArea,dmDV.cdsCountries,'Country','CountryAbr');
end;

procedure TISFNewRecord2.iwbNextStageOfQueryClick(Sender: TObject);
begin
  GetComboBoxValue(iwcbArea,dmDV.cdsCountries,'Country','CountryAbr',UserSession.NewAreaID);
  dmDV.cdsCountries.Close;
  UserSession.UnitStartFrom := iweUnitFrom.Text;
  UserSession.UnitEndWith := iweUnitTo.Text;
  UserSession.ReferenceStartFrom := iweReferenceFrom.Text;
  UserSession.ReferenceEndWith := iweReferenceTo.Text;
  UserSession.SampleStartFrom := iweSampleFrom.Text;
  UserSession.SampleEndWith := iweSampleTo.Text;
  UserSession.ProvinceStartFrom := iweProvinceFrom.Text;
  UserSession.ProvinceEndWith := iweProvinceTo.Text;
  UserSession.TerraneStartFrom := iweTerraneFrom.Text;
  UserSession.TerraneEndWith := iweTerraneTo.Text;
  //dmUser.SetDeveloperData('After NewRecord2 in DateView');
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFNewRecord3.Create(WebApplication).Show;
end;

procedure TISFNewRecord2.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UpdateComboBoxValue(iwcbArea,dmDV.cdsCountries,'Country','CountryAbr',UserSession.NewAreaID);
  end;
end;

procedure TISFNewRecord2.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
