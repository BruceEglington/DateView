unit DVIW_options;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, IWCompGrids, IWDBGrids,
  DB,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion,
  IWCompRadioButton;

type
  TISFOptions = class(TIWAppForm)
    TopBar: TISFTopBar;
    IWRegion6: TIWRegion;
    IWRegion7: TIWRegion;
    rectLeft: TIWRectangle;
    IWRegion5: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwbSavePreferences: TIWButton;
    iwbCancel: TIWButton;
    IWText1: TIWText;
    iwrInterpretations: TIWRegion;
    IWLabel30: TIWLabel;
    IWLabel2: TIWLabel;
    iweInterpretation1: TIWEdit;
    IWLabel5: TIWLabel;
    iwlInterpretation1: TIWListbox;
    IWLabel6: TIWLabel;
    iweInterpretation2: TIWEdit;
    IWLabel7: TIWLabel;
    iwlInterpretation2: TIWListbox;
    IWLabel8: TIWLabel;
    iweInterpretation3: TIWEdit;
    IWLabel9: TIWLabel;
    iwlInterpretation3: TIWListbox;
    IWLabel10: TIWLabel;
    iweInterpretation4: TIWEdit;
    IWLabel11: TIWLabel;
    iwlInterpretation4: TIWListbox;
    IWLabel12: TIWLabel;
    IWLabel13: TIWLabel;
    iweInterpretation5: TIWEdit;
    iwlInterpretation5: TIWListbox;
    lblInterpretation5Values: TIWLabel;
    lblInterpretation5Caption: TIWLabel;
    lblInterpretation4Values: TIWLabel;
    lblInterpretation4Caption: TIWLabel;
    lblInterpretation3Values: TIWLabel;
    lblInterpretation3Caption: TIWLabel;
    lblInterpretation2Values: TIWLabel;
    lblInterpretation2Caption: TIWLabel;
    lblInterpretation1Values: TIWLabel;
    lblInterpretation1Caption: TIWLabel;
    iwrAgeBands: TIWRegion;
    IWLabel15: TIWLabel;
    lblDateBand1Caption: TIWLabel;
    lblDate1Values: TIWLabel;
    lblDateBand2Caption: TIWLabel;
    lblDate2Values: TIWLabel;
    lblDateBand3Caption: TIWLabel;
    lblDate3Values: TIWLabel;
    lblDateBand4Caption: TIWLabel;
    lblDate4Values: TIWLabel;
    lblDateBand5Caption: TIWLabel;
    lblDate5Values: TIWLabel;
    iweDateBand5Maximum: TIWEdit;
    IWLabel27: TIWLabel;
    iweDateBand5Minimum: TIWEdit;
    IWLabel26: TIWLabel;
    iweDateBand5: TIWEdit;
    IWLabel25: TIWLabel;
    iweDateBand4Maximum: TIWEdit;
    IWLabel24: TIWLabel;
    iweDateBand4Minimum: TIWEdit;
    IWLabel23: TIWLabel;
    iweDateBand4: TIWEdit;
    IWLabel4: TIWLabel;
    iweDateBand3Maximum: TIWEdit;
    IWLabel22: TIWLabel;
    iweDateBand3Minimum: TIWEdit;
    IWLabel21: TIWLabel;
    iweDateBand3: TIWEdit;
    IWLabel20: TIWLabel;
    iweDateBand2Maximum: TIWEdit;
    IWLabel19: TIWLabel;
    iweDateBand2Minimum: TIWEdit;
    IWLabel18: TIWLabel;
    iweDateBand2: TIWEdit;
    IWLabel17: TIWLabel;
    iweDateBand1Maximum: TIWEdit;
    IWLabel16: TIWLabel;
    iweDateBand1Minimum: TIWEdit;
    iweDateBand1: TIWEdit;
    IWLabel14: TIWLabel;
    IWLabel29: TIWLabel;
    iwrGraphOptions: TIWRegion;
    IWLabel31: TIWLabel;
    IWLabel1: TIWLabel;
    IWLabel28: TIWLabel;
    iwrgShowAllSampleLocalities: TIWRadioGroup;
    iwrgPDFType: TIWRadioGroup;
    iweMinimumUncertaintyForDates: TIWEdit;
    IWLabel3: TIWLabel;
    lblGroupBy: TIWLabel;
    lblMinimumUncertainty: TIWLabel;
    lblShowAll: TIWLabel;
    lblPDFType: TIWLabel;
    iwcbGroupBy: TIWComboBox;
    iwrBottomButtons: TIWRegion;
    iwbSubmitQuery2: TIWButton;
    IWButton1: TIWButton;
    iwrRatios: TIWRegion;
    IWLabel32: TIWLabel;
    iwDBgRatioOptionTypes: TIWDBGrid;
    iwdbnOptionTypes: TIWDBNavigator;
    IWLabel33: TIWLabel;
    IWLabel34: TIWLabel;
    IWLabel35: TIWLabel;
    IWLabel36: TIWLabel;
    IWLabel37: TIWLabel;
    IWLabel38: TIWLabel;
    IWLabel39: TIWLabel;
    IWLabel40: TIWLabel;
    IWLabel41: TIWLabel;
    IWLabel42: TIWLabel;
    IWLabel43: TIWLabel;
    IWLabel44: TIWLabel;
    IWLabel45: TIWLabel;
    IWLabel46: TIWLabel;
    IWLabel47: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWDBEdit5: TIWDBEdit;
    IWDBEdit6: TIWDBEdit;
    IWDBEdit7: TIWDBEdit;
    IWDBEdit8: TIWDBEdit;
    IWDBEdit9: TIWDBEdit;
    IWDBEdit10: TIWDBEdit;
    IWDBEdit11: TIWDBEdit;
    IWDBEdit12: TIWDBEdit;
    IWDBEdit13: TIWDBEdit;
    IWDBEdit14: TIWDBEdit;
    IWDBEdit15: TIWDBEdit;
    iwbRatiosEdit: TIWButton;
    iwbRatiosApplyUpdates: TIWButton;
    iwbRatiosCancelChanges: TIWButton;
    iwrMaximumDownloadRecords: TIWRegion;
    IWLabel48: TIWLabel;
    iwdbgMaxOutputLimits: TIWDBGrid;
    iwbSaveAgeBands: TIWButton;
    iwrDownloadFileFormat: TIWRegion;
    IWLabel49: TIWLabel;
    cbPDF: TIWRadioButton;
    cbHTML: TIWRadioButton;
    cbXls: TIWRadioButton;
    cbCSV: TIWRadioButton;
    cbXlsx: TIWRadioButton;
    iwrgDownloadFileFormat: TIWRadioGroup;
    procedure iwbSavePreferencesClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
    procedure iwbSaveAgeBandsClick(Sender: TObject);
    procedure iwDBgRatioOptionTypesColumns0Click(ASender: TObject;
      const AValue: string);
    procedure iwDBgRatioOptionTypesColumns0TitleClick(Sender: TObject);
    procedure iwdbnOptionTypesNext(Sender: TObject);
    procedure iwbRatiosEditClick(Sender: TObject);
    procedure iwbRatiosApplyUpdatesClick(Sender: TObject);
    procedure iwbRatiosCancelChangesClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ; 
  end;

