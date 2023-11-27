unit DVIW_unitquery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompButton, IWCompLabel, IWCompEdit, IWCompListbox, IWCompCheckbox,
  IWVCLBaseControl, IWBaseHTMLControl;

type
  TISFUnitQuery = class(TIWAppForm)
    iweFrom: TIWEdit;
    IWLabel1: TIWLabel;
    iwbSubmit: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iweTo: TIWEdit;
    iwlAreas: TIWListbox;
    lblFromError: TIWLabel;
    lblToError: TIWLabel;
    rectLeft: TIWRectangle;
    lblAreaError: TIWLabel;
    IWLabel4: TIWLabel;
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




procedure TISFUnitQuery.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweFrom.Text := UserSession.UnitStartFrom;
  iweTo.Text := UserSession.UnitEndWith;
  UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
end;

procedure TISFUnitQuery.IWAppFormCreate(Sender: TObject);
begin
  ClearErrorMessages;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweFrom.Text := UserSession.UnitStartFrom;
  iweTo.Text := UserSession.UnitEndWith;
  UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
end;

procedure TISFUnitQuery.iwbSubmitClick(Sender: TObject);
begin
  UserSession.UnitStartFrom := iweFrom.Text;
  UserSession.UnitEndWith := iweTo.Text;
  GetListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
  if Validate then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.UnitSender = 'Units') then TISFUnits.Create(WebApplication).Show;
    if (UserSession.UnitSender = 'UnitAreas') then TISFUnitAreas.Create(WebApplication).Show;
  end;
end;

function TISFUnitQuery.Validate: Boolean;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iweFrom.Text) = '') then
  begin
    lblFromError.Caption := '''Strat. Units ranging from'' requires a value.';
    Result := false;
  end;
  if (Trim(iweTo.Text) = '') then
  begin
    lblToError.Caption := '''Strat. Units ranging to'' requires a value.';
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

procedure TISFUnitQuery.ClearErrorMessages;
begin
  lblFromError.Caption := '';
  lblToError.Caption := '';
  lblAreaError.Caption := '';
end;

end.
