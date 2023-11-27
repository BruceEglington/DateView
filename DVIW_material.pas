unit DVIW_material;

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
  TISFMaterial = class(TIWAppForm)
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
    FDMemTable1MaterialID: TStringField;
    FDMemTable1Material: TStringField;
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
  ServerController, DBClient, DVIW_dm, DVIW_uMain, DVIW_materialedit,
  DVIW_constants;

procedure TISFMaterial.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbApplyUpdates.Visible := UserSession.CanModify;
  iwbCancelupdates.Visible := UserSession.CanModify;
  iwbAddNew.Visible := UserSession.CanModify;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsMaterial.Open;
end;

procedure TISFMaterial.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsMaterial.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsMaterial.RecordCount > iwDBg.RowLimit);
end;

procedure TISFMaterial.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsMaterial.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFMaterial.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsMaterial.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFMaterial.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsMaterial.MoveBy(iwDBg.RowLimit);
end;

procedure TISFMaterial.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsMaterial.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFMaterial.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmDV.cdsMaterial.First;
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsMaterialMATERIALABR.AsVariant,dmDV.cdsMaterialMATERIALDESCRIPTION.AsVariant]);
    dmDV.cdsMaterial.Next;
  until dmDV.cdsMaterial.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxMaterial.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxMaterial.xlsx';
  frFileNameStr := 'Material Analysed.xlsx';
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

procedure TISFMaterial.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsMaterial.ApplyUpdates(0);
  except
  end;
end;

procedure TISFMaterial.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsMaterial.CancelUpdates;
  except
  end;
end;

procedure TISFMaterial.iwbAddNewClick(Sender: TObject);
begin
  try
    dmDV.cdsMaterial.Append;
    dmDV.cdsMaterialMATERIALABR.AsString := 'NEW'+UserSession.UserID;
    dmDV.cdsMaterialMATERIALDESCRIPTION.AsString := 'NEW'+UserSession.UserID;
    dmDV.cdsMaterial.Post;
    UserSession.ParameterChosen := dmDV.cdsMaterialMATERIALABR.AsString;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMaterialEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
end;

procedure TISFMaterial.iwDBgColumns1Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMaterialEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
