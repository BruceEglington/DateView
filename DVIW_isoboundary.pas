unit DVIW_isoboundary;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoBoundary = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcbPosRel: TIWDBLookupComboBox;
    iwDBgrid: TIWDBGrid;
    iwDBlcbBoundary: TIWDBLookupComboBox;
    IWLabel2: TIWLabel;
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
  ServerController, IWrenderContext,
  DVIW_dm, DB, DVIW_detailsedit, DVIW_constants;




procedure TISFIsoBoundary.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoBoundary.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoBoundary.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoBoundary.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoBoundary.State in [dsBrowse]);
end;

procedure TISFIsoBoundary.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsBoundaries.Open;
  dmDV.cdsBoundaryPositions.Open;
  dmDV.cdsIsoBoundary.Locate('BOUNDARYID',UserSession.ParameterChosen,[]);
  iwDBlcbPosRel.Editable := UserSession.CanModify;
  iwDBlcbBoundary.Editable := UserSession.CanModify;
end;

procedure TISFIsoBoundary.iwbReturnClick(Sender: TObject);
begin
  try
    dmDV.cdsBoundaries.Close;
    dmDV.cdsBoundaryPositions.Close;
  except
  end;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoBoundary.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoBoundary.Post;
  except
  end;
  try
    dmDV.cdsIsoBoundary.ApplyUpdates(0);
    {
    if (dmDV.cdsIsoBoundary.State = dsBrowse) then
    begin
      // requires IWrenderContext in the USES clause
      iwDBgrid.RefreshData(TIWComponent40Context(PageContext),nil);  // this can only be done while NOT in edit mode
    end;
    }
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoBoundary.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoBoundary.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoBoundary.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoBoundary.Delete;
    dmDV.cdsIsoBoundary.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoBoundary.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoBoundary.Edit;
end;

end.