implementation

uses ServerController, DVIW_uMain, DB_List_Combo, DVIW_dmopt,
  DVIW_constants, DVIW_dm, usrIW_dm;

{$R *.dfm}


procedure TISFOptions.iwbSaveAgeBandsClick(Sender: TObject);
begin
    UserSession.DateBand1Caption := iweDateBand1.Text;
    UserSession.DateBand2Caption := iweDateBand2.Text;
    UserSession.DateBand3Caption := iweDateBand3.Text;
    UserSession.DateBand4Caption := iweDateBand4.Text;
    UserSession.DateBand5Caption := iweDateBand5.Text;
    UserSession.DateBand1Minimum := iweDateBand1Minimum.Text;
    UserSession.DateBand2Minimum := iweDateBand2Minimum.Text;
    UserSession.DateBand3Minimum := iweDateBand3Minimum.Text;
    UserSession.DateBand4Minimum := iweDateBand4Minimum.Text;
    UserSession.DateBand5Minimum := iweDateBand5Minimum.Text;
    UserSession.DateBand1Maximum := iweDateBand1Maximum.Text;
    UserSession.DateBand2Maximum := iweDateBand2Maximum.Text;
    UserSession.DateBand3Maximum := iweDateBand3Maximum.Text;
    UserSession.DateBand4Maximum := iweDateBand4Maximum.Text;
    UserSession.DateBand5Maximum := iweDateBand5Maximum.Text;
    dmOpt.SetUserOptions3;
