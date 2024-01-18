unit DVIW_poleedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWCompMemo;

type
  TISFPoleEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel4: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel2: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWLabel3: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel5: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBMemo1: TIWDBMemo;
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
  ServerController, DVIW_dm, DB, DVIW_plates, DVIW_poles;




procedure TISFPoleEdit.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsPoles.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsPoles.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsPoles.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsPoles.State in [dsBrowse]);
end;

procedure TISFPoleEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDelete.Visible := UserSession.CanDelete;
  iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsPoles.Locate('POLEID',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
  iwDBEdit1.Editable := UserSession.CanModify;
  iwDBEdit2.Editable := UserSession.CanModify;
  iwDBEdit3.Editable := UserSession.CanModify;
  iwDBEdit4.Editable := UserSession.CanModify;
  iwDBEdit5.Editable := UserSession.CanModify;
  iwDBMemo1.Editable := UserSession.CanModify;
end;

procedure TISFPoleEdit.iwbReturnClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFPoles.Create(WebApplication).Show;
end;

procedure TISFPoleEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsPoles.Post;
  except
  end;
  try
    dmDV.cdsPoles.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFPoleEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsPoles.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFPoleEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsPoles.Delete;
    dmDV.cdsPoles.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFPoleEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsPoles.Edit;
end;

end.
