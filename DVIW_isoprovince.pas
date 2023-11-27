unit DVIW_isoprovince;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoProvince = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcb: TIWDBLookupComboBox;
    iwDBgrid: TIWDBGrid;
    iwbEdit: TIWButton;
    iwbAddProvince: TIWButton;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbAddProvinceClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_detailsedit, DVIW_constants;




procedure TISFIsoProvince.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsProvince.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsProvince.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsProvince.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsProvince.State in [dsBrowse]);
end;

procedure TISFIsoProvince.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.qProvinces.Close;
  dmDV.qProvinces.SQL.Clear;
  dmDV.qProvinces.SQL.Add('SELECT DOMAINS.DOMAINNAME,DOMAINS.CONTINENTID,');
  dmDV.qProvinces.SQL.Add('  DOMAINS.DOMAINID,DOMAINS.DOMAINTYPEID');
  dmDV.qProvinces.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
  dmDV.qProvinces.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
  dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINTYPEID=DOMAINTYPE.DOMAINTYPEID');
  dmDV.qProvinces.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL <= 2');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qProvinces.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qProvinces.SQL.Add('OR DOMAINS.ContinentID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qProvinces.SQL.Add(' ) ');
  end;
  dmDV.qProvinces.SQL.Add('ORDER BY DOMAINS.DOMAINNAME');
  dmDV.cdsProvinces.Open;
  dmDV.cdsProvince.Locate('DOMAINID',UserSession.ParameterChosen,[]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoProvince.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsProvinces.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoProvince.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsProvince.Post;
  except
  end;
  try
    dmDV.cdsProvince.ApplyUpdates(0);
    UserSession.ParameterChosen := dmDV.cdsProvincesDOMAINNAME.AsString;
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoProvince.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsProvince.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoProvince.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsProvince.Delete;
    dmDV.cdsProvince.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoProvince.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsProvince.Edit;
end;

procedure TISFIsoProvince.iwbAddProvinceClick(Sender: TObject);
begin
  try
    dmDV.cdsProvince.Append;
    dmDV.cdsProvinceRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsProvincesDOMAINNAME.AsString := 'NEW';
    dmDV.cdsProvince.Post;
    UserSession.ParameterChosen := 'NEW';
  except
  end;
end;

end.
