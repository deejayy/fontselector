object Form1: TForm1
  Left = 367
  Top = 185
  Width = 868
  Height = 498
  BorderWidth = 5
  Caption = 'Font Selector'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 211
    Top = 0
    Height = 450
  end
  object Panel1: TPanel
    Left = 214
    Top = 0
    Width = 628
    Height = 450
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 628
      Height = 51
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Edit1: TEdit
        Left = 10
        Top = 10
        Width = 396
        Height = 22
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = #225#369#337' '#193#368#336' 012 abcd ABCD'
      end
      object Memo2: TMemo
        Left = 525
        Top = 5
        Width = 96
        Height = 41
        TabOrder = 1
        WordWrap = False
      end
      object Button1: TButton
        Left = 440
        Top = 5
        Width = 75
        Height = 20
        Caption = 'Copy'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 51
      Width = 628
      Height = 399
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 5
      Color = clWhite
      TabOrder = 1
      object Image1: TImage
        Left = 6
        Top = 6
        Width = 616
        Height = 387
        Align = alClient
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 211
    Height = 450
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 0
      Top = 0
      Width = 211
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object ListBox1: TListBox
      Left = 0
      Top = 3
      Width = 211
      Height = 314
      Align = alClient
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 0
      OnClick = ListBox1Click
      OnKeyPress = ListBox1KeyPress
    end
    object Memo1: TMemo
      Left = 0
      Top = 317
      Width = 211
      Height = 133
      Align = alBottom
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        '10'
        '12'
        '20'
        '36'
        '60'
        '90'
        '120'
        '150')
      ParentFont = False
      TabOrder = 1
    end
  end
end
