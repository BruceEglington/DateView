unit DVIW_usergroups;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWHTMLControls;

type
  TISFUserGroups = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel4: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwbEdit: TIWButton;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    IWLabel2: TIWLabel;
    iwbNew: TIWButton;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwDBgColumns0TitleClick(Sender: TObject);
    procedure iwbNewClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dmOpt, DB, DVIW_uMain;




procedure TISFUserGroups.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmOpt.cdsUserGroups.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmOpt.cdsUserGroups.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmOpt.cdsUserGroups.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmOpt.cdsUserGroups.State in [dsBrowse]);
end;

procedure TISFUserGroups.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbDelete.Visible := UserSession.CanDelete;
  //iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmOpt.qUserGroups.Close;
  dmOpt.qUserGroups.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsUserGroups.Close;
  dmOpt.cdsUserGroups.Open;
end;

procedure TISFUserGroups.iwbReturnClick(Sender: TObject);
begin
  dmOpt.cdsUserGroups.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFUserGroups.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserGroups.Post;
  except
  end;
  try
    dmOpt.cdsUserGroups.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFUserGroups.iwbNewClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserGroups.Append;
    dmOpt.cdsUserGroupsGROUPING.AsString := 'NEW'+UserSession.UserID;
    dmOpt.cdsUserGroupsUSERID.AsString := UserSession.UserID;
    dmOpt.cdsUserGroupsEXPIRYDATE.AsDateTime := Date+365;
    dmOpt.cdsUserGroups.Post;
  except
    WebApplication.ShowMessage('Not able to add new record');
  end;
end;

procedure TISFUserGroups.iwDBgColumns0TitleClick(Sender: TObject);
begin
  dmOpt.cdsUserGroups.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFUserGroups.iwlNextPageClick(Sender: TObject);
begin
  dmOpt.cdsUserGroups.MoveBy(1*iwDBg.RowLimit);
end;

procedure TISFUserGroups.iwlPrevPageClick(Sender: TObject);
begin
  dmOpt.cdsUserGroups.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFUserGroups.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserGroups.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFUserGroups.iwbDeleteClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserGroups.Delete;
    dmOpt.cdsUserGroups.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFUserGroups.iwbEditClick(Sender: TObject);
begin
  dmOpt.cdsUserGroups.Edit;
end;

end.
