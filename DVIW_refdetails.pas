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
    iwDBmRefDetail: TIWDBMemo;
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
    IWDBEdit1: TIWDBEdit;
    TopBar: TISFTopBar;
    IWLabel5: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWLabel7: TIWLabel;
    iwDBlcbWhoFor: TIWDBLookupComboBox;
    iwbCopyRefShort: TIWButton;
    IWMemoASCIIwarning: TIWMemo;
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
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
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
  LocalNodeServer,LocalNodePath,
  LocalNodeName,LocalNodeCharSet,
  LocalNodeDBName,LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,
  LocalNodeUserLogin,LocalNodeUserPassword : string;
  RemoteNodeServer,RemoteNodePath,
  RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
  RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
  RemoteNodeUserPassword : string;
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
  {
  try
    dmStrat.cdsRefFull.Post;
    UserSession.ParameterChosen := dmStrat.cdsRefFullSOURCESHORT.AsString;
  except
    WebApplication.ShowMessage('Not able to post this Reference.',smAlert);
  end;
  try
    dmStrat.cdsRefFull.ApplyUpdates(0);
    dmReplicate.cdsRemoteNodes.Open;
    RemoteNodeName := dmReplicate.cdsRemoteNodesNODENAME.AsString;
    //RemoteNodeCharSet := dmReplicate.cdsRemoteNodesNODECHARSET.AsString;
    //RemoteNodeSQLDialect := dmReplicate.cdsRemoteNodesNODESQLDIALECT.AsString;
    RemoteNodeServer := dmReplicate.cdsRemoteNodesNODESERVER.AsString;
    RemoteNodePath := dmReplicate.cdsRemoteNodesNODEPATH.AsString;
    RemoteNodeDBName := RemoteNodeServer+':'+RemoteNodePath;
    //RemoteNodeDBName := dmReplicate.cdsRemoteNodesNODEDBNAME.AsString;
    RemoteNodeDBType := dmReplicate.cdsRemoteNodesNODEDBTYPE.AsString;
    RemoteNodeDBVersion := dmReplicate.cdsRemoteNodesNODEDBVERSION.AsString;
    RemoteNodeUserLogin := dmReplicate.cdsRemoteNodesNODEUSERLOGIN.AsString;
    RemoteNodeUserPassword := dmReplicate.cdsRemoteNodesNODEUSERPASSWORD.AsString;
    RemoteTmpStringList := TStringList.Create;
    RemoteTmpStringList.Clear;
    RemoteTmpStringList.Text := dmReplicate.cdsRemoteNodesNODEDBSPECIFIC.AsString;
    RemoteNodeCharSet := RemoteTmpStringList.Values['CHARSET'];
    RemoteNodeSQLDialect := RemoteTmpStringList.Values['SQLDIALECT'];
    RemoteTmpStringList.Free;
    dmReplicate.cdsRemoteNodes.Close;
    //dmUser.SetDeveloperData(RemoteNodeName);
    //dmUser.SetDeveloperData(RemoteNodeCharSet);
    //dmUser.SetDeveloperData(RemoteNodeDBName);
    //dmUser.SetDeveloperData(RemoteNodeDBType);
    //dmUser.SetDeveloperData(RemoteNodeDBVersion);
    //dmUser.SetDeveloperData(RemoteNodeSQLDialect);
    //dmUser.SetDeveloperData(RemoteNodeUserLogin);
    //dmUser.SetDeveloperData(RemoteNodeUserPassword);
    dmReplicate.cdsLocalNodes.Open;
    Cnt := dmReplicate.cdsLocalNodes.RecordCount;
    for i := 1 to Cnt do
    begin
      LocalNodeName := dmReplicate.cdsLocalNodesNODENAME.AsString;
      //LocalNodeCharSet := dmReplicate.cdsLocalNodesNODECHARSET.AsString;
      //LocalNodeSQLDialect := dmReplicate.cdsLocalNodesNODESQLDIALECT.AsString;
      LocalNodeServer := dmReplicate.cdsLocalNodesNODESERVER.AsString;
      LocalNodePath := dmReplicate.cdsLocalNodesNODEPATH.AsString;
      LocalNodeDBName := LocalNodeServer+':'+LocalNodePath;
      //LocalNodeDBName := dmReplicate.cdsLocalNodesNODEDBNAME.AsString;
      LocalNodeDBType := dmReplicate.cdsLocalNodesNODEDBTYPE.AsString;
      LocalNodeDBVersion := dmReplicate.cdsLocalNodesNODEDBVERSION.AsString;
      LocalNodeUserLogin := dmReplicate.cdsLocalNodesNODEUSERLOGIN.AsString;
      LocalNodeUserPassword := dmReplicate.cdsLocalNodesNODEUSERPASSWORD.AsString;
      LocalTmpStringList.Clear;
      LocalTmpStringList.Text := dmReplicate.cdsLocalNodesNODEDBSPECIFIC.AsString;
      LocalNodeCharSet := LocalTmpStringList.Values['CHARSET'];
      LocalNodeSQLDialect := LocalTmpStringList.Values['SQLDIALECT'];
      //dmUser.SetDeveloperData(LocalNodeName);
      //dmUser.SetDeveloperData(LocalNodeCharSet);
      //dmUser.SetDeveloperData(LocalNodeDBName);
      //dmUser.SetDeveloperData(LocalNodeDBType);
      //dmUser.SetDeveloperData(LocalNodeDBVersion);
      //dmUser.SetDeveloperData(LocalNodeSQLDialect);
      //dmUser.SetDeveloperData(LocalNodeUserLogin);
      //dmUser.SetDeveloperData(LocalNodeUserPassword);
      dmReplicate.ReplicateFromStratDB(LocalNodeServer,LocalNodePath,
        LocalNodeName,LocalNodeCharSet,
        LocalNodeDBName,LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,
        LocalNodeUserLogin,LocalNodeUserPassword,
        RemoteNodeServer,RemoteNodePath,
        RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
        RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
        RemoteNodeUserPassword,'ttNoTrace');
      dmReplicate.cdsLocalNodes.Next;
    end;
    LocalTmpStringList.Free;
    dmReplicate.cdsLocalNodes.Close;
  except
    WebApplication.ShowMessage('Not able to applyupdates for this Reference.',smAlert);
  end;
  }
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
