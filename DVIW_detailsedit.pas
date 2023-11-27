unit DVIW_detailsedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWCompGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TISFDetailsEdit = class(TIWAppForm)
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    IWLabel11: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    IWLabel12: TIWLabel;
    IWDBEdit12: TIWDBEdit;
    IWLabel13: TIWLabel;
    IWDBEdit13: TIWDBEdit;
    IWLabel15: TIWLabel;
    iwDBeWeighting: TIWDBEdit;
    iwlDC1: TIWLabel;
    iwDBeDC1: TIWDBEdit;
    iwlDC1error: TIWLabel;
    iwDBeDC1error: TIWDBEdit;
    IWLabel18: TIWLabel;
    IWLabel19: TIWLabel;
    iwlOtherIntercept: TIWLabel;
    iwDBeOtherIntercept: TIWDBEdit;
    iwlOtherInterceptPError: TIWLabel;
    iwDBeOtherInterceptPError: TIWDBEdit;
    iwlOtherInterceptMError: TIWLabel;
    iwDBeOtherInterceptMError: TIWDBEdit;
    iwlDC2: TIWLabel;
    iwDBeDC2: TIWDBEdit;
    iwlDC2error: TIWLabel;
    iwDBeDC2error: TIWDBEdit;
    iwDBgReference: TIWDBGrid;
    iwDBgValidation: TIWDBGrid;
    IWLabel24: TIWLabel;
    iwDBgSample: TIWDBGrid;
    IWLabel25: TIWLabel;
    IWLabel26: TIWLabel;
    iwDBgProvince: TIWDBGrid;
    iwDBgTerrane: TIWDBGrid;
    IWLabel27: TIWLabel;
    iwDBgChemicalType: TIWDBGrid;
    iwDBgOrogenicPeriod: TIWDBGrid;
    IWLabel28: TIWLabel;
    iwDBeAugmentation: TIWDBEdit;
    IWLabel29: TIWLabel;
    iwDBeLudwig: TIWDBEdit;
    IWLabel30: TIWLabel;
    iwDBeConstraints: TIWDBEdit;
    IWLabel31: TIWLabel;
    iwDBeAgeConstrain: TIWDBEdit;
    IWLabel32: TIWLabel;
    iwDBeXConstrain: TIWDBEdit;
    IWLabel33: TIWLabel;
    iwDBeYConstrain: TIWDBEdit;
    iwDBeZConstrain: TIWDBEdit;
    IWLabel34: TIWLabel;
    IWLabel35: TIWLabel;
    iwDBeXCentroid: TIWDBEdit;
    IWLabel36: TIWLabel;
    iwDBeYCentroid: TIWDBEdit;
    IWLabel37: TIWLabel;
    iwDBeZCentroid: TIWDBEdit;
    IWLabel38: TIWLabel;
    iwDBeProgName: TIWDBEdit;
    IWLabel39: TIWLabel;
    iwDBeProbOfFit: TIWDBEdit;
    IWLabel40: TIWLabel;
    iwDBeAlpha: TIWDBEdit;
    IWLabel41: TIWLabel;
    iwDBeMSWD: TIWDBEdit;
    IWLabel42: TIWLabel;
    iwDBeFcutoff: TIWDBEdit;
    IWLabel43: TIWLabel;
    iwDBeProbConcord: TIWDBEdit;
    IWLabel44: TIWLabel;
    iwDBeNReg: TIWDBEdit;
    IWLabel45: TIWLabel;
    iwDBeNSamp: TIWDBEdit;
    iwDBeNRep: TIWDBEdit;
    IWLabel46: TIWLabel;
    iwDBeDegFree: TIWDBEdit;
    IWLabel47: TIWLabel;
    IWLabel48: TIWLabel;
    iwDBgLaboratory: TIWDBGrid;
    IWLabel49: TIWLabel;
    iwDBmComments: TIWDBMemo;
    iwlConfidentiality: TIWLabel;
    iwDBeConfidentiality: TIWDBEdit;
    IWLabel52: TIWLabel;
    iwDBeInitialRatio: TIWDBEdit;
    IWLabel53: TIWLabel;
    iwDBeInitialRatioError: TIWDBEdit;
    IWLabel51: TIWLabel;
    iwDBeEpsilon: TIWDBEdit;
    IWLabel54: TIWLabel;
    iwDBeEpsilonError: TIWDBEdit;
    IWLabel55: TIWLabel;
    iwDBeInitialRatio3D: TIWDBEdit;
    IWLabel56: TIWLabel;
    iwDBeInitialRatio3DError: TIWDBEdit;
    IWLabel57: TIWLabel;
    iwDBeModelUsed: TIWDBEdit;
    IWLabel59: TIWLabel;
    IWLabel60: TIWLabel;
    iwDBeMuPError: TIWDBEdit;
    iwDBeMuMError: TIWDBEdit;
    IWLabel61: TIWLabel;
    iwDBeMu: TIWDBEdit;
    IWLabel58: TIWLabel;
    iwDBgGrouping: TIWDBGrid;
    IWLabel62: TIWLabel;
    IWLabel63: TIWLabel;
    iwDBgBoundary: TIWDBGrid;
    IWLabel64: TIWLabel;
    iwDBgImage: TIWDBGrid;
    iwDBgWhoFor: TIWDBGrid;
    iwDBlcbLithology: TIWDBLookupComboBox;
    iwbPost: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwDBlcbInterpretation: TIWDBLookupComboBox;
    iwDBlcbPrefLevel: TIWDBLookupComboBox;
    iwDBlcbMethod: TIWDBLookupComboBox;
    iwDBnReferences: TIWDBNavigator;
    iwDBnLaboratories: TIWDBNavigator;
    IWDBNavigator3: TIWDBNavigator;
    IWLabel66: TIWLabel;
    IWDBNavigator4: TIWDBNavigator;
    IWDBNavigator5: TIWDBNavigator;
    IWDBNavigator6: TIWDBNavigator;
    IWDBNavigator7: TIWDBNavigator;
    IWDBNavigator8: TIWDBNavigator;
    IWDBNavigator9: TIWDBNavigator;
    iwdbnWhoFor: TIWDBNavigator;
    iwlWhoFor: TIWLabel;
    IWDBNavigator10: TIWDBNavigator;
    iwbCancelChanges: TIWButton;
    iwbAddReference: TIWButton;
    iwbAddLaboratory: TIWButton;
    iwbAddProvince: TIWButton;
    iwbAddTerrane: TIWButton;
    iwbAddGroup: TIWButton;
    iwbAddChemType: TIWButton;
    iwbAddOrogenic: TIWButton;
    iwbAddBoundary: TIWButton;
    iwbAddImage: TIWButton;
    iwbAddWhoFor: TIWButton;
    iwbAddSample: TIWButton;
    iwbDeleteReference: TIWButton;
    iwbDeleteLaboratory: TIWButton;
    iwbDeleteProvince: TIWButton;
    iwbDeleteTerrane: TIWButton;
    iwbDeleteGroup: TIWButton;
    iwbDeleteChemType: TIWButton;
    iwbDeleteOrogenic: TIWButton;
    iwbDeleteBoundary: TIWButton;
    iwbDeleteImage: TIWButton;
    iwbDeleteWhoFor: TIWButton;
    iwbDeleteSample: TIWButton;
    iwlFooterProgramName: TIWLabel;
    iwlFooterCopyright: TIWLabel;
    IWLabel69: TIWLabel;
    iwDBlcbMethod2: TIWDBLookupComboBox;
    iwbValidate: TIWButton;
    rectLeft: TIWRectangle;
    iwbAddInitialRatioData: TIWButton;
    iwbAddStatisticsData: TIWButton;
    iwbAddOtherInterceptData: TIWButton;
    iwbRawData: TIWButton;
    iwbDelete: TIWButton;
    iwbEdit: TIWButton;
    IWDBLabel1: TIWDBLabel;
    iwbObjection: TIWButton;
    iwbNewErrorRec: TIWButton;
    iwbReturnBottom: TIWButton;
    iwbEditBottom: TIWButton;
    iwbApplyUpdatesBottom: TIWButton;
    iwbCancelChangesBottom: TIWButton;
    IWLabel16: TIWLabel;
    iwDBeStratDBID: TIWDBEdit;
    IWLabel14: TIWLabel;
    IWDBNavigator1: TIWDBNavigator;
    iwbAddLIP: TIWButton;
    iwbDeleteLIP: TIWButton;
    iwDBgLIP: TIWDBGrid;
    iwbAddComment: TIWButton;
    TopBar: TISFTopBar;
    iwbLinkRawData: TIWButton;
    iwDBlcbArea: TIWDBLookupComboBox;
    iwDBlcbUnit: TIWDBLookupComboBox;
    iwDBlcbMaterial: TIWDBLookupComboBox;
    iwDBlcbIsoSys: TIWDBLookupComboBox;
    iwDBlcbApproach: TIWDBLookupComboBox;
    iwDBlcbTechnique: TIWDBLookupComboBox;
    iwrSameSampleRecords: TIWRegion;
    IWLabel17: TIWLabel;
    IWLabel50: TIWLabel;
    IWLabel65: TIWLabel;
    IWLabel70: TIWLabel;
    IWLabel71: TIWLabel;
    IWLabel72: TIWLabel;
    iwdbgSameSampleResults: TIWDBGrid;
    iwbCreateEquivalentRecord: TIWButton;
    iwcbMaterial: TIWComboBox;
    iwcbIsotopeSystem: TIWComboBox;
    iwcbApproach: TIWComboBox;
    iwcbTechnique: TIWComboBox;
    iwcbInterpretation: TIWComboBox;
    IWLabel20: TIWLabel;
    iweDate: TIWEdit;
    IWLabel21: TIWLabel;
    iweDatePError: TIWEdit;
    IWLabel22: TIWLabel;
    iweDateMError: TIWEdit;
    iwlAgeUnitsNew: TIWLabel;
    iwbMakePublic: TIWButton;
    IWLabel23: TIWLabel;
    iwcbRating: TIWComboBox;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbPostClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwDBgLaboratoryColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbAddReferenceClick(Sender: TObject);
    procedure iwbAddLaboratoryClick(Sender: TObject);
    procedure iwbAddProvinceClick(Sender: TObject);
    procedure iwbAddTerraneClick(Sender: TObject);
    procedure iwbAddGroupClick(Sender: TObject);
    procedure iwbAddChemTypeClick(Sender: TObject);
    procedure iwbAddOrogenicClick(Sender: TObject);
    procedure iwbAddBoundaryClick(Sender: TObject);
    procedure iwbAddImageClick(Sender: TObject);
    procedure iwbAddWhoForClick(Sender: TObject);
    procedure iwbAddSampleClick(Sender: TObject);
    procedure iwbDeleteReferenceClick(Sender: TObject);
    procedure iwbDeleteLaboratoryClick(Sender: TObject);
    procedure iwbDeleteProvinceClick(Sender: TObject);
    procedure iwbDeleteTerraneClick(Sender: TObject);
    procedure iwbDeleteGroupClick(Sender: TObject);
    procedure iwbDeleteChemTypeClick(Sender: TObject);
    procedure iwbDeleteOrogenicClick(Sender: TObject);
    procedure iwbDeleteBoundaryClick(Sender: TObject);
    procedure iwbDeleteImageClick(Sender: TObject);
    procedure iwbDeleteWhoForClick(Sender: TObject);
    procedure iwbDeleteSampleClick(Sender: TObject);
    procedure iwDBgReferenceColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgValidationColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbValidateClick(Sender: TObject);
    procedure iwDBgProvinceColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgTerraneColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgGroupingColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgChemicalTypeColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgOrogenicPeriodColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgBoundaryColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgImageColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgWhoForColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgSampleColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgSampleColumns3Click(ASender: TObject;
      const AValue: String);
    procedure iwbAddInitialRatioDataClick(Sender: TObject);
    procedure iwbAddStatisticsDataClick(Sender: TObject);
    procedure iwbAddOtherInterceptDataClick(Sender: TObject);
    procedure iwbRawDataClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbObjectionClick(Sender: TObject);
    procedure iwbNewErrorRecClick(Sender: TObject);
    procedure iwbAddLIPClick(Sender: TObject);
    procedure iwbDeleteLIPClick(Sender: TObject);
    procedure iwDBgLIPColumns0Click(ASender: TObject; const AValue: string);
    procedure iwbAddCommentClick(Sender: TObject);
    procedure ShowHideEditButtons;
    procedure iwbLinkRawDataClick(Sender: TObject);
    procedure iwbCreateEquivalentRecordClick(Sender: TObject);
    procedure iwdbgSameSampleResultsColumns0Click(ASender: TObject;
      const AValue: string);
    procedure iwbMakePublicClick(Sender: TObject);
  public
    ISFDetailsEdit: TISFDetailsEdit;
  protected
    UsersOwnData : boolean;
    function Validate : Boolean ;
    procedure ClearErrorMessages ;
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, DVIW_dm, DVIW_frGrid, DVIW_details, DVIW_isolab,
  DVIW_validcheck, DVIW_constants, DVIW_isorefedit, DVIW_isoprovince,
  DVIW_isoterrane, DVIW_isogrouping, DVIW_isoorogenic, DVIW_isoboundary,
  DVIW_isochemtype, DVIW_isoimage, DVIW_isofor, DVIW_smpregedit,
  DVIW_samplegeoedit, DVIW_sampleregdataedit, DVIW_isolipedit, usrIW_dm,
  DB_List_Combo;


