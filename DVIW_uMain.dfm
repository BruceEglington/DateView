object ISFMain: TISFMain
  Left = 0
  Top = 0
  Width = 972
  Height = 608
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'DateView Main'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  StyleSheet.Filename = 'styles.css'
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWRegion1: TIWRegion
    Left = 0
    Top = 55
    Width = 972
    Height = 553
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.Style = cbsNone
    object iwRHeader: TIWRegion
      Left = 0
      Top = 0
      Width = 972
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.Style = cbsNone
      object lblWelcome: TIWLabel
        AlignWithMargins = False
        Left = 10
        Top = 18
        Width = 217
        Height = 22
        Hint = ''
        ZIndex = 1
        Font.Color = clWebCORNFLOWERBLUE
        Font.FontName = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Font.PxSize = 18
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'lblWelcome'
        Caption = 'Welcome to DateView'
      end
    end
    object iwRFooter: TIWRegion
      Left = 0
      Top = 464
      Width = 972
      Height = 89
      RenderInvisibleControls = False
      Align = alBottom
      BorderOptions.Style = cbsNone
      DesignSize = (
        972
        89)
      object iwlDeveloperName: TIWLabel
        AlignWithMargins = False
        Left = 24
        Top = 0
        Width = 113
        Height = 15
        Hint = ''
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        Font.PxSize = 12
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlDeveloperName'
        Caption = 'Dr Bruce Eglington'
      end
      object IWLabel3: TIWLabel
        AlignWithMargins = False
        Left = 22
        Top = 38
        Width = 141
        Height = 14
        Hint = ''
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'bruce.eglington@usask.ca'
      end
      object iwlNumUses: TIWLabel
        AlignWithMargins = False
        Left = 489
        Top = 42
        Width = 155
        Height = 14
        Hint = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNumUses'
        Caption = 'This program has been used '
      end
      object iwlNumRecords: TIWLabel
        AlignWithMargins = False
        Left = 488
        Top = 1
        Width = 158
        Height = 14
        Hint = ''
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNumRecords'
        Caption = 'Total # records in database = '
      end
      object iwDBNumRecords: TIWDBLabel
        AlignWithMargins = False
        Left = 660
        Top = 1
        Width = 115
        Height = 14
        Hint = ''
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        DataField = 'NUMTOTALRECORDS'
        DataSource = dmDV.dsNumRecords
        FriendlyName = 'iwDBNumRecords'
      end
      object iwlNumPublRecords: TIWLabel
        AlignWithMargins = False
        Left = 488
        Top = 12
        Width = 182
        Height = 14
        Hint = ''
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNumPublRecords'
        Caption = 'Total public records in database = '
      end
      object iwDBNumPublRecords: TIWDBLabel
        AlignWithMargins = False
        Left = 661
        Top = 12
        Width = 106
        Height = 14
        Hint = ''
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        DataField = 'NUMPUBLRECORDS'
        DataSource = dmDV.dsNumRecords
        FriendlyName = 'iwDBNumPublRecords'
      end
      object iwDBLastCounted: TIWDBLabel
        AlignWithMargins = False
        Left = 661
        Top = 24
        Width = 82
        Height = 14
        Hint = ''
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        DataField = 'DATECOUNTED'
        DataSource = dmDV.dsNumRecords
        FriendlyName = 'iwDBLastCounted'
      end
      object iwlLastCounted: TIWLabel
        AlignWithMargins = False
        Left = 488
        Top = 24
        Width = 85
        Height = 14
        Hint = ''
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlLastCounted'
        Caption = 'Last counted on'
      end
      object iwbPermissions: TIWButton
        AlignWithMargins = False
        Left = 289
        Top = 6
        Width = 117
        Height = 25
        Hint = ''
        Caption = 'Permissions'
        Color = clBtnFace
        FriendlyName = 'iwbPermissions'
        TabOrder = 1
        OnClick = iwbPermissionsClick
      end
      object iwbCheckGetIniFile: TIWButton
        AlignWithMargins = False
        Left = 289
        Top = 32
        Width = 117
        Height = 25
        Hint = ''
        Visible = False
        Caption = 'Check Ini File'
        Color = clBtnFace
        FriendlyName = 'iwbCheckGetIniFile'
        TabOrder = 4
        OnClick = iwbCheckGetIniFileClick
      end
      object iwlProgressDate: TIWLabel
        AlignWithMargins = False
        Left = 24
        Top = 21
        Width = 150
        Height = 14
        Hint = ''
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        AutoSize = False
        FriendlyName = 'iwlProgressDate'
        Caption = 'yyyy-mm-dd'
      end
      object iwb_TestDestroy: TIWButton
        AlignWithMargins = False
        Left = 289
        Top = 56
        Width = 117
        Height = 30
        Hint = ''
        Caption = 'iwb_TestDestroy'
        Color = clBtnFace
        FriendlyName = 'iwb_TestDestroy'
        OnClick = iwb_TestDestroyClick
      end
    end
    object iwRMemo: TIWRegion
      Left = 200
      Top = 60
      Width = 772
      Height = 404
      RenderInvisibleControls = False
      Align = alClient
      BorderOptions.Style = cbsNone
      DesignSize = (
        772
        404)
      object iwDBmProgress: TIWDBMemo
        AlignWithMargins = False
        Left = 24
        Top = 6
        Width = 725
        Height = 381
        Hint = ''
        ParentCustomHint = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        ShowHint = False
        StyleRenderOptions.RenderBorder = False
        BGColor = clWebWHITE
        Editable = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        Font.PxSize = 12
        InvisibleBorder = True
        HorizScrollBar = False
        VertScrollBar = True
        Required = False
        SubmitOnAsyncEvent = False
        AutoEditable = False
        DataField = 'PROGRESSDETAILS'
        DataSource = dmUser.dsProgress
        FriendlyName = 'iwDBmProgress'
      end
    end
    inline FrameMenu: TISFFrameMenu
      Left = 0
      Top = 60
      Width = 200
      Height = 404
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      Align = alLeft
      AutoScroll = True
      TabOrder = 3
      TabStop = True
      ExplicitTop = 60
      ExplicitHeight = 404
      inherited IWFrameRegion: TIWRegion
        Height = 404
        TabOrder = 3
        ExplicitHeight = 404
        inherited iwrAll: TIWRegion
          Height = 404
          ExplicitHeight = 404
          inherited iwrMenu: TIWRegion
            Height = 274
            ExplicitHeight = 274
            inherited IWMenu1: TIWMenu
              Height = 274
              ExplicitHeight = 274
            end
          end
        end
      end
      inherited MainMenu1: TMainMenu
        inherited Query1: TMenuItem
          inherited Define1: TMenuItem
            OnClick = FrameMenuDefine1Click
          end
          inherited DefineGDUCurve1: TMenuItem
            OnClick = FrameMenuDefineGDUCurve1Click
          end
        end
        inherited Select1: TMenuItem
          inherited SelectReferences1: TMenuItem
            OnClick = FrameMenuSelectReferences1Click
          end
          inherited SelectSamples1: TMenuItem
            OnClick = FrameMenuSelectSamples1Click
          end
        end
        inherited Data1: TMenuItem
          inherited RawDataIdentifyAgePeaks1: TMenuItem
            OnClick = FrameMenuRawDataIdentifyAgePeaks1Click
          end
          inherited RawDataMultipleDetrital1: TMenuItem
            OnClick = FrameMenuRawDataMultipleDetrital1Click
          end
          inherited RawDataIndivAgeHf: TMenuItem
            OnClick = FrameMenuRawDataIndivAgeHfClick
          end
          inherited RawDataIndivAgeChem: TMenuItem
            OnClick = FrameMenuRawDataIndivAgeChemClick
          end
          inherited RawDataMultiAgeChem: TMenuItem
            OnClick = FrameMenuRawDataMultiAgeChemClick
          end
        end
      end
    end
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 972
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
    TabOrder = 1
    TabStop = True
    ExplicitWidth = 972
    inherited IWFrameRegion: TIWRegion
      Width = 972
      TabOrder = 2
      ExplicitWidth = 972
      inherited iwrHeader: TIWRegion
        Width = 972
        ExplicitWidth = 972
        inherited iwrWelcome: TIWRegion
          Width = 972
          ExplicitWidth = 972
          inherited iwrDisplayUserName: TIWRegion
            Width = 831
            ExplicitWidth = 831
            inherited lblWelcome: TIWLabel
              Left = 510
              Width = 64
              Alignment = taRightJustify
              NoWrap = True
              ExplicitLeft = 510
              ExplicitWidth = 64
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 972
          ExplicitWidth = 972
          inherited iwlSignOut: TIWLink
            OnClick = TopBariwlSignOutClick
            TabOrder = -1
          end
          inherited lnkSignIn: TIWLink
            OnClick = TopBarlnkSignInClick
          end
        end
      end
    end
  end
end
