unit DVIW_isolipedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoLIPEdit = class(TIWAppForm)
    iwbReturn: TIWButton;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbEdit: TIWButton;
    IWLabel1: TIWLabel;
    iwDBlcb: TIWDBLookupComboBox;
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
  ServerController, DVIW_dm, DB, DVIW_detailsedit;




procedure TISFIsoLIPEdit.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoLIP.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoLIP.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoLIP.State in [dsEdit,dsInsert]);
  //iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoLIP.State in [dsBrowse]);
end;

procedure TISFIsoLIPEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsLIPs.Open;
  //dmDV.cdsLIPs.Locate('LIPID',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoLIPEdit.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsLIPs.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoLIPEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLIP.Post;
  except
  end;
  try
    dmDV.cdsIsoLIP.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
    dmDV.cdsIsoLIP.Close;
    dmDV.cdsIsoLIP.Open;
end;

procedure TISFIsoLIPEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLIP.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoLIPEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLIP.Delete;
    dmDV.cdsIsoLIP.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFIsoLIPEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoLIP.Edit;
end;

end.