end;

procedure TISFOptions.iwbSavePreferencesClick(Sender: TObject);
begin
  if Validate then
  begin
    ClearErrorMessages;
    UserSession.Interpretation1Caption := iweInterpretation1.Text;
    UserSession.Interpretation2Caption := iweInterpretation2.Text;
    UserSession.Interpretation3Caption := iweInterpretation3.Text;
    UserSession.Interpretation4Caption := iweInterpretation4.Text;
    UserSession.Interpretation5Caption := iweInterpretation5.Text;
    GetListBoxValues(iwlInterpretation1,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation1Values);
    GetListBoxValues(iwlInterpretation2,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation2Values);
    GetListBoxValues(iwlInterpretation3,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation3Values);
    GetListBoxValues(iwlInterpretation4,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation4Values);
    GetListBoxValues(iwlInterpretation5,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation5Values);
    UserSession.DateBand1Caption := iweDateBand1.Text;
    UserSession.DateBand2Caption := iweDateBand2.Text;
    UserSession.DateBand3Caption := iweDateBand3.Text;
    UserSession.DateBand4Caption := iweDateBand4.Text;
    UserSession.DateBand5Caption := iweDateBand5.Text;
    UserSession.DateBand1Minimum := iweDateBand1Minimum.Text;
    UserSession.DateBand2Minimum := iweDateBand2Minimum.Text;
    UserSession.DateBand3Minimum := iweDateBand3Minimum.Text;
    UserSession.DateBand4Minimum := iweDateBand4Minimum.Text;
    UserSession.DateBand5Minimum := iweDateBand5Minimum.Text;
    UserSession.DateBand1Maximum := iweDateBand1Maximum.Text;
    UserSession.DateBand2Maximum := iweDateBand2Maximum.Text;
    UserSession.DateBand3Maximum := iweDateBand3Maximum.Text;
    UserSession.DateBand4Maximum := iweDateBand4Maximum.Text;
    UserSession.DateBand5Maximum := iweDateBand5Maximum.Text;
    UserSession.MinimumDateUncertainty := iweMinimumUncertaintyForDates.Text;
    UserSession.GroupBy := iwcbGroupBy.Text;
    case iwrgShowAllSampleLocalities.ItemIndex of
      0 : UserSession.ShowAllSampleLocalities := true;
      1 : UserSession.ShowAllSampleLocalities := false;
    end;
    //force to show all so as to save time in map graph query
    UserSession.ShowAllSampleLocalities := true;
    case iwrgPDFType.ItemIndex of
      0 : UserSession.PDFType := 'AND';
      1 : UserSession.PDFType := 'OR';
    end;
    if (UpperCase(UserSession.UserID) <> 'GUEST') then dmOpt.SetUserOptions3;
    dmUser.cdsUserMaximumOutputLimits.Close;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMain.Create(WebApplication).Show
  end;
end;

procedure TISFOptions.iwDBgRatioOptionTypesColumns0Click(ASender: TObject;
  const AValue: string);
begin
  dmOpt.cdsOptionTypes.Locate('OptionTypeID',AValue,[]);
  dmOpt.qOptR.Close;
  dmOpt.qOptR.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOptR.ParamByName('OptionTypeID').AsString := dmOpt.cdsOptionTypesOPTIONTYPEID.AsString;
  dmOpt.cdsOptR.Close;
  dmOpt.cdsOptR.Open;
end;

procedure TISFOptions.iwDBgRatioOptionTypesColumns0TitleClick(Sender: TObject);
begin
  //
end;

procedure TISFOptions.iwdbnOptionTypesNext(Sender: TObject);
begin
  dmOpt.qOptR.Close;
  dmOpt.qOptR.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOptR.ParamByName('OptionTypeID').AsString := dmOpt.cdsOptionTypesOPTIONTYPEID.AsString;
  dmOpt.cdsOptR.Close;
  dmOpt.cdsOptR.Open;
end;