function TISFDetailsEdit.Validate: Boolean;
begin
  // need to add code to check responses are acceptable
  // currently just assume everything is okay
  Result := true;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFDetailsEdit.ClearErrorMessages;
begin
  // need to add code as necessary

  //lblMaterialError.Caption := '';
  //lblIsoSystemError.Caption := '';
  //lblApproachError.Caption := '';
  //lblTechniqueError.Caption := '';
  //lblInterpretationError.Caption := '';
  //lblDatesError.Caption := '';
  //lblAgeUnitsError.Caption := '';
end;

procedure TISFDetailsEdit.ShowHideEditButtons;
begin
  UsersOwnData := false;
  dmDV.qCheckUsersOwnRecord.Close;
  dmDV.qCheckUsersOwnRecord.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
  dmDV.qCheckUsersOwnRecord.ParamByName('CaptStatusID').AsString := ValueForCaptured;
  dmDV.cdsCheckUsersOwnRecord.Close;
  dmDV.cdsCheckUsersOwnRecord.Open;
  if (UserSession.UserID = dmDV.cdsCheckUsersOwnRecordDONEBY.AsString)  then UsersOwnData := true;

  iwbAddReference.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteReference.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoRef.RecordCount>0);
  iwbAddLaboratory.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteLaboratory.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoLab.RecordCount>0);
  iwbObjection.Visible := true;
  iwbValidate.Visible := UserSession.CanValidate;
  iwbAddProvince.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteProvince.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsProvince.RecordCount>0);
  iwbAddTerrane.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteTerrane.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsTerrane.RecordCount>0);
  iwbAddGroup.Enabled := (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteGroup.Enabled := (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoGrouping.RecordCount>0);
  iwbAddLIP.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteLIP.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoLIP.RecordCount>0);
  iwbAddChemType.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteChemType.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoChemType.RecordCount>0);
  iwbAddOrogenic.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteOrogenic.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoOrogenic.RecordCount>0);
  iwbAddBoundary.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteBoundary.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoBoundary.RecordCount>0);
  iwbAddImage.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteImage.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoImages.RecordCount>0);
  iwbAddWhoFor.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteWhoFor.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsIsoFor.RecordCount>0);
  iwbAddSample.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  iwbDeleteSample.Enabled := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]) and (dmDV.cdsSmpReg.RecordCount>0);
  iwbCreateEquivalentRecord.Enabled := UserSession.CanInsert and (dmDV.cdsRecordIDs.State in [dsBrowse,dsEdit]) and (dmDV.cdsSmpReg.RecordCount>0);
