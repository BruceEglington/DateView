unit DVIW_isoimage;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel,
  IWDBExtCtrls, IWCompMemo, IWCompExtCtrls;

type
  TISFIsoImage = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcb: TIWDBLookupComboBox;
    iwDBgrid: TIWDBGrid;
    IWDBEdit1: TIWDBEdit;
    IWLabel2: TIWLabel;
    IWDBMemo1: TIWDBMemo;
    IWLabel3: TIWLabel;
    IWDBImage1: TIWDBImage;
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




procedure TISFIsoImage.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsImageDetails.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsImageDetails.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsImageDetails.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsImageDetails.State in [dsBrowse]);
end;

procedure TISFIsoImage.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsImageTypes.Open;
  dmDV.qImageDetails.Close;
  dmDV.qImageDetails.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
  dmDV.cdsImageDetails.Open;
  dmDV.cdsImageDetails.Locate('IMAGEID',UserSession.ParameterChosen,[]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoImage.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsImageTypes.Close;
  dmDV.cdsImageDetails.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoImage.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsImageDetails.Post;
  except
  end;
  try
    dmDV.cdsImageDetails.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoImage.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsImageDetails.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoImage.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsImageDetails.Delete;
    dmDV.cdsImageDetails.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoImage.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsImageDetails.Edit;
end;

end.
