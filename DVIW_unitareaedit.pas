unit DVIW_unitareaedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFUnitAreaEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel2: TIWLabel;
    iwDBlcbUnit: TIWDBLookupComboBox;
    iwDBlcbArea: TIWDBLookupComboBox;
    iwbEdit: TIWButton;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_unitareas;




procedure TISFUnitAreaEdit.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsUnitCountry.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsUnitCountry.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsUnitCountry.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmDV.cdsUnitCountry.State in [dsBrowse]);
end;

procedure TISFUnitAreaEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsUnits.Locate('UNITNAME',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
end;

procedure TISFUnitAreaEdit.iwbReturnClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFUnitAreas.Create(WebApplication).Show;
end;

procedure TISFUnitAreaEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsUnitCountry.Post;
  except
  end;
  try
    dmDV.cdsUnitCountry.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFUnitAreaEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsUnitCountry.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFUnitAreaEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsUnitCountry.Delete;
    dmDV.cdsUnitCountry.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFUnitAreaEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsUnitCountry.Edit;
end;

end.
