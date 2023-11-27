object ISFIsoImage: TISFIsoImage
  Left = 0
  Top = 0
  Width = 706
  Height = 554
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
    Left = 227
    Top = 70
    Width = 108
    Height = 31
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmDV.dsImageDetails
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object iwbReturn: TIWButton
    Left = 5
    Top = 74
    Width = 94
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 1
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 8
    Top = 110
    Width = 66
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Image type'
  end
  object iwbSaveChanges: TIWButton
    Left = 347
    Top = 74
    Width = 94
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 7
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    Left = 461
    Top = 74
    Width = 94
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 6
    OnClick = iwbCancelChangesClick
  end
  object iwbDelete: TIWButton
    Left = 576
    Top = 73
    Width = 94
    Height = 25
    Caption = 'Delete link'
    Confirmation = 'Are you sure you want to delete this link?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDelete'
    TabOrder = 5
    OnClick = iwbDeleteClick
  end
  object iwDBlcb: TIWDBLookupComboBox
    Left = 88
    Top = 108
    Width = 341
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 2
    AutoEditable = True
    DataField = 'IMAGETYPEID'
    DataSource = dmDV.dsImageDetails
    FriendlyName = 'iwDBlcb'
    KeyField = 'IMAGETYPEID'
    ListField = 'IMAGETYPE'
    ListSource = dmDV.dsImageTypes
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwDBgrid: TIWDBGrid
    Left = 6
    Top = 168
    Width = 185
    Height = 377
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
    UseSize = True
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
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'IMAGETYPEID'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Image Type ID'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'IMAGEID'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Image ID'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmDV.dsImageDetails
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
  object IWDBEdit1: TIWDBEdit
    Left = 90
    Top = 136
    Width = 41
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = True
    DataField = 'IMAGEID'
    DataSource = dmDV.dsImageDetails
    PasswordPrompt = False
  end
  object IWLabel2: TIWLabel
    Left = 8
    Top = 138
    Width = 55
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Image ID'
  end
  object IWDBMemo1: TIWDBMemo
    Left = 208
    Top = 136
    Width = 485
    Height = 121
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 4
    SubmitOnAsyncEvent = True
    AutoEditable = True
    DataField = 'IMAGECAPTION'
    DataSource = dmDV.dsImageDetails
    FriendlyName = 'IWDBMemo1'
  end
  object IWLabel3: TIWLabel
    Left = 612
    Top = 116
    Width = 88
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Image caption'
  end
  object IWDBImage1: TIWDBImage
    Left = 206
    Top = 262
    Width = 489
    Height = 285
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    BorderOptions.Width = 0
    UseSize = False
    FriendlyName = 'IWDBImage1'
    DataField = 'IMAGE'
    DataSource = dmDV.dsImageDetails
  end
  object iwbEdit: TIWButton
    Left = 119
    Top = 74
    Width = 94
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    TabOrder = 8
    OnClick = iwbEditClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 706
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
    ExplicitWidth = 706
    inherited IWFrameRegion: TIWRegion
      Width = 706
      TabOrder = 9
      ExplicitWidth = 706
      inherited iwrHeader: TIWRegion
        Width = 706
        ExplicitWidth = 706
        inherited iwrWelcome: TIWRegion
          Width = 706
          ExplicitWidth = 706
          inherited iwrDisplayUserName: TIWRegion
            Width = 565
            ExplicitWidth = 565
            inherited lblWelcome: TIWLabel
              Left = 244
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 706
          ExplicitWidth = 706
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
