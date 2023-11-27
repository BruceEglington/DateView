unit DVIW_referencequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompButton, IWCompLabel, IWCompEdit, IWCompListbox, IWCompCheckbox,
  IWVCLBaseControl, IWBaseHTMLControl, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TISFReferenceQuery = class(TIWAppForm)
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    iwrRight: TIWRegion;
    iwrReferenceRange: TIWRegion;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iweReferenceFrom: TIWEdit;
    IWLabel3: TIWLabel;
    iweReferenceTo: TIWEdit;
    lblFromError: TIWLabel;
    lblToError: TIWLabel;
    iwrReferences: TIWRegion;
    iwcbContinents: TIWCheckBox;
    iwlContinents: TIWListbox;
    iwrButtonsBottom: TIWRegion;
    iwbSubmit: TIWButton;
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
  ServerController, DVIW_references, DB_List_Combo, DVIW_constants,
  DVIW_dmstrat;




procedure TISFReferenceQuery.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
  iweReferenceTo.Text := UserSession.ReferenceEndWith;
  iwcbContinents.Checked := UserSession.IncludeContinentValues;
  UpdateListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
end;

procedure TISFReferenceQuery.IWAppFormCreate(Sender: TObject);
begin
  ClearErrorMessages;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
  iweReferenceTo.Text := UserSession.ReferenceEndWith;
  if (Trim(UserSession.ReferenceStartFrom) = '') then UserSession.ReferenceStartFrom := '0';
  if (Trim(UserSession.ReferenceEndWith) = '') then UserSession.ReferenceEndWith := 'zz';
  iweReferenceFrom.Text := UserSession.ReferenceStartFrom;
  iweReferenceTo.Text := UserSession.ReferenceEndWith;
  iwcbContinents.Checked := UserSession.IncludeContinentValues;
  UpdateListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
end;

procedure TISFReferenceQuery.iwbSubmitClick(Sender: TObject);
begin
  UserSession.ReferenceStartFrom := iweReferenceFrom.Text;
  UserSession.ReferenceEndWith := iweReferenceTo.Text;
  UserSession.IncludeContinentValues := iwcbContinents.Checked;
  GetListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  if Validate then
  begin
    UserSession.ParameterChosen := NothingChosen;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFReferences.Create(WebApplication).Show;
  end;
end;

function TISFReferenceQuery.Validate: Boolean;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iweReferenceFrom.Text) = '') then
  begin
    lblFromError.Caption := '''References ranging from'' requires a value.';
    Result := false;
  end;
  if (Trim(iweReferenceTo.Text) = '') then
  begin
    lblToError.Caption := '''References ranging to'' requires a value.';
    Result := false;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFReferenceQuery.ClearErrorMessages;
begin
  lblFromError.Caption := '';
  lblToError.Caption := '';
end;

end.
