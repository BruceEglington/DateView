object ISFIsoGrouping: TISFIsoGrouping
  Left = 0
  Top = 0
  Width = 716
  Height = 415
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWDBNavigator1: TIWDBNavigator
    AlignWithMargins = False
    Left = 229
    Top = 72
    Width = 108
    Height = 29
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmDV.dsIsoGrouping
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object iwbReturn: TIWButton
    AlignWithMargins = False
    Left = 5
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbReturn'
    TabOrder = 1
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 122
    Width = 56
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Grouping'
  end
  object iwbSaveChanges: TIWButton
    AlignWithMargins = False
    Left = 347
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 4
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    AlignWithMargins = False
    Left = 461
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 5
    OnClick = iwbCancelChangesClick
  end
  object iwbDelete: TIWButton
    AlignWithMargins = False
    Left = 576
    Top = 73
    Width = 98
    Height = 25
    Caption = 'Delete link'
    Confirmation = 'Are you sure you want to delete this link?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbDelete'
    TabOrder = 3
    OnClick = iwbDeleteClick
  end
  object iwDBlcb: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 136
    Top = 120
    Width = 341
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 2
    AutoEditable = True
    DataField = 'GROUPING'
    DataSource = dmDV.dsIsoGrouping
    FriendlyName = 'iwDBlcb'
    KeyField = 'GROUPING'
    ListField = 'GROUPING'
    ListSource = dmDV.dsGroupingList
    DisableWhenEmpty = True
  end
  object iwDBgrid: TIWDBGrid
    AlignWithMargins = False
    Left = 30
    Top = 170
    Width = 595
    Height = 221
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
    UseSize = True
    ShowEmptyCells = True
    ShowInvisibleRows = True
    ScrollToCurrentRow = False
    Columns = <
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'GROUPING'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Font.PxSize = 10
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Grouping'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmDV.dsIsoGrouping
    FooterRowCount = 0
    FriendlyName = 'iwDBgrid'
    FromStart = True
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgIndicator, dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 0
    RollOver = True
    RowClick = False
    RollOverColor = clWebPALEGOLDENROD
    RowHeaderColor = clWebLIGHTSTEELBLUE
    RowAlternateColor = clNone
    RowCurrentColor = clWebYELLOW
  end
  object iwbEdit: TIWButton
    AlignWithMargins = False
    Left = 119
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbEdit'
    TabOrder = 6
    OnClick = iwbEditClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 716
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 55
    Constraints.MinHeight = 55
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 716
    inherited IWFrameRegion: TIWRegion
      Width = 716
      TabOrder = 7
      ExplicitWidth = 716
      inherited iwrHeader: TIWRegion
        Width = 716
        ExplicitWidth = 716
        inherited iwrWelcome: TIWRegion
          Width = 716
          ExplicitWidth = 716
          inherited iwrDisplayUserName: TIWRegion
            Width = 575
            ExplicitWidth = 575
            inherited lblWelcome: TIWLabel
              Left = 254
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 716
          ExplicitWidth = 716
        end
      end
    end
  end
end
