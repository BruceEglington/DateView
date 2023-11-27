unit DVIW_LIPs;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFLIPs = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1LIPID: TStringField;
    FDMemTable1LIPName: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddNewClick(Sender: TObject);
    procedure iwDBgColumns0Click(ASender: TObject; const AValue: String);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_uMain,
  DVIW_constants;

procedure TISFLIPs.IWAppFormCreate(Sender: TObject);
//var
  //i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbApplyUpdates.Visible := UserSession.CanModify;
  iwbCancelupdates.Visible := UserSession.CanModify;
  iwbAddNew.Visible := UserSession.CanModify;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsLIPS.Close;
  dmDV.cdsLIPS.Open;
end;

procedure TISFLIPs.IWAppFormRender(Sender: TObject);
begin
  iwlPrevPage.Visible := (dmDV.cdsLIPs.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsLIPs.RecordCount > iwDBg.RowLimit);
  iwbApplyUpdates.Enabled := UserSession.CanModify and (dmDV.cdsLIPs.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Enabled := UserSession.CanModify and (dmDV.cdsLIPs.State in [dsEdit,dsInsert]);
  //iwbDelete.Enabled := UserSession.CanDelete and (dmDV.cdsLIPs.State in [dsBrowse]);
end;

procedure TISFLIPs.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsLIPs.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPs.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsLIPs.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFLIPs.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsLIPs.MoveBy(iwDBg.RowLimit);
end;

procedure TISFLIPs.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsLIPs.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFLIPs.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmDV.cdsLIPS.First;
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsLIPsLIPID.AsVariant,dmDV.cdsLIPsLIPNAME.AsVariant]);
    dmDV.cdsLIPs.Next;
  until dmDV.cdsLIPs.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxLIPs.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxLIPs.xlsx';
  frFileNameStr := 'LIPs.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTable1',FDMemTable1);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFLIPs.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsLIPs.ApplyUpdates(0);
  except
  end;
end;

procedure TISFLIPs.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsLIPs.CancelUpdates;
  except
  end;
end;

procedure TISFLIPs.iwbAddNewClick(Sender: TObject);
begin
  try
    dmDV.cdsLIPs.Append;
    dmDV.cdsLIPsLIPID.AsInteger := -1;
    dmDV.cdsLIPsLIPNAME.AsString := 'NEW'+UserSession.UserID;
    dmDV.cdsLIPs.Post;
  except
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
  try
    UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFLIPEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new LIP',smAlert);
  end;
end;

procedure TISFLIPs.iwDBgColumns0Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFLIPEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
