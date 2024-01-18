unit DVIW_selectplatepoles;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFSelectPlatePoles = class(TIWAppForm)
    iwDBlcbPlate: TIWDBLookupComboBox;
    iwbReturn: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iwDBlcbInclude: TIWDBLookupComboBox;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBgAreas: TIWDBGrid;
    IWDBNavigator1: TIWDBNavigator;
    IWLabel1: TIWLabel;
    iwDBlcbPole: TIWDBLookupComboBox;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_dmdata, DVIW_uMain;




procedure TISFSelectPlatePoles.IWAppFormRender(Sender: TObject);
begin
  iwbSaveChanges.Visible := UserSession.CanModify and (dmdDV.cdsUserPlatesNew.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmdDV.cdsUserPlatesNew.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmdDV.cdsUserPlatesNew.State in [dsBrowse]);
end;

procedure TISFSelectPlatePoles.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmdDV.qUserPlatesNew.Close;
  dmdDV.qUserPlatesNew.ParamByName('USERID').AsString := UserSession.UserID;
  dmdDV.cdsUserPlatesNew.Close;
  dmdDV.cdsUserPlatesNew.Open;
  try
    for i := 1 to UserSession.PlateValues.Count do
    begin
      try
        dmdDV.cdsUserPlatesNew.Append;
        dmdDV.cdsUserPlatesNewUSERID.AsString := UserSession.UserID;
        dmdDV.cdsUserPlatesNewPLATEID.AsString := UserSession.PlateValues.Strings[i-1];
        dmdDV.cdsUserPlatesNewINCLUDEDYN.AsString := 'Y';
        dmdDV.cdsUserPlatesNewPOLEID.AsString := 'nd';
        dmdDV.cdsUserPlatesNew.Post;
      except
      end;
    end;
    dmdDV.cdsUserPlatesNew.ApplyUpdates(100);
  except
  end;
  dmdDV.cdsUserPlatesNew.Close;
  dmdDV.qUserPlates.Close;
  dmdDV.qUserPlates.ParamByName('USERID').AsString := UserSession.UserID;
  dmdDV.cdsUserPlates.Close;
  dmdDV.cdsUserPlates.Open;
  dmDV.cdsPoles.Open;
  dmDV.cdsPlates.Open;
  dmDV.cdsYesNo.Open;
end;

procedure TISFSelectPlatePoles.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsPlates.Close;
  dmDV.cdsPoles.Close;
  dmDV.cdsYesNo.Close;
  dmdDV.cdsUserPlates.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFSelectPlatePoles.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmdDV.cdsUserPlates.Post;
  except
  end;
  try
    dmdDV.cdsUserPlates.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFSelectPlatePoles.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmdDV.cdsUserPlates.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFSelectPlatePoles.iwbDeleteClick(Sender: TObject);
begin
  try
    dmdDV.cdsUserPlates.Delete;
    dmdDV.cdsUserPlates.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

end.