end;

procedure TISFDetailsEdit.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    iwbReturn.Visible := (dmDV.cdsRecordIDs.State in [dsBrowse]);
    iwbApplyUpdates.Visible := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsEdit,dsInsert]);
    iwbCancelChanges.Visible := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsEdit,dsInsert]);
    iwbEdit.Visible := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
    iwbReturnBottom.Visible := (dmDV.cdsRecordIDs.State in [dsBrowse]);
    iwbApplyUpdatesBottom.Visible := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsEdit,dsInsert]);
    iwbCancelChangesBottom.Visible := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsEdit,dsInsert]);
    iwbEditBottom.Visible := (UsersOwnData or UserSession.CanModify) and (dmDV.cdsRecordIDs.State in [dsBrowse]);
    iwrSameSampleRecords.Visible := UserSession.CanInsert and (dmDV.cdsRecordIDs.State in [dsBrowse,dsEdit]);
  end;
  iwDBeStratDBID.Editable := (UsersOwnData or UserSession.CanModifyPlus) and (dmDV.cdsRecordIDs.State in [dsEdit]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsRecordIDs.State in [dsBrowse]);
  if UserSession.CanModify then
  begin
    if (dmDV.cdsRecordIDs.State in [dsEdit,dsInsert])  then
    begin
      iwDBgWhoFor.Visible := true;
      iwlWhoFor.Visible := true;
      iwdbnWhoFor.Visible := true;
      iwbAddWhoFor.Visible := true;
    end else
      iwDBgWhoFor.Visible := true;
      iwlWhoFor.Visible := true;
      iwdbnWhoFor.Visible := true;
      iwbAddWhoFor.Visible := false;
    begin
    end;
  end else
  begin
    iwDBgWhoFor.Visible := false;
    iwlWhoFor.Visible := false;
    iwdbnWhoFor.Visible := false;
    iwbAddWhoFor.Visible := false;
  end;
  if UserSession.IsDeveloper then
  begin
    iwDBeConfidentiality.Visible := true;
    iwlConfidentiality.Visible := true;
    iwbRawData.Enabled := true;
  end else
  begin
    iwDBeConfidentiality.Visible := false;
    iwlConfidentiality.Visible := false;
    iwbRawData.Enabled := false;
  end;
  try
    iwDBgLaboratory.Visible := (dmDV.cdsIsoLab.RecordCount > 0);
    iwDBgProvince.Visible := (dmDV.cdsProvince.RecordCount > 0);
    iwDBgTerrane.Visible := (dmDV.cdsTerrane.RecordCount > 0);
    iwDBgLIP.Visible := (dmDV.cdsIsoLIP.RecordCount > 0);
    iwDBgGrouping.Visible := (dmDV.cdsIsoGrouping.RecordCount > 0);
    iwDBgChemicalType.Visible := (dmDV.cdsIsoChemType.RecordCount > 0);
    iwDBgOrogenicPeriod.Visible := (dmDV.cdsIsoOrogenic.RecordCount > 0);
    iwDBgBoundary.Visible := (dmDV.cdsIsoBoundary.RecordCount > 0);
    iwDBgImage.Visible := (dmDV.cdsIsoImages.RecordCount > 0);
    iwDBgWhoFor.Visible := (dmDV.cdsIsoFor.RecordCount > 0) and UserSession.CanModify;
    iwDBgSample.Visible := (dmDV.cdsSmpReg.RecordCount > 0);
    iwbValidate.Visible := UserSession.CanValidate;
    if (dmDV.cdsComment.RecordCount > 0) then
    begin
      iwbAddComment.Visible := false;
    end else
    begin
      iwbAddComment.Visible := true;
    end;
    if (dmDV.cdsIsoInit.RecordCount > 0) then
    begin
      iwbAddInitialRatioData.Visible := false;
      iwDBeInitialRatio.Visible := true;
      iwDBeInitialRatioError.Visible := true;
      iwDBeEpsilon.Visible := true;
      iwDBeEpsilonError.Visible := true;
      iwDBeInitialRatio3D.Visible := true;
      iwDBeInitialRatio3DError.Visible := true;
      iwDBeModelUsed.Visible := true;
      iwDBeMu.Visible := true;
      iwDBeMuPError.Visible := true;
      iwDBeMuMError.Visible := true;
    end else
    begin
      iwbAddInitialRatioData.Visible := true;
      iwDBeInitialRatio.Visible := false;
      iwDBeInitialRatioError.Visible := false;
      iwDBeEpsilon.Visible := false;
      iwDBeEpsilonError.Visible := false;
      iwDBeInitialRatio3D.Visible := false;
      iwDBeInitialRatio3DError.Visible := false;
      iwDBeModelUsed.Visible := false;
      iwDBeMu.Visible := false;
      iwDBeMuPError.Visible := false;
      iwDBeMuMError.Visible := false;
    end;
    if (dmDV.cdsIsoStatistics.RecordCount > 0) then
    begin
      iwbAddStatisticsData.Visible := false;
      iwDBeLudwig.Visible := true;
      iwDBeConstraints.Visible := true;
      iwDBeAgeConstrain.Visible := true;
      iwDBeProgName.Visible := true;
      iwDBeXConstrain.Visible := true;
      iwDBeYConstrain.Visible := true;
      iwDBeZConstrain.Visible := true;
      iwDBeXCentroid.Visible := true;
      iwDBeYCentroid.Visible := true;
      iwDBeZCentroid.Visible := true;
      iwDBeProbOfFit.Visible := true;
      iwDBeAlpha.Visible := true;
      iwDBeMSWD.Visible := true;
      iwDBeFcutoff.Visible := true;
      iwDBeDegFree.Visible := true;
      iwDBeNReg.Visible := true;
      iwDBeNSamp.Visible := true;
      iwDBeNRep.Visible := true;
      iwDBeProbConcord.Visible := true;
    end else
    begin
      iwbAddStatisticsData.Visible := true;
      iwDBeLudwig.Visible := false;
      iwDBeConstraints.Visible := false;
      iwDBeAgeConstrain.Visible := false;
      iwDBeProgName.Visible := false;
      iwDBeXConstrain.Visible := false;
      iwDBeYConstrain.Visible := false;
      iwDBeZConstrain.Visible := false;
      iwDBeXCentroid.Visible := false;
      iwDBeYCentroid.Visible := false;
      iwDBeZCentroid.Visible := false;
      iwDBeProbOfFit.Visible := false;
      iwDBeAlpha.Visible := false;
      iwDBeMSWD.Visible := false;
      iwDBeFcutoff.Visible := false;
      iwDBeDegFree.Visible := false;
      iwDBeNReg.Visible := false;
      iwDBeNSamp.Visible := false;
      iwDBeNRep.Visible := false;
      iwDBeProbConcord.Visible := false;
    end;
    if (dmDV.cdsIsoOther.RecordCount > 0) then
    begin
      iwbAddOtherInterceptData.Visible := false;
      iwDBeOtherIntercept.Visible := true;
      iwDBeOtherInterceptPError.Visible := true;
      iwDBeOtherInterceptMError.Visible := true;
      iwDBeAugmentation.Visible := true;
      iwDBeWeighting.Visible := true;
    end else
    begin
      iwbAddOtherInterceptData.Visible := true;
      //iwbAddOtherInterceptData.Visible := UserSession.CanModify;
      iwDBeOtherIntercept.Visible := false;
      iwDBeOtherInterceptPError.Visible := false;
      iwDBeOtherInterceptMError.Visible := false;
      iwDBeAugmentation.Visible := false;
      iwDBeWeighting.Visible := false;
    end;
    if ((dmDV.cdsResultsISOTOPESYSTEM.AsString = 'ArAr') or
        (dmDV.cdsResultsISOTOPESYSTEM.AsString = 'KAr') or
        (dmDV.cdsResultsISOTOPESYSTEM.AsString = 'PbPb') or
        (dmDV.cdsResultsISOTOPESYSTEM.AsString = 'UPb')) then
    begin
      iwlDC2.Visible := true;
      iwlDC2error.Visible := true;
      iwDBeDC2.Visible := true;
      iwDBeDC2error.Visible := true;
    end else
    begin
      iwlDC2.Visible := false;
      iwlDC2error.Visible := false;
      iwDBeDC2.Visible := false;
      iwDBeDC2error.Visible := false;
    end;
  except
  end;
