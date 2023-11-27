object IWChartInit: TIWChartInit
  Left = 0
  Top = 0
  Width = 994
  Height = 520
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'DateView'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWChart1: TIWChart
    Left = 8
    Top = 50
    Width = 712
    Height = 461
    BorderOptions.Width = 0
    UseSize = True
    Chart = Chart1
  end
  object iwcbShowLegend: TIWCheckBox
    Left = 552
    Top = 3
    Width = 167
    Height = 21
    Cursor = crAuto
    Caption = 'Show Legend'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 6
    OnClick = iwcbShowLegendClick
    Checked = True
    FriendlyName = 'IWCheckBox1'
  end
  object iwcbShowBackground: TIWCheckBox
    Left = 552
    Top = 23
    Width = 167
    Height = 21
    Cursor = crAuto
    Caption = 'Show background'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 7
    OnClick = iwcbShowBackgroundClick
    Checked = False
    FriendlyName = 'iwcbShowBackground'
  end
  object iwbClose: TIWButton
    Left = 8
    Top = 6
    Width = 75
    Height = 21
    Caption = 'Close'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClose'
    TabOrder = 14
    OnClick = iwbCloseClick
  end
  object iwbExportGraphValues: TIWButton
    Left = 8
    Top = 28
    Width = 75
    Height = 21
    Caption = 'Export'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbExportGraphValues'
    TabOrder = 13
    OnClick = iwbExportGraphValuesClick
  end
  object IWLabel3: TIWLabel
    Left = 100
    Top = 8
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'Y axis min.'
  end
  object IWLabel4: TIWLabel
    Left = 100
    Top = 32
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'X axis min.'
  end
  object iweYMinimum: TIWEdit
    Left = 186
    Top = 3
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweYMinimum'
    SubmitOnAsyncEvent = True
  end
  object iweXMinimum: TIWEdit
    Left = 186
    Top = 27
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweXMinimum'
    SubmitOnAsyncEvent = True
    TabOrder = 2
  end
  object IWLabel5: TIWLabel
    Left = 282
    Top = 7
    Width = 28
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'max.'
  end
  object IWLabel6: TIWLabel
    Left = 282
    Top = 31
    Width = 28
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'max.'
  end
  object iweYMaximum: TIWEdit
    Left = 316
    Top = 3
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object iweXMaximum: TIWEdit
    Left = 316
    Top = 27
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit2'
    SubmitOnAsyncEvent = True
    TabOrder = 3
  end
  object iwbChangeAxisScales: TIWButton
    Left = 404
    Top = 5
    Width = 75
    Height = 21
    Caption = 'Change'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbChangeAxisScales'
    TabOrder = 4
    OnClick = iwbChangeAxisScalesClick
  end
  object iwcbAutomaticScaling: TIWCheckBox
    Left = 402
    Top = 27
    Width = 145
    Height = 21
    Cursor = crAuto
    Caption = 'Automatic scale'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 5
    OnClick = iwcbAutomaticScalingClick
    Checked = True
    FriendlyName = 'iwcbAutomaticScaling'
  end
  object iwcbSeries1: TIWCheckBox
    Left = 730
    Top = 52
    Width = 250
    Height = 21
    Cursor = crAuto
    Caption = 'Series1'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 8
    OnClick = iwcbSeries1Click
    Checked = True
    FriendlyName = 'iwcbSeries1'
  end
  object iwcbSeries2: TIWCheckBox
    Left = 730
    Top = 69
    Width = 250
    Height = 21
    Cursor = crAuto
    Caption = 'Series2'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 9
    OnClick = iwcbSeries2Click
    Checked = True
    FriendlyName = 'iwcbSeries2'
  end
  object iwcbSeries3: TIWCheckBox
    Left = 730
    Top = 89
    Width = 250
    Height = 21
    Cursor = crAuto
    Caption = 'Series3'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 10
    OnClick = iwcbSeries3Click
    Checked = True
    FriendlyName = 'iwcbSeries3'
  end
  object iwcbSeries4: TIWCheckBox
    Left = 730
    Top = 108
    Width = 250
    Height = 21
    Cursor = crAuto
    Caption = 'Series4'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 11
    OnClick = iwcbSeries4Click
    Checked = True
    FriendlyName = 'iwcbSeries4'
  end
  object iwcbSeries5: TIWCheckBox
    Left = 730
    Top = 128
    Width = 250
    Height = 21
    Cursor = crAuto
    Caption = 'Series5'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 12
    OnClick = iwcbSeries5Click
    Checked = True
    FriendlyName = 'iwcbSeries5'
  end
  object Chart1: TChart
    Left = 9
    Top = 50
    Width = 710
    Height = 459
    Foot.Alignment = taLeftJustify
    Foot.Font.Color = clGray
    Foot.Font.Style = [fsBold]
    Foot.Text.Strings = (
      '(c) Dr Bruce Eglington (2004-2022)'
      'DateView Geochronology Database')
    Gradient.EndColor = clSilver
    Gradient.MidColor = clWhite
    Gradient.StartColor = clSilver
    Gradient.Visible = True
    Legend.CheckBoxesStyle = cbsRadio
    Legend.Font.Height = -15
    Legend.Font.Style = [fsBold]
    Legend.Font.Shadow.Color = clWhite
    Legend.Font.Shadow.HorizSize = 1
    Legend.Font.Shadow.VertSize = 1
    Legend.LegendStyle = lsSeries
    Title.Brush.Gradient.Direction = gdLeftRight
    Title.Brush.Gradient.EndColor = clGray
    Title.Brush.Gradient.Visible = True
    Title.Font.Color = clBlack
    Title.Font.Height = -21
    Title.Text.Strings = (
      'TChart')
    BottomAxis.MaximumOffset = 4
    BottomAxis.MinimumOffset = 4
    LeftAxis.MaximumOffset = 4
    LeftAxis.MinimumOffset = 4
    View3D = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      20
      15
      20)
    ColorPaletteIndex = 0
    object Series1: TLineSeries
      HoverElement = [heCurrent]
      Brush.Color = clRed
      Brush.BackColor = clDefault
      LinePen.Color = clRed
      LinePen.Width = 2
      Pointer.Brush.Color = clRed
      Pointer.Brush.Gradient.EndColor = clRed
      Pointer.Gradient.EndColor = clRed
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000C05A4000000000000000000000000000005540000000
        0000206040000000000000684000000000000063400000000000C06B40000000
        0000206840000000000000654000000000006064400000000000005840000000
        00008060400000000000E06B400000000000E064400000000000E06B40000000
        0000A0704000000000000075400000000000E074400000000000B07B40000000
        000088804000000000007082400000000000D882400000000000508540000000
        0000C888400000000000188940}
    end
    object Series3: TLineSeries
      HoverElement = [heCurrent]
      SeriesColor = clBlue
      Title = 'Series2'
      Brush.Color = clBlue
      Brush.BackColor = clDefault
      LinePen.Color = clBlue
      LinePen.Width = 2
      Pointer.Brush.Color = clBlue
      Pointer.Brush.Gradient.EndColor = clBlue
      Pointer.Gradient.EndColor = clBlue
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psDiamond
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000707F400000000000A079400000000000407840000000
        000070784000000000004075400000000000D07A400000000000A07540000000
        00001075400000000000D071400000000000006A400000000000E06840000000
        0000E069400000000000806B4000000000002061400000000000805440000000
        000000204000000000000054400000000000002A400000000000405340000000
        0000A0604000000000000053400000000000805B400000000000C05240000000
        000000F03F0000000000002640}
    end
    object Series2: TLineSeries
      HoverElement = [heCurrent]
      Title = 'Series3'
      Brush.Color = clGreen
      Brush.BackColor = clDefault
      LinePen.Color = clGreen
      LinePen.Width = 2
      Pointer.Brush.Color = clGreen
      Pointer.Brush.Gradient.EndColor = clGreen
      Pointer.Gradient.EndColor = clGreen
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psTriangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000C06F4000000000000075400000000000707840000000
        0000C077400000000000C075400000000000507B400000000000007E40000000
        0000707F40000000000040794000000000007079400000000000707440000000
        0000F07640000000000000714000000000003077400000000000F07840000000
        00006077400000000000B07A4000000000008075400000000000A06E40000000
        00006070400000000000F0744000000000002074400000000000B07240000000
        00006075400000000000607040}
    end
    object Series4: TLineSeries
      HoverElement = [heCurrent]
      Brush.Color = clYellow
      Brush.BackColor = clDefault
      LinePen.Color = clYellow
      LinePen.Width = 3
      Pointer.Brush.Color = clYellow
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        0019000000000000000048884000000000008888400000000000488B40000000
        0000188D400000000000788C400000000000B889400000000000808A40000000
        0000B089400000000000C0894000000000000888400000000000C08640000000
        0000708840000000000058854000000000003084400000000000988140000000
        0000907F400000000000507C400000000000A076400000000000807240000000
        0000206F4000000000002070400000000000C063400000000000406D40000000
        00006067400000000000A06940}
    end
    object Series5: TLineSeries
      HoverElement = [heCurrent]
      SeriesColor = clFuchsia
      Brush.Color = clFuchsia
      Brush.BackColor = clDefault
      LinePen.Color = clFuchsia
      LinePen.Width = 2
      Pointer.Brush.Color = clFuchsia
      Pointer.Brush.Gradient.EndColor = clFuchsia
      Pointer.Gradient.EndColor = clFuchsia
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psDownTriangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000D07F4000000000004881400000000000008240000000
        00005880400000000000E080400000000000407C400000000000F07C40000000
        0000507B400000000000D074400000000000C06F400000000000C07040000000
        0000607540000000000080754000000000006073400000000000E06A40000000
        0000206440000000000080614000000000008063400000000000406B40000000
        0000C0594000000000000056400000000000005B400000000000004740000000
        00008056400000000000003340}
    end
  end
  object FDMemTempDataI: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 304
  end
  object FDMemTitles: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 192
  end
  object FDMemTempDataIG: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 360
  end
end
