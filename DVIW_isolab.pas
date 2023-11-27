unit DVIW_isolab;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoLab = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcbLab: TIWDBLookupComboBox;
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
    procedure iwDBlcbLabChange(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_detailsedit, DVIW_constants;




procedure TISFIsoLab.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoLab.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoLab.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoLab.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoLab.State in [dsBrowse]);
end;

procedure TISFIsoLab.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsLaboratories.Open;
  dmDV.cdsIsoLab.Locate('LABORATORYABR',UserSession.ParameterChosen,[]);
  iwDBlcbLab.Editable := UserSession.CanModify;
end;

procedure TISFIsoLab.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsLaboratories.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoLab.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLab.Post;
  except
  end;
  try
    dmDV.cdsIsoLab.ApplyUpdates(0);
    UserSession.ParameterChosen := dmDV.cdsIsoLabLABORATORYABR.AsString;
    dmDV.cdsIsoLab.Close;
    dmDV.cdsIsoLab.Open;
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoLab.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLab.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoLab.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLab.Delete;
    dmDV.cdsIsoLab.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoLab.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoLab.Edit;
end;

procedure TISFIsoLab.iwDBlcbLabChange(Sender: TObject);
begin
  iwDBgrid.Visible := false;
end;

end.