procedure TISFOptions.IWAppFormCreate(Sender: TObject);
var
  i,j : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  UserSession.PDFHasChanged := true;
  UserSession.DataHaveChanged := true;
  ClearErrorMessages;
  iweInterpretation1.Text := UserSession.Interpretation1Caption;
  iweInterpretation2.Text := UserSession.Interpretation2Caption;
  iweInterpretation3.Text := UserSession.Interpretation3Caption;
  iweInterpretation4.Text := UserSession.Interpretation4Caption;
  iweInterpretation5.Text := UserSession.Interpretation5Caption;
  UpdateListBoxValues(iwlInterpretation1,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation1Values);
  UpdateListBoxValues(iwlInterpretation2,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation2Values);
  UpdateListBoxValues(iwlInterpretation3,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation3Values);
  UpdateListBoxValues(iwlInterpretation4,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation4Values);
  UpdateListBoxValues(iwlInterpretation5,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.Interpretation5Values);
  iweDateBand1.Text := UserSession.DateBand1Caption;
  iweDateBand2.Text := UserSession.DateBand2Caption;
  iweDateBand3.Text := UserSession.DateBand3Caption;
  iweDateBand4.Text := UserSession.DateBand4Caption;
  iweDateBand5.Text := UserSession.DateBand5Caption;
  iweDateBand1Minimum.Text := UserSession.DateBand1Minimum;
  iweDateBand2Minimum.Text := UserSession.DateBand2Minimum;
  iweDateBand3Minimum.Text := UserSession.DateBand3Minimum;
  iweDateBand4Minimum.Text := UserSession.DateBand4Minimum;
  iweDateBand5Minimum.Text := UserSession.DateBand5Minimum;
  iweDateBand1Maximum.Text := UserSession.DateBand1Maximum;
  iweDateBand2Maximum.Text := UserSession.DateBand2Maximum;
  iweDateBand3Maximum.Text := UserSession.DateBand3Maximum;
  iweDateBand4Maximum.Text := UserSession.DateBand4Maximum;
  iweDateBand5Maximum.Text := UserSession.DateBand5Maximum;
  iweMinimumUncertaintyForDates.Text := UserSession.MinimumDateUncertainty;
  for i := 0 to iwcbGroupBy.Items.Count-1 do
  begin
    if (UserSession.GroupBy = iwcbGroupBy.Items.Strings[i]) then
    begin
      iwcbGroupBy.ItemIndex := i;
      Break;
    end;
  end;
  if UserSession.ShowAllSampleLocalities then
  begin
    iwrgShowAllSampleLocalities.ItemIndex := 0;
  end else
  begin
    iwrgShowAllSampleLocalities.ItemIndex := 1;
  end;
  if (UserSession.PDFType='AND') then
  begin
    iwrgPDFType.ItemIndex := 0;
  end else
  begin
    iwrgPDFType.ItemIndex := 1;
  end;
  dmOpt.qOptionTypes.Close;
  dmOpt.cdsOptionTypes.Close;
  dmOpt.cdsOptionTypes.Open;
  dmOpt.qOptR.Close;
  dmOpt.qOptR.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOptR.ParamByName('OptionTypeID').AsString := dmOpt.cdsOptionTypesOPTIONTYPEID.AsString;
  dmOpt.cdsOptR.Close;
  dmOpt.cdsOptR.Open;

  dmUser.qUserMaximumOutputLimits.Close;
  dmUser.qUserMaximumOutputLimits.ParamByName('UserID').AsString := UserSession.UserID;
  dmUser.qUserMaxOutputRecords.ParamByName('DownloadTypeID').AsInteger := 2;
  dmUser.cdsUserMaximumOutputLimits.Close;
  dmUser.cdsUserMaximumOutputLimits.Open;
  if (dmUser.cdsUserMaximumOutputLimits.RecordCount < 1) then
  begin
    dmUser.SetUserDownloadLimits(UserSession.UserID,0);
    dmUser.SetUserDownloadLimits(UserSession.UserID,1);
    dmUser.SetUserDownloadLimits(UserSession.UserID,2);
    dmUser.SetUserDownloadLimits(UserSession.UserID,3);
    dmUser.SetUserDownloadLimits(UserSession.UserID,4);
    dmUser.cdsUserMaximumOutputLimits.Close;
    dmUser.cdsUserMaximumOutputLimits.Open;
  end;
end;

procedure TISFOptions.IWAppFormRender(Sender: TObject);
begin
  iwbRatiosEdit.Visible := dmOpt.cdsOptR.State in [dsBrowse];
  iwbRatiosApplyUpdates.Visible := dmOpt.cdsOptR.State in [dsEdit,dsInsert];
  iwbRatiosCancelChanges.Visible := dmOpt.cdsOptR.State in [dsEdit,dsInsert];
end;

