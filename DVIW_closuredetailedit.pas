unit DVIW_closuredetailedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFClosureDetailEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwDBlcbIsoSystem: TIWDBLookupComboBox;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    iwDBeBlockingT: TIWDBEdit;
    iwDBeBlockingTUncertainty: TIWDBEdit;
    iwDBlcbApproach: TIWDBLookupComboBox;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcbMaterial: TIWDBLookupComboBox;
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
  ServerController, DVIW_dm, DB, 
  DVIW_constants, DVIW_closuretemperatures;




procedure TISFClosureDetailEdit.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsClosureTemperatures.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsClosureTemperatures.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsClosureTemperatures.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsClosureTemperatures.State in [dsBrowse]);
end;

procedure TISFClosureDetailEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwDBlcbMaterial.Editable := UserSession.CanModify;
  iwDBlcbIsoSystem.Editable := UserSession.CanModify;
  iwDBlcbApproach.Editable := UserSession.CanModify;
  iwDBeBlockingT.Editable := UserSession.CanModify;
  iwDBeBlockingTUncertainty.Editable := UserSession.CanModify;
  iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  dmDV.cdsMaterial.Open;
  dmDV.cdsIsoSystems.Open;
  dmDV.cdsApproach.Open;
end;

procedure TISFClosureDetailEdit.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsMaterial.Close;
  dmDV.cdsIsoSystems.Close;
  dmDV.cdsApproach.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFClosureTemperatures.Create(WebApplication).Show;
end;

procedure TISFClosureDetailEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsClosureTemperatures.Post;
  except
  end;
  try
    dmDV.cdsClosureTemperatures.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFClosureDetailEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsClosureTemperatures.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFClosureDetailEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsClosureTemperatures.Delete;
    dmDV.cdsClosureTemperatures.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFClosureDetailEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsClosureTemperatures.Edit;
end;

end.
