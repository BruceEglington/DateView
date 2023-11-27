unit DVIW_sampleregdataedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion, IWHTML40Container;

type
  TISFSampleRegDataEdit = class(TIWAppForm)
    TopBar: TISFTopBar;
    IWRegionAll: TIWRegion;
    IWRegionReturn: TIWRegion;
    iwbReturn: TIWButton;
    IWDBNavigator2: TIWDBNavigator;
    IWRegionGrid: TIWRegion;
    iwDBgSample: TIWDBGrid;
    IWRegionData: TIWRegion;
    IWLabel1: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    IWLabel10: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    IWLabel11: TIWLabel;
    IWDBEdit9: TIWDBEdit;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWLabel12: TIWLabel;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWDBEdit18: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWDBEdit10: TIWDBEdit;
    iwDBlcbSmpDataX: TIWDBLookupComboBox;
    IWDBEdit5: TIWDBEdit;
    IWDBEdit16: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit7: TIWDBEdit;
    IWDBEdit17: TIWDBEdit;
    IWDBEdit11: TIWDBEdit;
    iwDBlcbSmpDataY: TIWDBLookupComboBox;
    IWDBEdit12: TIWDBEdit;
    IWDBEdit13: TIWDBEdit;
    IWDBEdit19: TIWDBEdit;
    IWDBEdit15: TIWDBEdit;
    IWDBEdit14: TIWDBEdit;
    IWDBEdit6: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    iwDBlcbErrTypX: TIWDBLookupComboBox;
    iwDBlcbErrTypY: TIWDBLookupComboBox;
    IWDBEdit20: TIWDBEdit;
    IWDBEdit21: TIWDBEdit;
    IWDBEdit22: TIWDBEdit;
    IWDBEdit23: TIWDBEdit;
    iwDBlcbSmpDataZ: TIWDBLookupComboBox;
    IWDBEdit24: TIWDBEdit;
    IWDBEdit25: TIWDBEdit;
    IWDBEdit26: TIWDBEdit;
    iwDBlcbErrTypZ: TIWDBLookupComboBox;
    IWRegion3: TIWRegion;
    iwbEdit: TIWButton;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDeleteSample: TIWButton;
    IWRegion1: TIWRegion;
    iwbDeleteSmpReg: TIWButton;
    IWLabel9: TIWLabel;
    IWDBEdit27: TIWDBEdit;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteSampleClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteSmpRegClick(Sender: TObject);
    procedure IWDBNavigator2Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, DVIW_detailsedit, DVIW_dmdata, DVIW_dm;




procedure TISFSampleRegDataEdit.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    iwbReturn.Visible := (dmdDV.cdsQdmSmp.State in [dsBrowse]);
    iwbSaveChanges.Visible := UserSession.CanModify and (dmdDV.cdsQdmSmp.State in [dsEdit,dsInsert]);
    iwbCancelChanges.Visible := UserSession.CanModify and (dmdDV.cdsQdmSmp.State in [dsEdit,dsInsert]);
    iwbEdit.Visible := UserSession.CanModify and (dmdDV.cdsQdmSmp.State in [dsBrowse]);
    iwbDeleteSample.Visible := UserSession.CanDelete and (dmdDV.cdsQdmSmp.State in [dsBrowse]);
    iwbDeleteSmpReg.Visible := UserSession.CanDelete and (dmdDV.cdsQdmSmp.State in [dsBrowse]);
    //iwbDeleteSample.Visible := false;
  end;
end;

procedure TISFSampleRegDataEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmdDV.QdmSmp.Close;
  dmdDV.QdmSmp.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
  dmdDV.cdsQdmSmp.Close;
  dmdDV.cdsQdmSmp.Open;
  dmdDV.cdsStandards.Open;
  dmdDV.cdsErrTypes.Open;
end;

procedure TISFSampleRegDataEdit.iwbReturnClick(Sender: TObject);
begin
  dmdDV.cdsErrTypes.Close;
  dmdDV.cdsStandards.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFSampleRegDataEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmdDV.cdsQdmSmp.Post;
  except
  end;
  try
    dmdDV.cdsQdmSmp.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFSampleRegDataEdit.IWDBNavigator2Click(Sender: TObject);
