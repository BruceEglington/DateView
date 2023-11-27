object ISFRefDetails: TISFRefDetails
  Left = 0
  Top = 0
  Width = 946
  Height = 641
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
  object iwDBeSourceID: TIWDBEdit
    Left = 242
    Top = 197
    Width = 659
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = True
    DataField = 'SOURCESHORT'
    DataSource = dmStrat.dsRefFull
    PasswordPrompt = False
  end
  object iwDBlcbContinent: TIWDBLookupComboBox
    Left = 242
    Top = 224
    Width = 365
    Height = 21
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    UseSize = False
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 3
    AutoEditable = True
    DataField = 'CONTINENTID'
    DataSource = dmStrat.dsRefFull
    FriendlyName = 'iwDBlcbContinent'
    KeyField = 'CONTINENTID'
    ListField = 'CONTINENT'
    ListSource = dmStrat.dsContinents
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwDBmRefDetail: TIWDBMemo
    Left = 242
    Top = 251
    Width = 659
    Height = 148
    StyleRenderOptions.RenderBorder = False
    BGColor = clWebWHITE
    Editable = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 5
    SubmitOnAsyncEvent = True
    AutoEditable = True
    DataField = 'SOURCEDESCRIPTION'
    DataSource = dmStrat.dsRefFull
    FriendlyName = 'iwDBmRefDetail'
  end
  object IWLabel1: TIWLabel
    Left = 103
    Top = 198
    Width = 106
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Reference (Short)'
  end
  object IWLabel2: TIWLabel
    Left = 103
    Top = 228
    Width = 44
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Region'
  end
  object IWLabel3: TIWLabel
    Left = 103
    Top = 256
    Width = 88
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'Full Reference'
  end
  object iwbCancelChanges: TIWButton
    Left = 432
    Top = 82
    Width = 104
    Height = 25
    Caption = 'Cancel Updates'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelChanges'
    TabOrder = 10
    OnClick = iwbCancelChangesClick
  end
  object iwbApplyUpdates: TIWButton
    Left = 322
    Top = 82
    Width = 104
    Height = 25
    Caption = 'Apply Updates'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbApplyUpdates'
    TabOrder = 8
    OnClick = iwbApplyUpdatesClick
  end
  object iwbReturn: TIWButton
    Left = 102
    Top = 82
    Width = 104
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 9
    OnClick = iwbReturnClick
  end
  object iwbDeleteReference: TIWButton
    Left = 542
    Top = 82
    Width = 145
    Height = 25
    Caption = 'Delete Current Record'
    Confirmation = 'Are you sure you want to delete this reference?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDeleteReference'
    TabOrder = 11
    OnClick = iwbDeleteReferenceClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 586
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitHeight = 401
  end
  object iwbEdit: TIWButton
    Left = 212
    Top = 82
    Width = 104
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    OnClick = iwbEditClick
  end
  object IWLabel4: TIWLabel
    Left = 103
    Top = 138
    Width = 79
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Reference ID'
  end
  object IWDBEdit1: TIWDBEdit
    Left = 242
    Top = 138
    Width = 67
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
    TabOrder = 12
    AutoEditable = False
    DataField = 'SOURCENUM'
    DataSource = dmStrat.dsRefFull
    PasswordPrompt = False
  end
  object IWLabel5: TIWLabel
    Left = 103
    Top = 172
    Width = 97
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Publication Year'
  end
  object IWDBEdit2: TIWDBEdit
    Left = 242
    Top = 170
    Width = 67
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
    TabOrder = 1
    AutoEditable = True
    DataField = 'SOURCEYEAR'
    DataSource = dmStrat.dsRefFull
    PasswordPrompt = False
  end
  object IWLabel6: TIWLabel
    Left = 103
    Top = 410
    Width = 33
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'D.O.I.'
  end
  object IWDBEdit3: TIWDBEdit
    Left = 242
    Top = 410
    Width = 571
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = True
    DataField = 'DOI'
    DataSource = dmStrat.dsRefFull
    PasswordPrompt = False
  end
  object IWLabel7: TIWLabel
    Left = 103
    Top = 437
    Width = 50
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Who For'
  end
  object iwDBlcbWhoFor: TIWDBLookupComboBox
    Left = 242
    Top = 437
    Width = 365
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 7
    AutoEditable = True
    DataField = 'WHOFORID'
    DataSource = dmStrat.dsRefFull
    FriendlyName = 'iwDBlcbWhoFor'
    KeyField = 'WHOFORID'
    ListField = 'WHOFOR'
    ListSource = dmStrat.dsUsersWhoFor
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbCopyRefShort: TIWButton
    Left = 723
    Top = 224
    Width = 178
    Height = 25
    Caption = 'Copy Ref (short) to Full'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbCopyRefShort'
    TabOrder = 4
    OnClick = iwbCopyRefShortClick
  end
  object IWMemoASCIIwarning: TIWMemo
    Left = 242
    Top = 520
    Width = 659
    Height = 89
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = False
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = True
    HorizScrollBar = False
    VertScrollBar = False
    Required = False
    SubmitOnAsyncEvent = False
    FriendlyName = 'IWMemoASCIIwarning'
    Lines.Strings = (
      
        'NOTE: StratDB and DateView can handle only ASCII/ANSI characters' +
        ' at this stage. Please ensure that all non-ANSI characters are r' +
        'eplaced by ASCII/ANSI ones during data entry.')
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 946
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
    ExplicitWidth = 946
    inherited IWFrameRegion: TIWRegion
      Width = 946
      TabOrder = 13
      ExplicitWidth = 946
      inherited iwrHeader: TIWRegion
        Width = 946
        ExplicitWidth = 946
        inherited iwrWelcome: TIWRegion
          Width = 946
          ExplicitWidth = 946
          inherited iwrDisplayUserName: TIWRegion
            Width = 805
            ExplicitWidth = 805
            inherited lblWelcome: TIWLabel
              Left = 484
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 946
          ExplicitWidth = 946
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
