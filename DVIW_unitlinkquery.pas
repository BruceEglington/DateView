unit DVIW_unitlinkquery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompButton, IWCompLabel, IWCompEdit, IWCompListbox, IWCompCheckbox,
  IWVCLBaseControl, IWBaseHTMLControl;

type
  TISFUnitAreaLinkQuery = class(TIWAppForm)
    IWLabel1: TIWLabel;
    iwbSubmit: TIWButton;
    iwlAreas: TIWListbox;
    lblUnitError: TIWLabel;
    rectLeft: TIWRectangle;
    lblAreaError: TIWLabel;
    IWLabel4: TIWLabel;
    iwcbUnit: TIWComboBox;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ;
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DVIW_unitareas, DVIW_units, DB_List_Combo;




procedure TISFUnitAreaLinkQuery.IWAppFormRender(Sender: TObject);
begin
  UpdateComboBoxValue(iwcbUnit,dmDV.cdsUnits,'UNITNAME','UNITID',UserSession.NewUnitID);
  UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
end;

procedure TISFUnitAreaLinkQuery.IWAppFormCreate(Sender: TObject);
begin
  ClearErrorMessages;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.qUnits.Close;
  dmDV.qUnits.SQL.Clear;
  dmDV.qUnits.SQL.Add('SELECT SUITE.UNITNAME, SUITE.UNITRANK, SUITE.GISID,SUITE.UNITID, ');
  dmDV.qUnits.SQL.Add('  SUITE.FORMATIONOFFSET, SUITE.FORMATIONOFFSET2, SUITE.FORMATIONOFFSET3');
  dmDV.qUnits.SQL.Add('FROM SUITE');
  dmDV.qUnits.SQL.Add('WHERE SUITE.UNITNAME >= :FirstValue');
  dmDV.qUnits.SQL.Add('AND SUITE.UNITNAME <= :LastValue');
  dmDV.qUnits.SQL.Add('ORDER BY SUITE.UNITNAME, SUITE.UNITRANK');
  dmDV.qUnits.ParamByName('FIRSTVALUE').AsString := UserSession.UnitStartFrom;
  dmDV.qUnits.ParamByName('LASTVALUE').AsString := UserSession.UnitEndWith;
  dmDV.cdsUnits.Close;
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
  UpdateComboBoxValue(iwcbUnit,dmDV.cdsUnits,'UNITNAME','UNITID',UserSession.NewUnitID);
  UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
end;

procedure TISFUnitAreaLinkQuery.iwbSubmitClick(Sender: TObject);
var
  i : integer;
  WasSuccessful : boolean;
begin
  try
    GetComboBoxValue(iwcbUnit,dmDV.cdsUnits,'UNITNAME','UNITID',UserSession.NewUnitID);
    GetListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
    if Validate then
    begin
      for i := 1 to UserSession.AreaValues.Count do
      begin
        dmDV.AddUnitAreaLink(UserSession.NewUnitID,UserSession.AreaValues.Strings[i-1],WasSuccessful);
        {
        try
          dmDV.cdsUnitCountry.Append;
          dmDV.cdsUnitCountryUNITID.AsString := UserSession.NewUnitID;
          dmDV.cdsUnitCountryCOUNTRYABR.AsString := UserSession.AreaValues.Strings[i-1];
          dmDV.cdsUnitCountry.Post;
        except
        end;
        }
      end;
    end;
    //dmDV.cdsUnitCountry.ApplyUpdates(UserSession.AreaValues.Count);
  except
    WebApplication.ShowMessage('Not able to add some new links.',smAlert);
  end;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFUnitAreas.Create(WebApplication).Show;
end;

function TISFUnitAreaLinkQuery.Validate: Boolean;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iwcbUnit.Text) = '') then
  begin
    lblUnitError.Caption := 'A stratigraphic unit must be selected.';
    Result := false;
  end;
  if (UserSession.AreaValues.Count = 0) then
  begin
    lblAreaError.Caption := 'At least one area must be specified.';
    Result := false;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFUnitAreaLinkQuery.ClearErrorMessages;
begin
  lblUnitError.Caption := '';
  lblAreaError.Caption := '';
end;

end.