begin
  dmdDV.qSmpDataX.Close;
  dmdDV.qSmpDataY.Close;
  dmdDV.qSmpDataZ.Close;
  dmdDV.qSmpDataXerr.Close;
  dmdDV.qSmpDataYerr.Close;
  dmdDV.qSmpDataZerr.Close;
  dmdDV.qSmpDataPrecX.Close;
  dmdDV.qSmpDataPrecY.Close;
  dmdDV.qSmpDataPrecZ.Close;
  dmdDV.qStandardValueX.Close;
  dmdDV.qStandardValueY.Close;
  dmdDV.qStandardValueZ.Close;
  dmdDV.qNormalisedValueX.Close;
  dmdDV.qNormalisedValueY.Close;
  dmdDV.qNormalisedValueZ.Close;
  dmdDV.qSmpDataR.Close;
  dmdDV.qErrTypeX.Close;
  dmdDV.qErrTypeY.Close;
  dmdDV.qErrTypeZ.Close;
  dmdDV.cdsSmpDataX.Close;
  dmdDV.cdsSmpDataY.Close;
  dmdDV.cdsSmpDataZ.Close;
  dmdDV.cdsSmpDataXerr.Close;
  dmdDV.cdsSmpDataYerr.Close;
  dmdDV.cdsSmpDataZerr.Close;
  dmdDV.cdsSmpDataPrecX.Close;
  dmdDV.cdsSmpDataPrecY.Close;
  dmdDV.cdsSmpDataPrecZ.Close;
  dmdDV.cdsAcceptedValueX.Close;
  dmdDV.cdsAcceptedValueY.Close;
  dmdDV.cdsAcceptedValueZ.Close;
  dmdDV.cdsNormalisedValueX.Close;
  dmdDV.cdsNormalisedValueY.Close;
  dmdDV.cdsNormalisedValueZ.Close;
  dmdDV.cdsSmpDataR.Close;
  dmdDV.cdsErrTypeX.Close;
  dmdDV.cdsErrTypeY.Close;
  dmdDV.cdsErrTypeZ.Close;
  dmdDV.cdsSmpDataX.Open;
  dmdDV.cdsSmpDataY.Open;
  dmdDV.cdsSmpDataZ.Open;
  dmdDV.cdsSmpDataXerr.Open;
  dmdDV.cdsSmpDataYerr.Open;
  dmdDV.cdsSmpDataZerr.Open;
  dmdDV.cdsSmpDataPrecX.Open;
  dmdDV.cdsSmpDataPrecY.Open;
  dmdDV.cdsSmpDataPrecZ.Open;
  dmdDV.cdsAcceptedValueX.Open;
  dmdDV.cdsAcceptedValueY.Open;
  dmdDV.cdsAcceptedValueZ.Open;
  dmdDV.cdsNormalisedValueX.Open;
  dmdDV.cdsNormalisedValueY.Open;
  dmdDV.cdsNormalisedValueZ.Open;
  dmdDV.cdsSmpDataR.Open;
  dmdDV.cdsErrTypeX.Open;
  dmdDV.cdsErrTypeY.Open;
  dmdDV.cdsErrTypeZ.Open;
end;

procedure TISFSampleRegDataEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmdDV.cdsQdmSmp.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFSampleRegDataEdit.iwbDeleteSampleClick(Sender: TObject);
begin
  // need to carefully assess what might be deleted here
  {
  try
    dmdDV.cdsQdmSmp.Delete;
    dmdDV.cdsQdmSmp.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
  }
end;

procedure TISFSampleRegDataEdit.iwbDeleteSmpRegClick(Sender: TObject);
begin
  try
    dmdDV.cdsQdmSmp.Delete;
    dmdDV.cdsQdmSmp.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete link',smAlert);
  end;
end;

procedure TISFSampleRegDataEdit.iwbEditClick(Sender: TObject);
begin
  //dmdDV.cdsQdmSmp.Edit;
  dmdDV.cdsSmpDataX.Edit;
  dmdDV.cdsSmpDataY.Edit;
  dmdDV.cdsSmpDataXerr.Edit;
  dmdDV.cdsSmpDataYerr.Edit;
  dmdDV.cdsErrTypeX.Edit;
  dmdDV.cdsErrTypeY.Edit;
  dmdDV.cdsAcceptedValueX.Edit;
  dmdDV.cdsAcceptedValueY.Edit;
  dmdDV.cdsSmpDataPrecX.Edit;
  dmdDV.cdsSmpDataPrecY.Edit;
  dmdDV.cdsSmpDataR.Edit;
end;

end.
