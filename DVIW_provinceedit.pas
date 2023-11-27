unit DVIW_provinceedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFProvinceEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSave: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel3: TIWLabel;
    iwDBlcbContinent: TIWDBLookupComboBox;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dmStrat, DB, DVIW_provinces;




procedure TISFProvinceEdit.IWAppFormRender(Sender: TObject);
begin
  //iwbEdit.Enabled := UserSession.CanModify and (dmStrat.cdsProvinces.State in [dsBrowse]);
  iwbSave.Enabled := UserSession.CanModify and (dmStrat.cdsProvinces.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Enabled := UserSession.CanModify and (dmStrat.cdsProvinces.State in [dsEdit,dsInsert]);
  iwbDelete.Enabled := UserSession.CanDelete and (dmStrat.cdsProvinces.State in [dsBrowse]);
end;

procedure TISFProvinceEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDelete.Visible := UserSession.CanDelete;
  iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  try
    dmStrat.cdsProvinces.Locate('DOMAINID',UserSession.ParameterChosen,[]);
  except
  end;
  dmStrat.cdsContinents.Open;
  iwDBEdit1.Editable := UserSession.CanModify;
  iwDBlcbContinent.Editable := UserSession.CanModify;
end;

procedure TISFProvinceEdit.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsContinents.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFProvinces.Create(WebApplication).Show;
end;

procedure TISFProvinceEdit.iwbSaveClick(Sender: TObject);
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
  try
    dmStrat.cdsProvinces.Post;
  except
  end;
  try
    dmStrat.cdsProvinces.ApplyUpdates(0);
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

procedure TISFProvinceEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmStrat.cdsProvinces.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFProvinceEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmStrat.cdsProvinces.Delete;
    dmStrat.cdsProvinces.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

end.
