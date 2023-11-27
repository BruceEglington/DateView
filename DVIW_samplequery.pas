unit DVIW_samplequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompButton, IWCompLabel, IWCompEdit, IWCompListbox, IWCompCheckbox,
  IWVCLBaseControl, IWBaseHTMLControl;

type
  TISFSampleQuery = class(TIWAppForm)
    IWLabel1: TIWLabel;
    iwbSubmit: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iweSampleTo: TIWEdit;
    iwcbContinents: TIWCheckBox;
    iwlContinents: TIWListbox;
    iwcbAreas: TIWCheckBox;
    iwlAreas: TIWListbox;
    lblFromError: TIWLabel;
    lblToError: TIWLabel;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    iweSampleFrom: TIWEdit;
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
  ServerController, DVIW_samples, DVIW_dm, DB_List_Combo, DVIW_constants,
  DVIW_samplesfractions;




procedure TISFSampleQuery.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweSampleFrom.Text := UserSession.SampleStartFrom;
  iweSampleTo.Text := UserSession.SampleEndWith;
  iwcbContinents.Checked := UserSession.IncludeContinentValues;
  iwcbAreas.Checked := UserSession.IncludeAreaValues;
  UpdateListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
end;

procedure TISFSampleQuery.IWAppFormCreate(Sender: TObject);
begin
  ClearErrorMessages;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweSampleFrom.Text := UserSession.SampleStartFrom;
  iweSampleTo.Text := UserSession.SampleEndWith;
  iwcbContinents.Checked := UserSession.IncludeContinentValues;
  iwcbAreas.Checked := UserSession.IncludeAreaValues;
  UpdateListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
end;

procedure TISFSampleQuery.iwbSubmitClick(Sender: TObject);
begin
  UserSession.SampleStartFrom := iweSampleFrom.Text;
  UserSession.SampleEndWith := iweSampleTo.Text;
  UserSession.IncludeContinentValues := iwcbContinents.Checked;
  UserSession.IncludeAreaValues := iwcbAreas.Checked;
  GetListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  GetListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count = 0)) then UserSession.IncludeContinentValues := false;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count = 0)) then UserSession.IncludeAreaValues := false;
  if Validate then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.UnitSender = usSample) then TISFSamples.Create(WebApplication).Show;
    if (UserSession.UnitSender = usSampleFrac) then TISFSamplesFractions.Create(WebApplication).Show;
  end;
end;

function TISFSampleQuery.Validate: Boolean;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iweSampleFrom.Text) = '') then
  begin
    lblFromError.Caption := '''Samples ranging from'' requires a value.';
    Result := false;
  end;
  if (Trim(iweSampleTo.Text) = '') then
  begin
    lblToError.Caption := '''Samples ranging to'' requires a value.';
    Result := false;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFSampleQuery.ClearErrorMessages;
begin
  lblFromError.Caption := '';
  lblToError.Caption := '';
end;

end.
