unit DVIW_refdetails;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompMemo, IWDBStdCtrls, IWCompListbox, IWCompEdit,
  IWCompButton, IWVCLBaseControl, IWBaseHTMLControl;

type
  TISFRefDetails = class(TIWAppForm)
    iwDBeSourceID: TIWDBEdit;
    iwDBlcbContinent: TIWDBLookupComboBox;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iwbCancelChanges: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbReturn: TIWButton;
    iwbDeleteReference: TIWButton;
    rectLeft: TIWRectangle;
    iwbEdit: TIWButton;
    IWLabel4: TIWLabel;
    iwDBeSourceNum: TIWDBEdit;
    TopBar: TISFTopBar;
    IWLabel5: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWLabel7: TIWLabel;
    iwDBlcbWhoFor: TIWDBLookupComboBox;
    iwbCopyRefShort: TIWButton;
    IWMemoASCIIwarning: TIWMemo;
    iwDBmRefDetail: TIWDBMemo;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteReferenceClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbCopyRefShortClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, DVIW_references, DVIW_frGrid, DVIW_constants,
  DVIW_dmstrat, usrIW_dm;

procedure TISFRefDetails.IWAppFormRender(Sender: TObject);
begin
  if UserSession.CanModify then
  begin
    iwbApplyUpdates.Visible := UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsEdit,dsInsert]);
    iwbCancelChanges.Visible := UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsEdit,dsInsert]);
    iwbEdit.Visible := UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsBrowse]);
    iwbDeleteReference.Visible := UserSession.CanDelete and (dmStrat.cdsRefFull.State in [dsBrowse]);
    iwbCopyRefShort.Enabled := UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsEdit,dsInsert]);
  end;
end;

procedure TISFRefDetails.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwDBeSourceID.Editable := UserSession.CanModify;
  iwDBlcbContinent.Editable := UserSession.CanModify;
  iwDBmRefDetail.Editable := UserSession.CanModify;
  dmStrat.qUsersWhoFor.Close;
  dmStrat.qUsersWhoFor.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsUsersWhoFor.Close;
  dmStrat.cdsUsersWhoFor.Open;
  dmStrat.qRefFull.Close;
  dmStrat.qRefFull.ParamByName('SOURCENUM').AsString := UserSession.ParameterChosen;
  dmStrat.cdsRefFull.Close;
  dmStrat.cdsRefFull.Open;
  dmStrat.cdsContinents.Close;
  dmStrat.cdsContinents.Open;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'User is ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFRefDetails.iwbReturnClick(Sender: TObject);
begin
  if (UserSession.UnitSender = usReferences) then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFReferences.Create(WebApplication).Show;
  end;
  if (UserSession.UnitSender = usGrid) then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFGrid.Create(WebApplication).Show;
  end;
end;

procedure TISFRefDetails.iwbApplyUpdatesClick(Sender: TObject);
var
  i, Cnt : integer;
  LocalTmpStringList, RemoteTmpStringList : TStringList;
begin
  if(Sender = iwbApplyUpdates) then
  begin
    try
      dmStrat.cdsRefFull.Post;
      UserSession.ParameterChosen := dmStrat.cdsRefFullSOURCESHORT.AsString;
      dmStrat.cdsRefFull.ApplyUpdates(0);
      //dmUser.SetDeveloperData('RefDetails iwApplyUpdatesClick - call ReplicateChanges');
      //dmStrat.cdsRefFull.Close;
      //dmStrat.cdsRefFull.Open;
      //dmReplicate.ReplicateChanges('ttNoTrace');
    except
      WebApplication.ShowMessage('Not able to post this Reference.',smAlert);
    end;
  end;
end;

procedure TISFRefDetails.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmStrat.cdsRefFull.CancelUpdates;
  except
  end;
end;

procedure TISFRefDetails.iwbCopyRefShortClick(Sender: TObject);
begin
  dmStrat.cdsRefFullSOURCEDESCRIPTION.AsString :=  dmStrat.cdsRefFullSOURCESHORT.AsString + dmStrat.cdsRefFullSOURCEDESCRIPTION.AsString
end;

procedure TISFRefDetails.iwbDeleteReferenceClick(Sender: TObject);
begin
  try
    dmStrat.cdsRefFull.Delete;
    dmStrat.cdsRefFull.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this Reference.',smAlert);
  end;
end;

procedure TISFRefDetails.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsRefFull.Edit;
end;

end.
