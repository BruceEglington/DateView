object ISFUnitAreaLinkQuery: TISFUnitAreaLinkQuery
  Left = 0
  Top = 0
  Width = 762
  Height = 394
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
  object IWLabel1: TIWLabel
    Left = 92
    Top = 176
    Width = 134
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'to the following areas'
  end
  object iwbSubmit: TIWButton
    Left = 210
    Top = 358
    Width = 75
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmit'
    TabOrder = 1
    OnClick = iwbSubmitClick
  end
  object iwlAreas: TIWListbox
    Left = 92
    Top = 194
    Width = 349
    Height = 147
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    NonEditableAsLabel = True
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
  object lblUnitError: TIWLabel
    Left = 459
    Top = 126
    Width = 68
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblUnitError'
    Caption = 'lblUnitError'
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 339
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
    Left = 461
    Top = 196
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
    Left = 90
    Top = 80
    Width = 162
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Link this stratigraphic unit'
  end
  object iwcbUnit: TIWComboBox
    Left = 92
    Top = 102
    Width = 347
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 2
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 762
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
    ExplicitWidth = 762
    inherited IWFrameRegion: TIWRegion
      Width = 762
      TabOrder = 3
      ExplicitWidth = 762
      inherited iwrHeader: TIWRegion
        Width = 762
        ExplicitWidth = 762
        inherited iwrWelcome: TIWRegion
          Width = 762
          ExplicitWidth = 762
          inherited iwrDisplayUserName: TIWRegion
            Width = 621
            ExplicitWidth = 621
            inherited lblWelcome: TIWLabel
              Left = 300
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 762
          ExplicitWidth = 762
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