end;

procedure TISFDetailsEdit.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFGrid.Create(WebApplication).Show
  //ISFDetailsEdit.Release;
end;

procedure TISFDetailsEdit.iwbAddLIPClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLIP.Append;
    dmDV.cdsIsoLIPRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoLIPLIPID.AsInteger := 0;
    dmDV.cdsIsoLIP.Post;
    UserSession.ParameterChosen := '0';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoLIPEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked LIP record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteLIPClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLIP.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked LIP record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbPostClick(Sender: TObject);
begin
  dmDV.cdsRecordIDs.Post;
  dmDV.cdsResults.Post;
  dmDV.cdsIsoOther.Post;
  dmDV.cdsIsoStatistics.Post;
  dmDV.cdsResultsExtra.Post;
  dmDV.cdsIsoInit.Post;
  {
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show
  }
end;

procedure TISFDetailsEdit.iwbApplyUpdatesClick(Sender: TObject);
var
  AgeFactor : double;
begin
  try
    dmDV.cdsAgeUnits.Locate('AGEUNITS',dmDV.cdsResultsAGEUNITS.AsString,[]);
    AgeFactor := dmDV.cdsAgeUnitsAGEFACTOR.AsFloat;
    dmDV.cdsResultsIAGE.AsInteger := Round(dmDV.cdsResultsRAGE.AsFloat*AgeFactor);
    dmDV.cdsResultsIAGEPERROR.AsInteger := Round(dmDV.cdsResultsRAGEPERROR.AsFloat*AgeFactor);
    dmDV.cdsResultsIAGEMERROR.AsInteger := Round(dmDV.cdsResultsRAGEMERROR.AsFloat*AgeFactor);
    dmDV.cdsRecordIDs.Post;
  except
  end;
  try
    dmDV.cdsRecordIDs.ApplyUpdates(0);
  except
  end;
  ShowHideEditButtons;
end;

