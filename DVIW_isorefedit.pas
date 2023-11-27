unit DVIW_isorefedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWCompText, IWCompMemo;

type
  TISFIsoRefEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel2: TIWLabel;
    iwDBlcbRefType: TIWDBLookupComboBox;
    iwDBlcbRefID: TIWDBLookupComboBox;
    iwbEdit: TIWButton;
    iwDBmSourceDes: TIWDBMemo;
    TopBar: TISFTopBar;
    iwDBg: TIWDBGrid;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwDBlcbRefIDChange(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_detailsedit, DVIW_constants,
  DVIW_references;




procedure TISFIsoRefEdit.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoRef.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoRef.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoRef.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoRef.State in [dsBrowse]);
end;

procedure TISFIsoRefEdit.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsRefTypes.Open;
  dmDV.cdsIsoRef.Locate('SOURCESHORT',UserSession.ParameterChosen,[]);
  dmDV.qReferences.Close;
  dmDV.qReferences.SQL.Clear;
  dmDV.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmDV.qReferences.SQL.Add('  CONTINENT.CONTINENT');
  dmDV.qReferences.SQL.Add('FROM SOURCELIST,CONTINENT');
  dmDV.qReferences.SQL.Add('WHERE CONTINENT.CONTINENTID = SOURCELIST.CONTINENTID');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT >= :FirstReference');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT <= :LastReference');
  dmDV.qReferences.SQL.Add('AND ( SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedContinentID+'''');
  if (UserSession.IncludeContinentValues) then
  begin
    if (UserSession.ContinentValues.Count > 0) then
    begin
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        dmDV.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
  end;
  dmDV.qReferences.SQL.Add(' ) ');
  dmDV.qReferences.SQL.Add('ORDER BY SOURCELIST.SOURCESHORT');
  dmDV.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'A';
  dmDV.qReferences.ParamByName('LASTREFERENCE').AsString := 'zz';
  dmDV.cdsReferences.Close;
  dmDV.cdsReferences.Open;
  dmDV.cdsIsoRef.Locate('SOURCESHORT',UserSession.ParameterChosen,[]);
  iwDBlcbRefType.Editable := UserSession.CanModify;
  iwDBlcbRefID.Editable := UserSession.CanModify;
end;

procedure TISFIsoRefEdit.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsRefTypes.Close;
  dmDV.cdsReferences.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.UnitSender = usDetailsEdit)
  then TISFDetailsEdit.Create(WebApplication).Show;
  if (UserSession.UnitSender = usReferences)
  then TISFReferences.Create(WebApplication).Show;
end;

procedure TISFIsoRefEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoRef.Post;
    if ((dmDV.cdsIsoRef.RecordCount = 1) and (dmDV.cdsIsoRefSOURCETYPEID.AsString <> 'A')) then
    begin
      dmDV.cdsIsoRef.Append;
      dmDV.cdsIsoRefRECORDID.AsString := UserSession.RecordChosen;
      dmDV.cdsIsoRefSOURCETYPEID.AsString := 'A';
      dmDV.cdsIsoRefREFNUM.AsInteger := 0;
      {
      dmDV.cdsIsoRefSOURCESHORT.AsString := 'not defined';
      }
      dmDV.cdsIsoRef.Post;
    end;
  except
  end;
  try
    dmDV.cdsIsoRef.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoRefEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoRef.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoRefEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoRef.Delete;
    dmDV.cdsIsoRef.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoRefEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoRef.Edit;
end;

procedure TISFIsoRefEdit.iwDBlcbRefIDChange(Sender: TObject);
begin
  iwDBmSourceDes.Visible := false;
end;

end.
