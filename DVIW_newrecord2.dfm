object ISFNewRecord2: TISFNewRecord2
  Left = 0
  Top = 0
  Width = 689
  Height = 408
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define query'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwbNextStageOfQuery: TIWButton
    Left = 95
    Top = 75
    Width = 200
    Height = 25
    Caption = 'Proceed to next step'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbNextStageOfQuery'
    OnClick = iwbNextStageOfQueryClick
  end
  object iwcbArea: TIWComboBox
    Left = 95
    Top = 150
    Width = 310
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 1
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbArea'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel1: TIWLabel
    Left = 95
    Top = 128
    Width = 29
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Area'
  end
  object IWText1: TIWText
    Left = 422
    Top = 126
    Width = 247
    Height = 67
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      'Specify the Area within which the new '
      'record and samples are located. Note that '
      'the value specified here will influence '
      'subsequent lists.')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 353
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
    ExplicitHeight = 195
  end
  object iwbCancel: TIWButton
    Left = 335
    Top = 75
    Width = 200
    Height = 25
    Caption = 'Cancel'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancel'
    TabOrder = 12
    OnClick = iwbCancelClick
  end
  object iweUnitTo: TIWEdit
    Left = 320
    Top = 256
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweUnitTo'
    SubmitOnAsyncEvent = True
    TabOrder = 3
    Text = 'zz'
  end
  object iweUnitFrom: TIWEdit
    Left = 216
    Top = 256
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweUnitFrom'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    Text = 'A'
  end
  object IWLabel10: TIWLabel
    Left = 101
    Top = 259
    Width = 94
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Strat. Unit from'
  end
  object IWLabel2: TIWLabel
    Left = 296
    Top = 259
    Width = 12
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'to'
  end
  object IWLabel3: TIWLabel
    Left = 101
    Top = 315
    Width = 80
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Sample from'
  end
  object iweSampleFrom: TIWEdit
    Left = 216
    Top = 312
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweSampleFrom'
    SubmitOnAsyncEvent = True
    TabOrder = 6
    Text = '0'
  end
  object IWLabel4: TIWLabel
    Left = 296
    Top = 315
    Width = 12
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'to'
  end
  object iweSampleTo: TIWEdit
    Left = 320
    Top = 312
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweSampleTo'
    SubmitOnAsyncEvent = True
    TabOrder = 7
    Text = 'zz'
  end
  object IWLabel5: TIWLabel
    Left = 101
    Top = 343
    Width = 88
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Province from'
  end
  object iweProvinceFrom: TIWEdit
    Left = 216
    Top = 340
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweProvinceFrom'
    SubmitOnAsyncEvent = True
    TabOrder = 8
    Text = 'A'
  end
  object IWLabel6: TIWLabel
    Left = 296
    Top = 343
    Width = 12
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'to'
  end
  object iweProvinceTo: TIWEdit
    Left = 320
    Top = 340
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweProvinceTo'
    SubmitOnAsyncEvent = True
    TabOrder = 9
    Text = 'zz'
  end
  object IWLabel7: TIWLabel
    Left = 101
    Top = 372
    Width = 82
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Terrane from'
  end
  object iweTerraneFrom: TIWEdit
    Left = 216
    Top = 369
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweTerraneFrom'
    SubmitOnAsyncEvent = True
    TabOrder = 10
    Text = 'A'
  end
  object IWLabel8: TIWLabel
    Left = 296
    Top = 372
    Width = 12
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'to'
  end
  object iweTerraneTo: TIWEdit
    Left = 320
    Top = 369
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweTerraneTo'
    SubmitOnAsyncEvent = True
    TabOrder = 11
    Text = 'zz'
  end
  object IWLabel9: TIWLabel
    Left = 101
    Top = 287
    Width = 97
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Reference from'
  end
  object iweReferenceFrom: TIWEdit
    Left = 216
    Top = 284
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweReferenceFrom'
    SubmitOnAsyncEvent = True
    TabOrder = 4
    Text = 'A'
  end
  object IWLabel11: TIWLabel
    Left = 296
    Top = 287
    Width = 12
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'to'
  end
  object iweReferenceTo: TIWEdit
    Left = 320
    Top = 285
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweReferenceTo'
    SubmitOnAsyncEvent = True
    TabOrder = 5
    Text = 'zz'
  end
  object IWText2: TIWText
    Left = 422
    Top = 294
    Width = 247
    Height = 67
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      
        'These limits reduce the number of lookup values that need to be ' +
        'downloaded from the server and so speed up processing')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 689
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
    ExplicitWidth = 689
    inherited IWFrameRegion: TIWRegion
      Width = 689
      TabOrder = 13
      ExplicitWidth = 689
      inherited iwrHeader: TIWRegion
        Width = 689
        ExplicitWidth = 689
        inherited iwrWelcome: TIWRegion
          Width = 689
          ExplicitWidth = 689
          inherited iwrDisplayUserName: TIWRegion
            Width = 548
            ExplicitWidth = 548
            inherited lblWelcome: TIWLabel
              Left = 227
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 689
          ExplicitWidth = 689
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