procedure TISFDetailsEdit.IWAppFormCreate(Sender: TObject);
var
  tThisFirstSample : string;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbPost.Visible := false;
  iwbRawData.Enabled := false;
  iwbNewErrorRec.Enabled := false;
  if UserSession.IsDeveloper then
  begin
    iwbPost.Visible := true;
    iwbRawData.Enabled := true;
    iwbNewErrorRec.Enabled := true;
  end;
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usDetailsEdit;
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
    dmDV.cdsRecordIDs.Close;
    dmDV.cdsRecordIDs.Open;
  end;
  iwlFooterProgramName.Caption := Copyright2;
  iwlFooterCopyright.Caption := Copyright1;
  dmDV.ConstructUnitAreaQuery;
  //dmDV.cdsProvinces.Close;
  //dmDV.cdsTerranes.Close;
  //dmDV.cdsGroupingList.Close;
  dmDV.cdsUnitArea.Close;
  dmDV.cdsInterpretations.Open;
  dmDV.cdsAgeUnits.Open;
  dmDV.cdsApproach.Open;
  dmDV.cdsCountries.Open;
  dmDV.cdsLithol.Open;
  dmDV.cdsMaterial.Open;
  dmDV.cdsIsoSystems.Open;
  dmDV.cdsPrefLevels.Open;
  dmDV.cdsTechniques.Open;
  dmDV.cdsMethods.Open;
  //dmDV.cdsSamples.Open;
  dmDV.cdsYesNo.Open;
  dmDV.cdsUnitArea.Open;
  dmDV.cdsSmpReg.First;
  //dmUser.SetDeveloperData('TISFDetailsEdit.IWAppFormCreate - '+UserSession.RecordChosen);
  tThisFirstSample := dmDV.cdsSmpRegSAMPLENO.AsString;
  //dmUser.SetDeveloperData('TISFDetailsEdit.IWAppFormCreate - before - '+tThisFirstSample);
  iwlAgeUnitsNew.Caption := 'Ma';
  iweDate.Text := '';
  iweDatePError.Text := '';
  iweDateMError.Text := '';
  if UserSession.LoggedIn then
  begin
    try
      iweDate.Text := FormatFloat('###0.00',dmDV.cdsResultsRAGE.AsFloat);
      iweDatePError.Text := FormatFloat('###0.00',dmDV.cdsResultsRAGEPERROR.AsFloat);
      iweDateMError.Text := FormatFloat('###0.00',dmDV.cdsResultsRAGEMERROR.AsFloat);
      iwlAgeUnitsNew.Caption := dmDV.cdsResultsAGEUNITS.AsString;
      dmDV.qSameSampleResults.Close;
      dmDV.cdsSameSampleResults.Close;
      dmDV.qSameSampleResults.ParamByName('ThisSample').AsString := tThisFirstSample;
      dmDV.cdsSameSampleResults.Open;
    except
    end;
    if UserSession.CanInsert then
    begin
      try
        UpdateComboBoxValue(iwcbInterpretation,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.NewInterpretationID);
        UpdateComboBoxValue(iwcbMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.NewMaterialID);
        UpdateComboBoxValue(iwcbIsotopeSystem,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.NewIsotopeSystemID);
        UpdateComboBoxValue(iwcbApproach,dmDV.cdsApproach,'ApproachDescription','ApproachAbr',UserSession.NewApproachID);
        UpdateComboBoxValue(iwcbTechnique,dmDV.cdsTechniques,'Technique','TechAbr',UserSession.NewTechniqueID);
        UpdateComboBoxValue(iwcbRating,dmDV.cdsPrefLevels,'PrefShort','PrefLevelNo',UserSession.NewRatingNum);
      except
      end;
    end;
  end;
  //dmUser.SetDeveloperData('TISFDetailsEdit.IWAppFormCreate - after - '+tThisFirstSample);

  ShowHideEditButtons;
end;

procedure TISFDetailsEdit.iwDBgLaboratoryColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;

  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoLab.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgLIPColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoLIPEdit.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsRecordIDs.CancelUpdates;
  except
  end;
  ShowHideEditButtons;
end;

procedure TISFDetailsEdit.iwbCreateEquivalentRecordClick(Sender: TObject);
var
  WasSuccessful : boolean;
  i : integer;
  tRefIDPrimary, tRefIDCited : integer;
  tRefTypePrimary, tRefTypeCited : string;
  tSampleNoNew, tFracNew, tIncludedNew : string;
  tLabIDNew, tWhoForIDNew : string;
begin
  //WebApplication.ShowMessage('Not yet implemented.',smAlert);
  //
  //dmUser.SetDeveloperData('Starting submit for NewRecord');
  GetComboBoxValue(iwcbInterpretation,dmDV.cdsInterpretations,'Interpretation','InterpAbr',UserSession.NewInterpretationID);
  GetComboBoxValue(iwcbMaterial,dmDV.cdsMaterial,'MaterialDescription','MaterialAbr',UserSession.NewMaterialID);
  GetComboBoxValue(iwcbIsotopeSystem,dmDV.cdsIsoSystems,'IsoSystemName','IsoSystem',UserSession.NewIsotopeSystemID);
  GetComboBoxValue(iwcbApproach,dmDV.cdsApproach,'ApproachDescription','ApproachAbr',UserSession.NewApproachID);
  GetComboBoxValue(iwcbTechnique,dmDV.cdsTechniques,'Technique','TechAbr',UserSession.NewTechniqueID);
  GetComboBoxValue(iwcbRating,dmDV.cdsPrefLevels,'PrefShort','PrefLevelNo',UserSession.NewRatingNum);
  //dmUser.SetDeveloperData('Submit InterpAbr = '+UserSession.NewInterpretationID);
  //dmUser.SetDeveloperData('Submit MaterialAbr = '+UserSession.NewMaterialID);
  //dmUser.SetDeveloperData('Submit IsotopeSystem = '+UserSession.NewIsotopeSystemID);
  //dmUser.SetDeveloperData('Submit ApproachAbr = '+UserSession.NewApproachID);
  //dmUser.SetDeveloperData('Submit TechAbr = '+UserSession.NewTechniqueID);

  UserSession.NewAreaID := dmDV.cdsResultsCOUNTRYABR.AsString;
  UserSession.NewLithologyID := dmDV.cdsResultsLITHOLOGY.AsString;
  UserSession.NewUnitID := dmDV.cdsResultsUNITID.AsString;
  UserSession.NewMethodID := 'R';
  UserSession.NewAgeUnit := dmDV.cdsResultsAGEUNITS.AsString;
  if (dmDV.cdsIsoRef.RecordCount > 0) then
  begin
    dmDV.cdsIsoRef.First;
    UserSession.NewReferenceID := dmDV.cdsIsoRefREFNUM.AsString;
    //tRefTypePrimary := dmDV.cdsIsoRefSOURCETYPEID.AsString;
  end;
  {
  if (dmDV.cdsIsoRef.RecordCount > 1) then
  begin
    dmDV.cdsIsoRef.Next;
    tRefIDCited := dmDV.cdsIsoRefREFNUM.AsInteger;
    tRefTypeCited := dmDV.cdsIsoRefSOURCETYPEID.AsString;
  end;
  }
  dmDV.cdsSmpReg.First;
  UserSession.NewSample := dmDV.cdsSmpRegSAMPLENO.AsString;
  UserSession.NewFrac := dmDV.cdsSmpRegFRAC.AsString;
  tIncludedNew := dmDV.cdsSmpRegINCLUDED.AsString;
  UserSession.NewLaboratory := dmDV.cdsIsoLabLABORATORYABR.AsString;
  for i := 1 to dmDV.cdsIsoFor.RecordCount do
  begin
      UserSession.WhoForValues.Strings[i-1] := dmDV.cdsIsoForWHOFORID.AsString;
  end;
  //dmUser.SetDeveloperData('Submit for NewRecord 2');
  if (UserSession.NewRatingNum = '') then UserSession.NewRatingNum := '1';
  if (UserSession.PreferenceLevelValue = '') then UserSession.PreferenceLevelValue := '1';
  //dmUser.SetDeveloperData('Submit for NewRecord 2');
  if Validate then
  begin
    if ((Trim(UserSession.NewLaboratory) = '') or (Trim(UserSession.NewLaboratory) = 'nd')) then UserSession.NewLaboratory := 'nd';
    if ((Trim(UserSession.NewSample) = '') or (Trim(UserSession.NewSample) = 'New')) then Exit;
    UserSession.NewAge := StrToFloat(iweDate.Text);
    UserSession.NewAgePError := StrToFloat(iweDatePError.Text);
    UserSession.NewAgeMError := StrToFloat(iweDateMError.Text);
    dmDV.cdsApproach.Close;
    dmDV.cdsMaterial.Close;
    dmDV.cdsIsoSystems.Close;
    dmDV.cdsTechniques.Close;
    //dmUser.SetDeveloperData('Submit for NewRecord 3');
    dmDV.SubmitNewRecord2(WasSuccessful);
    UserSession.WhereAmI := 'After SubmitNewRecord for equivalent sample';
    if WasSuccessful then
    begin
      WebApplication.ShowMessage('Please be sure to check the decay constant values and uncertainties assumed');
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFDetailsEdit.Create(WebApplication).Show;
    end;
  end;

