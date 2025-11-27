object ISFClosureTemperatureQuery: TISFClosureTemperatureQuery
  Left = 0
  Top = 0
  Width = 701
  Height = 484
  RenderInvisibleControls = True
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
  object iwbSubmit: TIWButton
    AlignWithMargins = False
    Left = 220
    Top = 444
    Width = 75
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbSubmit'
    TabOrder = 2
    OnClick = iwbSubmitClick
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 429
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    Font.PxSize = 13
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwcbIsotopeSystems: TIWCheckBox
    AlignWithMargins = False
    Left = 104
    Top = 97
    Width = 301
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Isotope Systems'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbIsotopeSystems'
  end
  object iwlIsotopeSystems: TIWListbox
    AlignWithMargins = False
    Left = 106
    Top = 119
    Width = 215
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    RequireSelection = False
    UseSize = False
    TabOrder = 4
    FriendlyName = 'iwlIsotopeSystems'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
  end
  object iwcbMaterial: TIWCheckBox
    AlignWithMargins = False
    Left = 104
    Top = 264
    Width = 301
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Material Analysed'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    SubmitOnAsyncEvent = True
    Style = stNormal
    Checked = False
    FriendlyName = 'iwcbMaterial'
  end
  object iwlMaterial: TIWListbox
    AlignWithMargins = False
    Left = 106
    Top = 286
    Width = 273
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    RequireSelection = False
    UseSize = False
    TabOrder = 1
    FriendlyName = 'iwlMaterial'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
  end
  object lblError: TIWLabel
    AlignWithMargins = False
    Left = 448
    Top = 162
    Width = 177
    Height = 15
    Alignment = taCenter
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'lblError'
    Caption = 'Selections have not been made'
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
        inherited iwrWelcome: TIWRegion
          Width = 701
          ExplicitWidth = 972
          inherited iwrDisplayUserName: TIWRegion
            Width = 560
            ExplicitWidth = 831
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
