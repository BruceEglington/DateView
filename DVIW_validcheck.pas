unit DVIW_validcheck;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl;

type
  TISFValidCheck = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWDBEdit5: TIWDBEdit;
    IWDBMemo1: TIWDBMemo;
    iwbSaveReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    iwbCancelReturn: TIWButton;
    rectLeft: TIWRectangle;
    iwbClearObjection: TIWButton;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbClearObjectionClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DVIW_detailsedit, DVIW_details, usrIW_dm;




procedure TISFValidCheck.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsIsoValid2.Edit;
end;

procedure TISFValidCheck.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbClearObjection.Visible := UserSession.CanValidate;
end;

procedure TISFValidCheck.iwbClearObjectionClick(Sender: TObject);
var
  HasValidityRecord : boolean;
  tmpStr : string;
begin
  HasValidityRecord := false;
  dmDV.cdsIsoValid2.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
  dmDV.cdsIsoValid2.Filtered := true;
  tmpStr := '';
  if (dmDV.cdsIsoValid2.RecordCount = 1) then
  begin
    HasValidityRecord := true;
    tmpStr := dmDV.cdsIsoValid2COMMENTS.AsString;
    dmDV.cdsIsoValid2.Delete;
  end;
  dmDV.cdsIsoValid2.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dmDV.cdsIsoValid2.Filtered := true;
  if (dmDV.cdsIsoValid2.RecordCount = 1) then
  begin
    HasValidityRecord := true;
    dmDV.cdsIsoValid2.Edit;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Chckd';
    {
    dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
    }
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2COMMENTS.AsString := dmDV.cdsIsoValid2COMMENTS.AsString + chr(10) + chr(13) + tmpStr;
    dmDV.cdsIsoValid2.Post;
  end;
  if (not HasValidityRecord) then
  begin
    dmDV.cdsIsoValid2.Append;
    dmDV.cdsIsoValid2RECORDID.AsInteger := dmDV.cdsRecordIDsRECORDID.AsInteger;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Chckd';
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2COMMENTS.AsString := '';
    dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
    dmDV.cdsIsoValid2.Post;
  end;
  try
    dmDV.cdsIsoValid2.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update validation status');
  end;
  dmDV.cdsIsoValid2.Filtered := false;
  dmDV.cdsIsoValid2.Close;
  dmDV.cdsRecordIDs.Close;
  dmDV.cdsRecordIDs.Open;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.UnitSender = 'Details') then
    TISFDetails.Create(WebApplication).Show;
  if (UserSession.UnitSender = 'DetailsEdit') then
    TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFValidCheck.iwbReturnClick(Sender: TObject);
begin
  if(Sender = iwbSaveReturn) then
  begin
    dmDV.cdsIsoValid2.Post;
    dmDV.cdsIsoValid2.ApplyUpdates(0);
  end;
  if(Sender = iwbCancelReturn) then
  begin
    dmDV.cdsIsoValid2.Cancel;
    dmDV.cdsIsoValid2.CancelUpdates;
  end;
  dmDV.cdsIsoValid2.Filtered := false;
  dmDV.cdsIsoValid2.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.UnitSender = 'Details') then
    TISFDetails.Create(WebApplication).Show;
  if (UserSession.UnitSender = 'DetailsEdit') then
    TISFDetailsEdit.Create(WebApplication).Show;
end;

end.
