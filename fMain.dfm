object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Arshin'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 442
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 441
    object LabeledEdit1: TLabeledEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 23
      EditLabel.Width = 19
      EditLabel.Height = 15
      EditLabel.Caption = #1043#1086#1076
      TabOrder = 0
      Text = ''
    end
    object LabeledEdit2: TLabeledEdit
      Left = 16
      Top = 96
      Width = 121
      Height = 23
      EditLabel.Width = 119
      EditLabel.Height = 15
      EditLabel.Caption = #1053#1086#1084#1077#1088' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
      TabOrder = 1
      Text = ''
    end
    object Button1: TButton
      Left = 16
      Top = 144
      Width = 121
      Height = 25
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Memo1: TMemo
    Left = 193
    Top = 0
    Width = 435
    Height = 442
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitWidth = 431
    ExplicitHeight = 441
  end
end
