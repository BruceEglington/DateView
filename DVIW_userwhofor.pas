unit DVIW_userwhofor;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWHTMLControls;

type
  TISFUserWhoFor = class(TIWAppForm)
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
    iwbNew: TIWButton;
    iwbPublish: TIWButton;
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
    procedure iwbPublishClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dmOpt, DB, DVIW_uMain;




procedure TISFUserWhoFor.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsBrowse]);
  iwbNew.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsBrowse]);
  iwbPublish.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsBrowse]);
end;

procedure TISFUserWhoFor.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbDelete.Visible := UserSession.CanDelete;
  //iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmOpt.qUserFor.Close;
  dmOpt.qUserFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsUserFor.Close;
  dmOpt.cdsUserFor.Open;
end;

procedure TISFUserWhoFor.iwbReturnClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFUserWhoFor.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserFor.Post;
  except
  end;
  try
    dmOpt.cdsUserFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFUserWhoFor.iwbNewClick(Sender: TObject);
begin
  {
  need to check for existing record with ID 'NEW' and delete
  it before proceeding
  }
  dmOpt.qChangeUserFor.Close;
  dmOpt.qChangeUserFor.SQL.Clear;
  dmOpt.qChangeUserFor.SQL.Add('DELETE FROM FORLIST');
  dmOpt.qChangeUserFor.SQL.Add('WHERE FORLIST.WHOFORID = '+''''+'NEW'+'''');
  dmOpt.qChangeUserFor.ExecSQL;
  try
    dmOpt.cdsUserFor.Append;
    dmOpt.cdsUserForWHOFORID.AsString := 'NEW';
    dmOpt.cdsUserForWHOFOR.AsString := 'NEW'+UserSession.UserID;
    dmOpt.cdsUserForOWNER.AsString := UserSession.UserID;
    dmOpt.cdsUserFor.Post;
  except
    WebApplication.ShowMessage('Not able to add new record');
  end;
end;

procedure TISFUserWhoFor.iwbPublishClick(Sender: TObject);
var
  tmpWhoForID : string;
  WasSuccessful : boolean;
begin
  tmpWhoForID := dmOpt.cdsUserForWHOFORID.AsString;
  dmOpt.PublishRecords(tmpWhoForID,WasSuccessful);
  if not WasSuccessful then WebApplication.ShowMessage('Not able to publish all associated records for '+tmpWhoForID);
end;

procedure TISFUserWhoFor.iwDBgColumns0TitleClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFUserWhoFor.iwlNextPageClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.MoveBy(1*iwDBg.RowLimit);
end;

procedure TISFUserWhoFor.iwlPrevPageClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFUserWhoFor.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserFor.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFUserWhoFor.iwbDeleteClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserFor.Delete;
    dmOpt.cdsUserFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFUserWhoFor.iwbEditClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.Edit;
end;

end.
