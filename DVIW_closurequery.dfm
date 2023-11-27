object ISFClosureTemperatureQuery: TISFClosureTemperatureQuery
  Left = 0
  Top = 0
  Width = 701
  Height = 484
  OnRender = IWAppFormRender
  ConnectionMode = cmAny
  SupportedBrowsers = [brIE, brNetscape7, brOpera, brSafari, brNetscape6]
  OnCreate = IWAppFormCreate
  AllowPageAccess = True
  BrowserSecurityCheck = True
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwbSubmit: TIWButton
    Left = 220
    Top = 444
    Width = 75
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmit'
    ScriptEvents = <>
    TabOrder = 2
    OnClick = iwbSubmitClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 429
    Cursor = crAuto
    Align = alLeft
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1
    RenderSize = True
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Color = clNone
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwcbIsotopeSystems: TIWCheckBox
    Left = 104
    Top = 97
    Width = 301
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Isotope Systems'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbIsotopeSystems'
  end
  object iwlIsotopeSystems: TIWListbox
    Left = 106
    Top = 119
    Width = 215
    Height = 121
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 4
    FriendlyName = 'iwlIsotopeSystems'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object iwcbMaterial: TIWCheckBox
    Left = 104
    Top = 264
    Width = 301
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Material Analysed'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 0
    Checked = False
    FriendlyName = 'iwcbMaterial'
  end
  object iwlMaterial: TIWListbox
    Left = 106
    Top = 286
    Width = 273
    Height = 121
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 1
    FriendlyName = 'iwlMaterial'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object lblError: TIWLabel
    Left = 448
    Top = 162
    Width = 177
    Height = 15
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taCenter
    BGColor = clNone
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'lblError'
    Caption = 'Selections have not been made'
    RawText = False
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
    ExplicitLeft = -271
    ExplicitWidth = 972
    inherited IWFrameRegion: TIWRegion
      Width = 701
      TabOrder = 5
      ExplicitWidth = 972
      inherited iwrHeader: TIWRegion
        Width = 701
        ExplicitWidth = 972
        ExplicitHeight = 55
        inherited iwrWelcome: TIWRegion
          Width = 701
          ExplicitTop = 35
          ExplicitWidth = 972
          ExplicitHeight = 20
          inherited iwrLeftBlock: TIWRegion
            ExplicitHeight = 20
          end
          inherited iwrDisplayUserName: TIWRegion
            Width = 560
            ExplicitWidth = 831
            ExplicitHeight = 20
            inherited lblWelcome: TIWLabel
              Left = 239
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 701
          ExplicitWidth = 972
        end
      end
    end
  end
end
