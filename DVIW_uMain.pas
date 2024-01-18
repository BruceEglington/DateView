{
  ISFMain main user window

  This is the first page the user sees when accessing this application.
}

unit DVIW_uMain;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompButton, Forms,
  IWCompRectangle, IWCompLabel, IWDBStdCtrls,
  IWCompText, IWCompExtCtrls,
  IWCompMemo, DVIW_frTopBar, IWCompCheckbox, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWHTML40Container, DVIW_framemenu, Menus;

type
  TISFMain = class(TIWAppForm)
    lblWelcome: TIWLabel;
    iwlDeveloperName: TIWLabel;
    IWLabel3: TIWLabel;
    iwDBmProgress: TIWDBMemo;
    iwlNumUses: TIWLabel;
    IWRegion1: TIWRegion;
    iwRHeader: TIWRegion;
    iwRFooter: TIWRegion;
    iwRMemo: TIWRegion;
    iwlNumRecords: TIWLabel;
    iwDBNumRecords: TIWDBLabel;
    iwlNumPublRecords: TIWLabel;
    iwDBNumPublRecords: TIWDBLabel;
    iwDBLastCounted: TIWDBLabel;
    iwlLastCounted: TIWLabel;
    iwbPermissions: TIWButton;
    TopBar: TISFTopBar;
    FrameMenu: TISFFrameMenu;
    iwbCheckGetIniFile: TIWButton;
    iwlProgressDate: TIWLabel;
    iwb_TestDestroy: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure LeftTreeiwlReferencesClick(Sender: TObject);
    procedure LeftTreeiwlSamplesClick(Sender: TObject);
    procedure TopBariwlSignOutClick(Sender: TObject);
    procedure LeftTreeiwlDefineQueryClick(Sender: TObject);
    procedure TopBarlnkSignInClick(Sender: TObject);
    procedure iwbPermissionsClick(Sender: TObject);
    procedure LeftTreeiwlOptionsClick(Sender: TObject);
    procedure FrameMenuDefine1Click(Sender: TObject);
    procedure FrameMenuSelectReferences1Click(Sender: TObject);
    procedure FrameMenuSelectSamples1Click(Sender: TObject);
    procedure FrameMenuRawDataIdentifyAgePeaks1Click(Sender: TObject);
    procedure FrameMenuRawDataMultipleDetrital1Click(Sender: TObject);
    procedure iwbCheckGetIniFileClick(Sender: TObject);
    procedure FrameMenuRawDataIndivAgeChemClick(Sender: TObject);
    procedure FrameMenuRawDataIndivAgeHfClick(Sender: TObject);
    procedure FrameMenuRawDataMultiAgeChemClick(Sender: TObject);
    procedure iwb_TestDestroyClick(Sender: TObject);
    procedure FrameMenuDefineGDUCurve1Click(Sender: TObject);
  public
  protected
    procedure LoadWelcomeMessage;
  end;

type
  TISFMainClass = class of TISFMain;

implementation
{$R *.dfm}

uses
  ServerController, IWHTMLControls, IWColor, Graphics,
  System.IOUtils,
  IniFiles,
  IWBaseForm, jpeg, DVIW_constants, DVIW_dm, usrIW_dm;

procedure TISFMain.FrameMenuDefine1Click(Sender: TObject);
begin
  FrameMenu.SelectInterpretedRecords1Click(Sender);
end;

procedure TISFMain.FrameMenuDefineGDUCurve1Click(Sender: TObject);
begin
  FrameMenu.DefineGDUCurve1Click(Sender);
end;

procedure TISFMain.FrameMenuRawDataIdentifyAgePeaks1Click(Sender: TObject);
begin
  FrameMenu.RawDataIdentifyAgePeaks1Click(Sender);
end;

procedure TISFMain.FrameMenuRawDataIndivAgeChemClick(Sender: TObject);
begin
  FrameMenu.RawDataIndivAgeChemClick(Sender);
end;

