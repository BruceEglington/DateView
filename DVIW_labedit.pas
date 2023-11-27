unit DVIW_labedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFLabEdit = class(TIWAppForm)
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
  ServerController, DVIW_dm, DB, DVIW_laboratories;




procedure TISFLabEdit.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsLaboratories.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsLaboratories.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsLaboratories.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsLaboratories.State in [dsBrowse]);
end;

procedure TISFLabEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDelete.Visible := UserSession.CanDelete;
  iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsLaboratories.Locate('LABORATORYABR',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
  iwDBEdit1.Editable := UserSession.CanModify;
  iwDBEdit2.Editable := UserSession.CanModify;
end;

procedure TISFLabEdit.iwbReturnClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLaboratories.Create(WebApplication).Show;
end;

procedure TISFLabEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsLaboratories.Post;
  except
  end;
  try
    dmDV.cdsLaboratories.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFLabEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsLaboratories.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFLabEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsLaboratories.Delete;
    dmDV.cdsLaboratories.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFLabEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsLaboratories.Edit;
end;

end.
