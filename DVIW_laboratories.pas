unit DVIW_laboratories;

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
  TISFLaboratories = class(TIWAppForm)
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
    FDMemTable1LabID: TStringField;
    FDMemTable1Laboratory: TStringField;
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
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: String);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_uMain, DVIW_labedit,
  DVIW_constants;




procedure TISFLaboratories.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbApplyUpdates.Visible := UserSession.CanModify;
  iwbCancelupdates.Visible := UserSession.CanModify;
  iwbAddNew.Visible := UserSession.CanModify;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsLaboratories.Open;
end;

procedure TISFLaboratories.IWAppFormRender(Sender: TObject);
begin
  iwlPrevPage.Visible := (dmDV.cdsLaboratories.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsLaboratories.RecordCount > iwDBg.RowLimit);
end;

procedure TISFLaboratories.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsLaboratories.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLaboratories.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsLaboratories.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFLaboratories.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsLaboratories.MoveBy(iwDBg.RowLimit);
end;

procedure TISFLaboratories.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsLaboratories.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFLaboratories.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmDV.cdsLaboratories.First;
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  dmDV.cdsLaboratories.First;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsLaboratoriesLABORATORYABR.AsVariant,dmDV.cdsLaboratoriesLABORATORYNAME.AsVariant]);
    dmDV.cdsLaboratories.Next;
  until dmDV.cdsLaboratories.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxLaboratories.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxLaboratories.xlsx';
  frFileNameStr := 'Laboratories.xlsx';
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

procedure TISFLaboratories.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsLaboratories.ApplyUpdates(0);
  except
  end;
end;

procedure TISFLaboratories.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsLaboratories.CancelUpdates;
  except
  end;
end;

procedure TISFLaboratories.iwbAddNewClick(Sender: TObject);
begin
  try
    dmDV.cdsLaboratories.Append;
    dmDV.cdsLaboratoriesLABORATORYABR.AsString := 'NEW'+UserSession.UserID;
    dmDV.cdsLaboratoriesLABORATORYNAME.AsString := 'NEW'+UserSession.UserID;
    dmDV.cdsLaboratories.Post;
    UserSession.ParameterChosen := dmDV.cdsLaboratoriesLABORATORYABR.AsString;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLabEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
end;

procedure TISFLaboratories.iwDBgColumns1Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLabEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
