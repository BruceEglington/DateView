object ISFSampleQuery: TISFSampleQuery
  Left = 0
  Top = 0
  Width = 701
  Height = 565
  RenderInvisibleControls = True
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  ActiveControl = iwbSubmit
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWLabel1: TIWLabel
    Left = 102
    Top = 76
    Width = 143
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Show samples ranging'
  end
  object iwbSubmit: TIWButton
    Left = 102
    Top = 534
    Width = 348
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmit'
    TabOrder = 7
    OnClick = iwbSubmitClick
  end
  object IWLabel2: TIWLabel
    Left = 102
    Top = 102
    Width = 29
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'from'
  end
  object IWLabel3: TIWLabel
    Left = 102
    Top = 130
    Width = 12
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'to'
  end
  object iweSampleTo: TIWEdit
    Left = 137
    Top = 124
    Width = 179
    Height = 21
    ParentShowHint = True
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweSampleTo'
    SubmitOnAsyncEvent = True
    TabOrder = 2
  end
  object iwcbContinents: TIWCheckBox
    Left = 103
    Top = 165
    Width = 348
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Continents'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbContinents'
  end
  object iwlContinents: TIWListbox
    Left = 104
    Top = 192
    Width = 349
    Height = 147
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    TabOrder = 4
    FriendlyName = 'iwlContinents'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbAreas: TIWCheckBox
    Left = 102
    Top = 352
    Width = 351
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Areas'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 5
    Checked = False
    FriendlyName = 'iwcbAreas'
  end
  object iwlAreas: TIWListbox
    Left = 104
    Top = 373
    Width = 347
    Height = 145
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    TabOrder = 6
    FriendlyName = 'iwlAreas'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object lblFromError: TIWLabel
    Left = 353
    Top = 100
    Width = 75
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblFromError'
    Caption = 'lblFromError'
  end
  object lblToError: TIWLabel
    Left = 353
    Top = 128
    Width = 59
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblToError'
    Caption = 'lblToError'
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 510
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
  end
  object iweSampleFrom: TIWEdit
    Left = 137
    Top = 97
    Width = 179
    Height = 21
    ParentShowHint = True
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweSampleFrom'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 701
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
    ExplicitWidth = 701
    inherited IWFrameRegion: TIWRegion
      Width = 701
      TabOrder = 8
      ExplicitWidth = 701
      inherited iwrHeader: TIWRegion
        Width = 701
        ExplicitWidth = 701
        inherited iwrWelcome: TIWRegion
          Width = 701
          ExplicitWidth = 701
          inherited iwrDisplayUserName: TIWRegion
            Width = 560
            ExplicitWidth = 560
            inherited lblWelcome: TIWLabel
              Left = 239
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 701
          ExplicitWidth = 701
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
