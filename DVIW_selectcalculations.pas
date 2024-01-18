unit DVIW_selectcalculations;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWCompButton,
  IWCompCheckbox, IWCompLabel, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, IWCompListbox, IWCompRectangle;

type
  TISFSelectCalculations = class(TIWAppForm)
    iwrgCalculationType: TIWRadioGroup;
    IWLabel1: TIWLabel;
    iwbSubmitCalculationSelection: TIWButton;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitCalculationSelectionClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, DVIW_constants, DVIW_dmgraphics, DVIW_dm,
  DVIW_chartwtaverage;

{$R *.dfm}


procedure TISFSelectCalculations.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFSelectCalculations.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFSelectCalculations.iwbSubmitCalculationSelectionClick(Sender: TObject);
var
  AllOkay : boolean;
begin
  AllOkay := true;
  dmgDV.cdsQuerydm.Close;
  dmgDV.cdsTempDataMap.Close;
  dmgDV.cdsTempDataDI.Close;
  dmgDV.cdsTempDataDT.Close;
  dmgDV.cdsTempDataDG.Close;
  dmgDV.cdsTempDataI.Close;
  case iwrgCalculationType.ItemIndex of
    0 : begin
      UserSession.GraphType := gtWeightedAverage;
    end;
    1 : begin
      UserSession.GraphType := gtPalaeoReconstruction;
    end;
  end;
  if iwrgCalculationType.ItemIndex in [0] then
  begin
    if AllOkay then
    begin
      dmgDV.cdsTempDataDI.Open;
      dmgDV.AllocateDataByInterpretation2;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TIWChartWtAverage.Create(WebApplication).Show;
    end;
  end;
  if iwrgCalculationType.ItemIndex in [1] then
  begin
    AllOkay := UserSession.IsDeveloper;
    if AllOkay then
    begin
      //UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      //TIWAppForm(WebApplication.ActiveForm).Release;
      //TISFSelectPlates.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('This option is under development');
    end;
  end;
end;

end.







