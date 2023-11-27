unit DVIW_isofor;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoFor = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcb: TIWDBLookupComboBox;
    iwDBgrid: TIWDBGrid;
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
  ServerController, DVIW_dm, DB, DVIW_detailsedit, DVIW_constants;




procedure TISFIsoFor.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoFor.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoFor.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoFor.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoFor.State in [dsBrowse]);
end;

procedure TISFIsoFor.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsWhoFor.Open;
  dmDV.qUsersWhoFor.Close;
  dmDV.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.cdsUsersWhoFor.Close;
  dmDV.cdsUsersWhoFor.Open;
  dmDV.cdsIsoFor.Locate('WHOFORID',UserSession.ParameterChosen,[]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoFor.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsUsersWhoFor.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoFor.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoFor.Post;
  except
  end;
  try
    dmDV.cdsIsoFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoFor.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoFor.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoFor.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoFor.Delete;
    dmDV.cdsIsoFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoFor.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoFor.Edit;
end;

end.