procedure TISFMain.FrameMenuRawDataIndivAgeHfClick(Sender: TObject);
begin
  FrameMenu.RawDataIndivAgeHfClick(Sender);

end;

procedure TISFMain.FrameMenuRawDataMultiAgeChemClick(Sender: TObject);
begin
  FrameMenu.RawDataMultiAgeChemClick(Sender);
end;

procedure TISFMain.FrameMenuRawDataMultipleDetrital1Click(Sender: TObject);
begin
  FrameMenu.RawDataMultipleDetrital1Click(Sender);
end;

procedure TISFMain.FrameMenuSelectReferences1Click(Sender: TObject);
begin
  FrameMenu.SelectReferences1Click(Sender);
end;

procedure TISFMain.FrameMenuSelectSamples1Click(Sender: TObject);
begin
  FrameMenu.SelectSamples1Click(Sender);
end;

procedure TISFMain.IWAppFormCreate(Sender: TObject);
var
  progstr : string;
  ShowUsagePermissions : boolean;
begin
  UserSession.IsFirstShow := true;
  progstr := WebApplication.RunParams.Values[ 'progname' ];
  UserSession.ThisProgram := 'DateViewWeb';
  if (not UserSession.LoggedIn) then
  begin
    FrameMenu.Visible := false;
  end else
  begin
    FrameMenu.Visible := true;
  end;
  FrameMenu.DefineSQL1.Visible := UserSession.IsDeveloper;
  FrameMenu.RawDataIndivAgeChem.Visible := true;
  FrameMenu.RawDataMultiAgeChem.Visible := true;
  //LeftTree.iwlRecordIDsAll.Visible := UserSession.IsDeveloper;
  //MainMenu1.DefineSQL1.Visible := UserSession.IsDeveloper;
  iwlNumUses.Visible := false;
  ShowUsagePermissions := false; // normally false
  iwbPermissions.Visible := ShowUsagePermissions;
  //if (UserSession.LoggedIn) then LoadWelcomeMessage;       //bme
  if ((UserSession.ShowDebugButtons) and (UserSession.LoggedIn)) then
  begin
    iwbPermissions.Visible := true;
    iwbCheckGetIniFile.Visible := true;
  end else
  begin
    iwbPermissions.Visible := false;
    iwbCheckGetIniFile.Visible := false;
  end;
  iwlNumUses.Caption := '';
end;

procedure TISFMain.LoadWelcomeMessage;
begin
  if  (UserSession.IsFirstShow) then
  begin
    dmUser.qProgress.Close;
    dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
    dmUser.cdsProgress.Close;
    dmUser.cdsProgress.Open;
    UserSession.ProgressDate := dmUser.cdsProgressPROGRESSDATE.AsString;
    dmUser.cdsProgress.Close;
    dmUser.qThisProgram.Close;
    dmUser.qThisProgram.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsThisProgram.Close;
    dmUser.cdsThisProgram.Open;
    UserSession.ThisProgramName := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    dmUser.cdsThisProgram.Close;
  end;
  //if UserSession.LoggedIn then
  //begin
    TopBar.lblWelcome.Text := 'User is ' + UserSession.UserDisplayName;
    TopBar.lblProgTitle.Text := UserSession.ThisProgramName;
    //TopBar.lblProgTitle.Text := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    iwlProgressDate.Caption := UserSession.ProgressDate;
  //end;
  UserSession.IsFirstShow := false;
end;

procedure TISFMain.IWAppFormRender(Sender: TObject);
//var
  //ShowUsagePermissions : boolean;