end;

procedure TISFDetailsEdit.iwbAddReferenceClick(Sender: TObject);
var
  tmpStr1 : string;
  tmpRefNum : integer;
begin
  tmpStr1 := '';
  try
    if (dmDV.cdsIsoRef.RecordCount < 2) then
    begin
      if (dmDV.cdsIsoRef.RecordCount = 1) then
      begin
        tmpStr1 := dmDV.cdsIsoRefSOURCETYPEID.AsString;
      end;
      dmDV.cdsIsoRef.Append;
      dmDV.cdsIsoRefRECORDID.AsString := UserSession.RecordChosen;
      dmDV.cdsIsoRefREFNUM.AsInteger := 1217;
      if (dmDV.cdsIsoRef.RecordCount = 0) then
      begin
        dmDV.cdsIsoRefSOURCETYPEID.AsString := ValueForPrimaryReferenceType;
      end else
      begin
        if (tmpStr1 = ValueForPrimaryReferenceType) then
        begin
          dmDV.cdsIsoRefSOURCETYPEID.AsString := ValueForCitedReferenceType;
        end else
        begin
          dmDV.cdsIsoRefSOURCETYPEID.AsString := ValueForPrimaryReferenceType;
        end;
      end;
      UserSession.ParameterChosen := 'NEW for ' + UserSession.UserID;
      //dmDV.cdsIsoRefSOURCESHORT.AsString := UserSession.ParameterChosen;
      dmDV.cdsIsoRef.Post;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFIsoRefEdit.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('A maximum of 2 linked references is allowed. One as primary and the other as cited.',smAlert);
    end;
  except
    WebApplication.ShowMessage('Not able to insert new linked Reference record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddLaboratoryClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLab.Append;
    dmDV.cdsIsoLabRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoLabLABORATORYABR.AsString := 'NEW';
    dmDV.cdsIsoLab.Post;
    UserSession.ParameterChosen := 'NEW';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoLab.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Laboratory record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddProvinceClick(Sender: TObject);
begin
  try
    dmDV.cdsProvince.Append;
    dmDV.cdsProvinceRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsProvinceDOMAINID.AsInteger := -1;
    dmDV.cdsProvince.Post;
    UserSession.ParameterChosen := '-1';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoProvince.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Province record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddTerraneClick(Sender: TObject);
begin
  try
    dmDV.cdsTerrane.Append;
    dmDV.cdsTerraneRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsTerraneDOMAINID.AsInteger := -1;
    dmDV.cdsTerrane.Post;
    UserSession.ParameterChosen := '-1';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoTerrane.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Terrane record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddGroupClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoGrouping.Append;
    dmDV.cdsIsoGroupingRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoGroupingGROUPING.AsString := 'NEW';
    dmDV.cdsIsoGrouping.Post;
    UserSession.ParameterChosen := 'NEW';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoGrouping.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Group record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddChemTypeClick(Sender: TObject);
begin
  UserSession.RecordChosen := dmDV.cdsRecordIDsRECORDID.AsString;
  try
    dmDV.cdsIsoChemType.Append;
    dmDV.cdsIsoChemTypeRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoChemTypeCHEMTYPEABR.AsString := 'NEW';
    dmDV.cdsIsoChemType.Post;
  except
  end;
  try
    UserSession.ParameterChosen := 'NEW';
    UserSession.UnitSender := usDetailsEdit;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoChemType.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Chem. Assoc. record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddCommentClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  {
  dmDV.cdsComment.Open;
  dmDV.cdsComment.Append;
  dmDV.cdsCommentRECORDID.AsString := UserSession.RecordChosen;
  dmDV.cdsComment.Post;
  try
    dmDV.cdsComment.ApplyUpdates(0);
  except
  end;
  }
  dmDV.AddNewComment(WasSuccessful);
  if (WasSuccessful) then
  begin
    dmDV.cdsRecordIDs.Refresh;
  end;
end;

procedure TISFDetailsEdit.iwbAddOrogenicClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoOrogenic.Append;
    dmDV.cdsIsoOrogenicRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoOrogenicOROGENICPERIODID.AsString := 'NEW';
    dmDV.cdsIsoOrogenic.Post;
    UserSession.ParameterChosen := 'NEW';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoOrogenic.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Orogenic Period record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddBoundaryClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoBoundary.Append;
    dmDV.cdsIsoBoundaryRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoBoundaryBOUNDPOSID.AsString := 'bE';
    dmDV.cdsIsoBoundaryBOUNDARYID.AsInteger := 0;
    dmDV.cdsIsoBoundary.Post;
    UserSession.ParameterChosen := '0';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoBoundary.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Boundary record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddImageClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoImages.Append;
    dmDV.cdsIsoImagesRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoImagesIMAGETYPEID.AsString := 'N';
    dmDV.cdsIsoImagesImageID.AsInteger := 1;
    dmDV.cdsIsoImages.Post;
  except
    WebApplication.ShowMessage('Not able to insert new linked Image record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddWhoForClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoFor.Append;
    dmDV.cdsIsoForRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoForWHOFORID.AsString := 'NEW';
    dmDV.cdsIsoFor.Post;
  except
  end;
  try
    UserSession.ParameterChosen := 'NEW';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoFor.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked WhoFor record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbAddSampleClick(Sender: TObject);
var
  tmpFrac, tmpZoneID,
  tmpSampleNo, tmpIsoSystem : string;
  tmp1, tmp2 : string;
  tmpContinentID : string;
begin
  tmpContinentID := 'UND';
  try
    dmDV.cdsCountries.Lookup('CONTINENTID',dmDV.cdsResultsCOUNTRYABR.AsString,tmpContinentID);
  except
  end;
  //Samples
  dmDV.qSamples.Close;
  dmDV.qSamples.SQL.Clear;
  dmDV.qSamples.SQL.Add('SELECT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR');
  dmDV.qSamples.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
  dmDV.qSamples.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qSamples.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
  dmDV.qSamples.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
  dmDV.qSamples.SQL.Add('AND SMPLOC.COUNTRYABR = '+''''+dmDV.cdsResultsCOUNTRYABR.AsString+'''');
  dmDV.qSamples.SQL.Add('ORDER BY SMPLOC.SAMPLENO,SMPLOC.COUNTRYABR,SMPLOC.CONTINENTID');
  dmDV.cdsSamples.Close;
  dmDV.cdsSamples.Open;
  tmpSampleNo := 'NEW'+UserSession.UserID;
  try
    dmDV.cdsSamples.Append;
    dmDV.cdsSamplesSAMPLENO.AsString := tmpSampleNo;
    dmDV.cdsSamplesCONTINENTID.AsString := tmpContinentID;
    dmDV.cdsSamplesCOUNTRYABR.AsString := dmDV.cdsResultsCOUNTRYABR.AsString;
    dmDV.cdsSamples.Post;
    dmDV.cdsSamples.ApplyUpdates(0);
  except
  end;

  //Samples and Fractions
  dmDV.qSmpFrac.Close;
  dmDV.qSmpFrac.SQL.Clear;
  dmDV.qSmpFrac.SQL.Add('SELECT SMPFRAC.SAMPLENO, SMPFRAC.FRAC,SMPFRAC.ZONEID');
  dmDV.qSmpFrac.SQL.Add('FROM SMPFRAC,SMPLOC,COUNTRY,CONTINENT');
  dmDV.qSmpFrac.SQL.Add('WHERE SMPFRAC.SAMPLENO = SMPLOC.SAMPLENO');
  dmDV.qSmpFrac.SQL.Add('AND CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qSmpFrac.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
  dmDV.qSmpFrac.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
  dmDV.qSmpFrac.SQL.Add('AND SMPLOC.COUNTRYABR = '+''''+dmDV.cdsResultsCOUNTRYABR.AsString+'''');
  dmDV.qSmpFrac.SQL.Add('ORDER BY SMPFRAC.SAMPLENO,SMPFRAC.FRAC,SMPFRAC.ZONEID');
  dmDV.cdsSmpFrac.Close;
  dmDV.cdsSmpFrac.Open;
  tmpFrac := '1';
  tmpZoneID := 'nd';
  try
    dmDV.cdsSmpFrac.Append;
    dmDV.cdsSmpFracSAMPLENO.AsString := tmpSampleNo;
    dmDV.cdsSmpFracFRAC.AsString := tmpFrac;
    dmDV.cdsSmpFracZONEID.AsString := tmpZoneID;
    dmDV.cdsSmpFrac.Post;
    dmDV.cdsSmpFrac.ApplyUpdates(0);
  except
  end;

  tmpIsoSystem := dmDV.cdsResultsISOTOPESYSTEM.AsString;
  try
    dmDV.cdsSmpReg.Append;
    dmDV.cdsSmpRegRECORDID.AsString := Trim(UserSession.RecordChosen);
    dmDV.cdsSmpRegSAMPLENO.AsString := tmpSampleNo;
    dmDV.cdsSmpRegISOSYSTEM.AsString := tmpIsoSystem;
    tmp1 := '1';
    dmDV.cdsSmpRegFRAC.AsString := tmp1;
    tmp2 := 'Y';
    dmDV.cdsSmpRegINCLUDED.AsString := tmp2;
    //WebApplication.ShowMessage('append cdsSmpReg '+dmDV.cdsResultsISOTOPESYSTEM.AsString+' '+Trim(UserSession.RecordChosen));
    dmDV.cdsSmpReg.Post;
    //WebApplication.ShowMessage('5'+' '+Trim(tmpSampleNo));
    dmDV.cdsSamples.Close;
    dmDV.cdsSamples.Open;
    //WebApplication.ShowMessage('ready to edit');
    UserSession.ParameterChosen := tmpSampleNo;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSmpRegEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to insert new linked Sample record',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteReferenceClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoRef.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Reference record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteLaboratoryClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoLab.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Laboratory record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteProvinceClick(Sender: TObject);
begin
  try
    dmDV.cdsProvince.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Province record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteTerraneClick(Sender: TObject);
begin
  try
    dmDV.cdsTerrane.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Terrane record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteGroupClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoGrouping.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Group record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteChemTypeClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoChemType.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Chem. Assoc. record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteOrogenicClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoOrogenic.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Orog. Period record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteBoundaryClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoBoundary.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Boundary record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteImageClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoImages.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Image record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteWhoForClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoFor.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked WhoFor record.',smAlert);
  end;
end;

procedure TISFDetailsEdit.iwbDeleteSampleClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpReg.Delete;
  except
    WebApplication.ShowMessage('Not able to delete linked Sample record.',smAlert);
  end;
  try
    dmDV.cdsSmpReg.ApplyUpdates(0);
  except
  end;
end;

procedure TISFDetailsEdit.iwDBgReferenceColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoRefEdit.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwdbgSameSampleResultsColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.RecordChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgValidationColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  dmDV.cdsIsoValid2.Open;
  dmDV.cdsIsoValid2.Locate('VALIDSTATUSID',UserSession.ParameterChosen,[]);
  dmDV.cdsIsoValid2.Filtered := false;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFValidCheck.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwbValidateClick(Sender: TObject);
var
  HasValidityRecord : boolean;
begin
  HasValidityRecord := false;
  dmDV.cdsIsoValid2.Filter := 'ValidStatusID='+''''+'Valid'+'''';
  dmDV.cdsIsoValid2.Filtered := true;
  if (dmDV.cdsIsoValid2.RecordCount = 1) then
  begin
    HasValidityRecord := true;
  end;
  if (not HasValidityRecord) then
  begin
    HasValidityRecord := false;
    dmDV.cdsIsoValid2.Filter := 'ValidStatusID='+''''+'NotYt'+'''';
    dmDV.cdsIsoValid2.Filtered := true;
    if (dmDV.cdsIsoValid2.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmDV.cdsIsoValid2.Edit;
      dmDV.cdsIsoValid2RECORDID.AsString := UserSession.RecordChosen;
      dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Valid';
      dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
      dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmDV.cdsIsoValid2.Post;
    end;
    dmDV.cdsIsoValid2.Filtered := false;
    dmDV.cdsIsoValid2.Filter := 'ValidStatusID='+''''+'Valid'+'''';
    dmDV.cdsIsoValid2.Filtered := true;
    if (dmDV.cdsIsoValid2.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmDV.cdsIsoValid2.Edit;
      dmDV.cdsIsoValid2RECORDID.AsString := UserSession.RecordChosen;
      dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Valid';
      dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
      dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmDV.cdsIsoValid2.Post;
    end;
    if (not HasValidityRecord) then
    begin
      dmDV.cdsIsoValid2.Append;
      dmDV.cdsIsoValid2RECORDID.AsString := UserSession.RecordChosen;
      dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Valid';
      dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
      dmDV.cdsIsoValid2.Post;
    end;
    UserSession.UnitSender := usDetailsEdit;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFValidCheck.Create(WebApplication).Show;
  end;
end;

procedure TISFDetailsEdit.iwDBgProvinceColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoProvince.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgTerraneColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoTerrane.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgGroupingColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoGrouping.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgChemicalTypeColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoChemType.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgOrogenicPeriodColumns0Click(
  ASender: TObject; const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoOrogenic.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgBoundaryColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoBoundary.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgImageColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoImage.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgWhoForColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFIsoFor.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgSampleColumns0Click(ASender: TObject;
  const AValue: String);
begin
  //ensure that list source for samples point to the correct country
  dmDV.qSamples.Close;
  dmDV.qSamples.SQL.Clear;
  dmDV.qSamples.SQL.Add('SELECT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR');
  dmDV.qSamples.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
  dmDV.qSamples.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qSamples.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
  dmDV.qSamples.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
  dmDV.qSamples.SQL.Add('AND SMPLOC.COUNTRYABR = '+''''+dmDV.cdsResultsCOUNTRYABR.AsString+'''');
  dmDV.qSamples.SQL.Add('ORDER BY SMPLOC.SAMPLENO,SMPLOC.COUNTRYABR,SMPLOC.CONTINENTID');
  dmDV.cdsSamples.Close;
  dmDV.cdsSamples.Open;
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSmpRegEdit.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwDBgSampleColumns3Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSampleGeoEdit.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwbAddInitialRatioDataClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoInit.Open;
    dmDV.cdsIsoInit.Append;
    dmDV.cdsIsoInitRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoInitEPSILONERROR.AsFloat := 0.5;
    dmDV.cdsIsoInit.Post;
  except
  end;
  try
    dmDV.cdsIsoInit.ApplyUpdates(0);
  except
  end;
end;

procedure TISFDetailsEdit.iwbAddStatisticsDataClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoStatistics.Open;
    dmDV.cdsIsoStatistics.Append;
    dmDV.cdsIsoStatisticsRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoStatisticsALPHA.AsFloat := 0.05;
    dmDV.cdsIsoStatisticsNREPLICATES.AsInteger := 999;
    dmDV.cdsIsoStatistics.Post;
  except
  end;
  try
    dmDV.cdsIsoStatistics.ApplyUpdates(0);
  except
  end;
end;

procedure TISFDetailsEdit.iwbAddOtherInterceptDataClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  {
  try
    dmDV.cdsIsoOther.Open;
    dmDV.cdsIsoOther.Append;
    dmDV.cdsIsoOtherRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoOther.Post;
  except
  end;
  try
    dmDV.cdsIsoOther.ApplyUpdates(0);
  except
  end;
  }
  dmDV.AddNewOtherIntercept(WasSuccessful);
  dmDV.cdsIsoOther.Open;
end;

procedure TISFDetailsEdit.iwbRawDataClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  UserSession.UnitSender := usDetailsEdit;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSampleRegDataEdit.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsRecordIDs.Delete;
    dmDV.cdsRecordIDs.ApplyUpdates(0);
  except
  end;
  ShowHideEditButtons;
end;

procedure TISFDetailsEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsRecordIDs.Edit;
  dmDV.cdsResults.Edit;
  dmDV.cdsIsoOther.Edit;
  dmDV.cdsIsoStatistics.Edit;
  dmDV.cdsResultsExtra.Edit;
  dmDV.cdsIsoInit.Edit;
  ShowHideEditButtons;
end;

procedure TISFDetailsEdit.iwbLinkRawDataClick(Sender: TObject);
begin
  {}
end;

procedure TISFDetailsEdit.iwbMakePublicClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoFor.Edit;
    dmDV.cdsIsoForWHOFORID.AsString := ValueForPublished;
    dmDV.cdsIsoFor.Post;
  except
  end;
  try
    dmDV.cdsIsoFor.ApplyUpdates(0);
  except
  end;
end;

procedure TISFDetailsEdit.iwbObjectionClick(Sender: TObject);
begin
  dmDV.cdsIsoValid2.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dmDV.cdsIsoValid2.Filtered := true;
  if (dmDV.cdsIsoValid2.RecordCount = 0) then
  begin
    dmDV.cdsIsoValid2.Append;
    dmDV.cdsIsoValid2RECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Check';
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
    dmDV.cdsIsoValid2.Post;
  end else
  begin
    dmDV.cdsIsoValid2.Edit;
    dmDV.cdsIsoValid2RECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Check';
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2.Post;
  end;
  UserSession.UnitSender := usDetails;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFValidCheck.Create(WebApplication).Show;
end;

procedure TISFDetailsEdit.iwbNewErrorRecClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmDV.AddNewRecordWithDecayconstErrors(WasSuccessful);
end;

end.


