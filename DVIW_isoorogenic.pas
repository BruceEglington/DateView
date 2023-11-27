unit DVIW_isoorogenic;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoOrogenic = class(TIWAppForm)
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




procedure TISFIsoOrogenic.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoOrogenic.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoOrogenic.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoOrogenic.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoOrogenic.State in [dsBrowse]);
end;

procedure TISFIsoOrogenic.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsOrogenicPeriods.Open;
  dmDV.cdsIsoOrogenic.Locate('OROGENICPERIODID',UserSession.ParameterChosen,[]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoOrogenic.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsOrogenicPeriods.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoOrogenic.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoOrogenic.Post;
  except
  end;
  try
    dmDV.cdsIsoOrogenic.ApplyUpdates(0);
    UserSession.ParameterChosen := dmDV.cdsIsoOrogenicOROGENICPERIODID.AsString;
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoOrogenic.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoOrogenic.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoOrogenic.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoOrogenic.Delete;
    dmDV.cdsIsoOrogenic.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoOrogenic.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoOrogenic.Edit;
end;

end.