begin
  FrameMenu.IWMenu1.Visible := UserSession.LoggedIn;
  //FrameMenu.SelectChart1.Visible := UserSession.LoggedIn;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //dmUser.SetDeveloperData('DateView Form Render');
  if (UserSession.LoggedIn) then LoadWelcomeMessage;       //bme
  {
  if ((UserSession.IsDeveloper) and (UserSession.LoggedIn)) then
  begin
    dmUser.qNumTimesUsed.Close;
    dmUser.qNumTimesUsed.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsNumTimesUsed.Close;
    dmUser.cdsNumTimesUsed.Open;
    UserSession.NumUses := dmUser.cdsNumTimesUsedNUMTIMESUSED.AsInteger;
    iwlNumUses.Caption := 'This program has been used '+IntToStr(UserSession.NumUses)+' times';
    iwlNumUses.Visible := true;
    dmUser.cdsNumTimesUsed.Close;
  end else
  begin
    iwlNumUses.Caption := '';
  end;
  }
  if (not UserSession.LoggedIn) then
  begin
    FrameMenu.Visible := false;
  end else
  begin
    FrameMenu.Visible := true;
  end;
  FrameMenu.DefineSQL1.Visible := UserSession.IsDeveloper;
  FrameMenu.RawDataIdentifyAgePeaks1.Enabled := UserSession.CanModify;
  //LeftTree.iwregPageLinks.Visible := UserSession.LoggedIn;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //TopBar.iwlDonate.Visible := UserSession.LoggedIn;
end;

procedure TISFMain.iwbCheckGetIniFileClick(Sender: TObject);
var
  AppIni   : TIniFile;
  //tmpStr   : string;
  //iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  DriverName,
  LibraryName, VendorLib, GetDriverFunc,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  StratDBPath,
  DateViewPath,
  DBUserName, DBPassword,
  //DBSpecific,
  DBSQLDialectStr,DBCharSet,
  //DataPath   : string;
  PublicPath : string;
begin
  PublicPath := TPath.GetPublicPath;
  //PublicPath := TPath.GetHomePath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  URLBase := '/';
  UserSession.ShowDebugButtons := true;
  UserSession.DelayConnections := false;
  UserControlPath := 'localhost:c:/Data/Firebird/UserControl.fdb';
  StratDBPath := 'localhost:c:/Data/Firebird/StratDB.fdb';
  DateViewPath := 'localhost:c:/Data/Firebird/DateView.fdb';
  DriverName := 'DevartFirebird';
  LibraryName := 'dbexpida41.dll';
  VendorLib := 'fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'masterkey';
  DBSQLDialectStr := '3';
  DBCharSet := 'ASCII';
  DBMonitor := 'Active';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'dateview.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','bromo2.usask.ca:s:/Data/Firebird/UserControl2015.fdb');
    StratDBPath := AppIni.ReadString('Paths','StratDB path','bromo2.usask.ca:s:/Data/Firebird/StratDB2015.fdb');
    DateViewPath := AppIni.ReadString('Paths','DateView path','bromo2.usask.ca:s:/Data/Firebird/DateView2015.fdb');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','masterkey');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','active');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Active');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
    WebApplication.ShowMessage('IniFileName = '+IniFileName);
    WebApplication.ShowMessage('UserControlPath = '+UserControlPath);
    WebApplication.ShowMessage('DateViewPath = '+DateViewPath);
    WebApplication.ShowMessage('StratDBPath = '+StratDBPath);
    WebApplication.ShowMessage('User_name = '+DBUserName);
    WebApplication.ShowMessage('Password = '+DBPassword);
    WebApplication.ShowMessage('DriverName = '+DriverName);
    WebApplication.ShowMessage('LibraryName = '+LibraryName);
    WebApplication.ShowMessage('VendorLib = '+VendorLib);
    WebApplication.ShowMessage('GetDriverFunc = '+GetDriverFunc);
    WebApplication.ShowMessage('SQLDialect = '+DBSQLDialectStr);
    WebApplication.ShowMessage('Charset = '+DBCharset);
  finally
    AppIni.Free;
  end;
end;

