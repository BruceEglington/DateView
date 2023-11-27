unit DVIW_methods;

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
  TISFMethods = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1ApproachID: TStringField;
    FDMemTable1ApproachDescription: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_uMain, DVIW_constants;

procedure TISFMethods.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsMethods.Open;
end;

procedure TISFMethods.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsMethods.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsMethods.RecordCount > iwDBg.RowLimit);
end;

procedure TISFMethods.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsMethods.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFMethods.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsMethods.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFMethods.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsMethods.MoveBy(iwDBg.RowLimit);
end;

procedure TISFMethods.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsMethods.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFMethods.iwbDownloadClick(Sender: TObject);
  var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmDV.cdsMethods.First;
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsMethodsMETHODABR.AsVariant,dmDV.cdsMethodsMETHODNAME.AsVariant]);
    dmDV.cdsMethods.Next;
  until dmDV.cdsMethods.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxMethods.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxMethods.xlsx';
  frFileNameStr := 'Methods.xlsx';
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

end.
