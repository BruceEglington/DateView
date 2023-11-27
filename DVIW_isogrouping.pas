unit DVIW_isogrouping;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoGrouping = class(TIWAppForm)
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




procedure TISFIsoGrouping.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoGrouping.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoGrouping.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoGrouping.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoGrouping.State in [dsBrowse]);
end;

procedure TISFIsoGrouping.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.qGroupingList.Close;
  dmDV.qGroupingList.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.cdsGroupingList.Close;
  dmDV.cdsGroupingList.Open;
  dmDV.cdsIsoGrouping.Locate('Grouping',UserSession.ParameterChosen,[]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoGrouping.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsGroupingList.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoGrouping.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoGrouping.Post;
  except
  end;
  try
    dmDV.cdsIsoGrouping.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoGrouping.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoGrouping.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoGrouping.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoGrouping.Delete;
    dmDV.cdsIsoGrouping.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoGrouping.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoGrouping.Edit;
end;

end.
