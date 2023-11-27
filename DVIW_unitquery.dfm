object ISFUnitQuery: TISFUnitQuery
  Left = 0
  Top = 0
  Width = 731
  Height = 414
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
  object iweFrom: TIWEdit
    Left = 136
    Top = 99
    Width = 179
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweFrom'
    SubmitOnAsyncEvent = True
  end
  object IWLabel1: TIWLabel
    Left = 98
    Top = 174
    Width = 133
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'in the following areas'
  end
  object iwbSubmit: TIWButton
    Left = 216
    Top = 356
    Width = 75
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmit'
    TabOrder = 3
    OnClick = iwbSubmitClick
  end
  object IWLabel2: TIWLabel
    Left = 96
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
    Left = 96
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
  object iweTo: TIWEdit
    Left = 136
    Top = 127
    Width = 179
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweTo'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object iwlAreas: TIWListbox
    Left = 98
    Top = 192
    Width = 349
    Height = 147
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    TabOrder = 2
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
    Left = 347
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
    Left = 347
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
    Height = 359
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
  object lblAreaError: TIWLabel
    Left = 467
    Top = 194
    Width = 71
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblAreaError'
    Caption = 'lblAreaError'
  end
  object IWLabel4: TIWLabel
    Left = 96
    Top = 78
    Width = 203
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Show stratigraphic units ranging'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 731
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
    ExplicitWidth = 731
    inherited IWFrameRegion: TIWRegion
      Width = 731
      TabOrder = 4
      ExplicitWidth = 731
      inherited iwrHeader: TIWRegion
        Width = 731
        ExplicitWidth = 731
        inherited iwrWelcome: TIWRegion
          Width = 731
          ExplicitWidth = 731
          inherited iwrDisplayUserName: TIWRegion
            Width = 590
            ExplicitWidth = 590
            inherited lblWelcome: TIWLabel
              Left = 269
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 731
          ExplicitWidth = 731
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
