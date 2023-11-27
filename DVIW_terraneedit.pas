unit DVIW_terraneedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFTerraneEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel3: TIWLabel;
    iwDBlcbContinent: TIWDBLookupComboBox;
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
  ServerController, DVIW_dmStrat, DB, DVIW_terranes;




procedure TISFTerraneEdit.IWAppFormRender(Sender: TObject);
begin
  iwbSaveChanges.Visible := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsBrowse]);
end;

procedure TISFTerraneEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDelete.Visible := UserSession.CanDelete;
  iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.cdsTerranes.Locate('DOMAINID',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
  dmStrat.cdsContinents.Open;
end;

procedure TISFTerraneEdit.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsContinents.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFTerranes.Create(WebApplication).Show;
end;

procedure TISFTerraneEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmStrat.cdsTerranes.Post;
  except
  end;
  try
    dmStrat.cdsTerranes.ApplyUpdates(0);
    {
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
    LocalTmpStringList := TStringList.Create;
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
    }
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFTerraneEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmStrat.cdsTerranes.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFTerraneEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmStrat.cdsTerranes.Delete;
    dmStrat.cdsTerranes.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFTerraneEdit.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsTerranes.Edit;
end;

end.
