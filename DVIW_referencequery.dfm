object ISFReferenceQuery: TISFReferenceQuery
  Left = 0
  Top = 0
  Width = 727
  Height = 849
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
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 794
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
    ExplicitHeight = 359
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 727
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
    ExplicitWidth = 727
    inherited IWFrameRegion: TIWRegion
      Width = 727
      TabOrder = 6
      ExplicitWidth = 727
      inherited iwrHeader: TIWRegion
        Width = 727
        ExplicitWidth = 727
        inherited iwrWelcome: TIWRegion
          Width = 727
          ExplicitWidth = 727
          inherited iwrDisplayUserName: TIWRegion
            Width = 586
            ExplicitWidth = 586
            inherited lblWelcome: TIWLabel
              Left = 265
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 727
          ExplicitWidth = 727
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
  object iwrRight: TIWRegion
    Left = 83
    Top = 55
    Width = 644
    Height = 794
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    ExplicitTop = 61
    object iwrReferenceRange: TIWRegion
      Left = 0
      Top = 0
      Width = 644
      Height = 113
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWLabel1: TIWLabel
        Left = 30
        Top = 16
        Width = 158
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Show references ranging'
      end
      object IWLabel2: TIWLabel
        Left = 30
        Top = 42
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
      object iweReferenceFrom: TIWEdit
        Left = 70
        Top = 39
        Width = 179
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 1
      end
      object IWLabel3: TIWLabel
        Left = 30
        Top = 70
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
      object iweReferenceTo: TIWEdit
        Left = 70
        Top = 67
        Width = 179
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 2
      end
      object lblFromError: TIWLabel
        Left = 281
        Top = 40
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
        Left = 281
        Top = 68
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
    end
    object iwrReferences: TIWRegion
      Left = 0
      Top = 113
      Width = 644
      Height = 392
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 137
      object iwcbContinents: TIWCheckBox
        Left = 30
        Top = 14
        Width = 231
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Regions'
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
        Left = 30
        Top = 41
        Width = 349
        Height = 304
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 4
        NonEditableAsLabel = True
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
    end
    object iwrButtonsBottom: TIWRegion
      Left = 0
      Top = 505
      Width = 644
      Height = 72
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 520
      object iwbSubmit: TIWButton
        Left = 30
        Top = 5
        Width = 349
        Height = 30
        Caption = 'Submit'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmit'
        TabOrder = 5
        OnClick = iwbSubmitClick
      end
    end
  end
end