procedure TISFOptions.iwbRatiosApplyUpdatesClick(Sender: TObject);
begin
  dmOpt.cdsOptR.ApplyUpdates(0);
end;

procedure TISFOptions.iwbRatiosCancelChangesClick(Sender: TObject);
begin
  dmOpt.cdsOptR.CancelUpdates;
end;

procedure TISFOptions.iwbCancelClick(Sender: TObject);
begin
  dmUser.cdsUserMaximumOutputLimits.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFOptions.iwbRatiosEditClick(Sender: TObject);
begin
  dmOpt.cdsOptR.Edit;
  dmOpt.cdsOptRCap1.Edit;
  dmOpt.cdsOptRCap2.Edit;
  dmOpt.cdsOptRCap3.Edit;
  dmOpt.cdsOptRCap4.Edit;
  dmOpt.cdsOptRCap5.Edit;
  dmOpt.cdsOptRVal1.Edit;
  dmOpt.cdsOptRVal2.Edit;
  dmOpt.cdsOptRVal3.Edit;
  dmOpt.cdsOptRVal4.Edit;
  dmOpt.cdsOptRVal5.Edit;
end;

function TISFOptions.Validate: Boolean;
var
  iCode : integer;
  temp : double;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iweInterpretation1.Text) = '') then
    begin
      lblInterpretation1Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweInterpretation2.Text) = '') then
    begin
      lblInterpretation2Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweInterpretation3.Text) = '') then
    begin
      lblInterpretation3Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweInterpretation4.Text) = '') then
    begin
      lblInterpretation4Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweInterpretation5.Text) = '') then
    begin
      lblInterpretation5Caption.Visible := true;
      Result := false;
    end;
  if (iwlInterpretation1.Items.Count = 0) then
    begin
      lblInterpretation1Values.Visible := true;
      Result := false;
    end;
  if (iwlInterpretation2.Items.Count = 0) then
    begin
      lblInterpretation2Values.Visible := true;
      Result := false;
    end;
  if (iwlInterpretation3.Items.Count = 0) then
    begin
      lblInterpretation3Values.Visible := true;
      Result := false;
    end;
  if (iwlInterpretation4.Items.Count = 0) then
    begin
      lblInterpretation4Values.Visible := true;
      Result := false;
    end;
  if (iwlInterpretation5.Items.Count = 0) then
    begin
      lblInterpretation5Values.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand1.Text) = '') then
    begin
      lblDateBand1Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand2.Text) = '') then
    begin
      lblDateBand2Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand3.Text) = '') then
    begin
      lblDateBand3Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand4.Text) = '') then
    begin
      lblDateBand4Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand5.Text) = '') then
    begin
      lblDateBand5Caption.Visible := true;
      Result := false;
    end;
  Val(iweDateBand1Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate1Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand2Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate2Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand3Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate3Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand4Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate4Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand5Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate5Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand1Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate1Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand2Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate2Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand3Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate3Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand4Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate4Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand5Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate5Values.Visible := true;
      Result := false;
    end;
  if (iwcbGroupBy.Text = '') then
    begin
      lblGroupBy.Visible := true;
      Result := false;
    end;
  Val(iweMinimumUncertaintyForDates.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblMinimumUncertainty.Visible := true;
      Result := false;
    end;
  Result := true;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFOptions.ClearErrorMessages;
begin
  lblInterpretation1Caption.Visible := false;
  lblInterpretation2Caption.Visible := false;
  lblInterpretation3Caption.Visible := false;
  lblInterpretation4Caption.Visible := false;
  lblInterpretation5Caption.Visible := false;
  lblInterpretation1Values.Visible := false;
  lblInterpretation2Values.Visible := false;
  lblInterpretation3Values.Visible := false;
  lblInterpretation4Values.Visible := false;
  lblInterpretation5Values.Visible := false;
  lblDateBand1Caption.Visible := false;
  lblDateBand2Caption.Visible := false;
  lblDateBand3Caption.Visible := false;
  lblDateBand4Caption.Visible := false;
  lblDateBand5Caption.Visible := false;
  lblDate1Values.Visible := false;
  lblDate2Values.Visible := false;
  lblDate3Values.Visible := false;
  lblDate4Values.Visible := false;
  lblDate5Values.Visible := false;
  lblGroupBy.Visible := false;
  lblMinimumUncertainty.Visible := false;
  lblShowAll.Visible := false;
  lblPDFType.Visible := false;
end;

end.