procedure TISFMain.iwbPermissionsClick(Sender: TObject);
begin
  if not UserSession.IsDeveloper then WebApplication.ShowMessage('IsDeveloper is FALSE')
                                 else WebApplication.ShowMessage('IsDeveloper is TRUE');
  if not UserSession.CanView then WebApplication.ShowMessage('CanView is FALSE')
                                 else WebApplication.ShowMessage('CanView is TRUE');
  if not UserSession.CanModify then WebApplication.ShowMessage('CanModify is FALSE')
                                 else WebApplication.ShowMessage('CanModify is TRUE');
  if not UserSession.CanInsert then WebApplication.ShowMessage('CanInsert is FALSE')
                                 else WebApplication.ShowMessage('CanInsert is TRUE');
  if not UserSession.CanDelete then WebApplication.ShowMessage('CanDelete is FALSE')
                                 else WebApplication.ShowMessage('CanDelete is TRUE');
  if not UserSession.CanValidate then WebApplication.ShowMessage('CanValidate is FALSE')
                                 else WebApplication.ShowMessage('CanValidate is TRUE');
  if not UserSession.CanExport then WebApplication.ShowMessage('CanExport is FALSE')
                                 else WebApplication.ShowMessage('CanExportGraphValues is TRUE');
  if not UserSession.CanViewPlus then WebApplication.ShowMessage('CanViewPlus is FALSE')
                                 else WebApplication.ShowMessage('CanViewPlus is TRUE');
  if not UserSession.CanModifyPlus then WebApplication.ShowMessage('CanModifyPlus is FALSE')
                                 else WebApplication.ShowMessage('CanModifyPlus is TRUE');
end;

procedure TISFMain.iwb_TestDestroyClick(Sender: TObject);
begin
  {
  FreeAndNil(ContinentValues);
  FreeAndNil(AreaValues);
  FreeAndNil(UnitValues);
  FreeAndNil(LithologyValues);
  FreeAndNil(MaterialValues);
  FreeAndNil(MethodValues);
  FreeAndNil(IsotopeSystemValues);
  FreeAndNil(InterpretationValues);
  FreeAndNil(ApproachValues);
  FreeAndNil(TechniqueValues);
  FreeAndNil(GroupValues);
  FreeAndNil(ProvinceValues);
  FreeAndNil(TerraneValues);
  FreeAndNil(OrogenicPeriodValues);
  FreeAndNil(ReferenceValues);
  FreeAndNil(ChemicalTypeValues);
  FreeAndNil(BoundaryPositionValues);
  FreeAndNil(BoundaryValues);
  FreeAndNil(ValidationValues);
  FreeAndNil(WhoForValues);
  FreeAndNil(PlateValues);
  FreeAndNil(DecayUncertaintyValues);
  FreeAndNil(UsersContributedValues);
  FreeAndNil(Interpretation1Values);
  FreeAndNil(Interpretation2Values);
  FreeAndNil(Interpretation3Values);
  FreeAndNil(Interpretation4Values);
  FreeAndNil(Interpretation5Values);
  FreeAndNil(LIPValues);
  FreeAndNil(SampleValues);
  FreeAndNil(SampleZoneValues);
  //dmReplicate.sqlcStrat.Connected := false;
  dmdDV.sqlcDateView.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmOpt.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmUser.sqlcWebUser.Connected := false;
  }
end;

procedure TISFMain.LeftTreeiwlReferencesClick(Sender: TObject);
begin
  //FrameMenu.ReferencesClick(Sender);
end;

procedure TISFMain.LeftTreeiwlSamplesClick(Sender: TObject);
begin
  //FrameMenu.SamplesClick(Sender);
end;

procedure TISFMain.TopBariwlSignOutClick(Sender: TObject);
begin
  //dmDV.cdsNumRecords.Close;
  TopBar.iwlSignOutClick(Sender);
end;

procedure TISFMain.LeftTreeiwlDefineQueryClick(Sender: TObject);
begin
  //FrameMenu.DefineQueryClick(Sender);
end;

procedure TISFMain.LeftTreeiwlOptionsClick(Sender: TObject);
begin
  //FrameMenu.OptionsClick(Sender);
end;

procedure TISFMain.TopBarlnkSignInClick(Sender: TObject);
begin
  TopBar.SignIn(Sender);
end;

initialization
  TISFMain.SetAsMainForm;
end.
