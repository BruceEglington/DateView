unit DVIW_defineSQL;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, DVIW_frTopBar, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWCompMemo;

type
  TISFDefineSQL = class(TIWAppForm)
    iwbSubmit: TIWButton;
    rectLeft: TIWRectangle;
    iwlblError: TIWLabel;
    iwbCancel: TIWButton;
    IWMemo1: TIWMemo;
    iwcbGoDirectToGraphs: TIWCheckBox;
    TopBar: TISFTopBar;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses DVIW_dm, ServerController, DVIW_selectgraph, DVIW_frGrid,
  DVIW_constants, DVIW_uMain, usrIW_dm;

{$R *.dfm}


procedure TISFDefineSQL.IWAppFormCreate(Sender: TObject);
var
  SQLMemoField : string;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlblError.Visible := false;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwMemo1.Text := UserSession.SQLMemoField.Text;
  iwMemo1.Lines.Clear;
  dmUser.GetFormData2(SQLMemoField);
  iwMemo1.Text := SQLMemoField;
end;

procedure TISFDefineSQL.iwbSubmitClick(Sender: TObject);
begin
  if iwcbGoDirectToGraphs.Checked then UserSession.GoDirectTographs := true
                                  else UserSession.GoDirectTographs := false;
  UserSession.DataHaveChanged := true;
  UserSession.PDFHasChanged := true;
  if Validate then
  begin
    try
      //UserSession.SQLMemoField.Text := iwMemo1.Text;
      dmDV.SubmitSQL1(iwMemo1.Text);
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      if UserSession.GoDirectTographs then TISFSelectGraph.Create(WebApplication).Show
                                      else TISFGrid.Create(WebApplication).Show;
    except
      WebApplication.ShowMessage('Not able to implement SQL query');
    end;
  end;
end;

function TISFDefineSQL.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFDefineSQL.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
