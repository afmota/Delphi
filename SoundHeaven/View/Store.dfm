inherited frmStore: TfrmStore
  Caption = 'Store'
  ClientHeight = 620
  ExplicitHeight = 659
  TextHeight = 15
  inherited pnlCampos: TPanel
    Top = 71
    Width = 721
    Height = 154
    ExplicitTop = 71
    ExplicitWidth = 721
    ExplicitHeight = 154
    inherited Label1: TLabel
      Left = 96
      Top = 14
      ExplicitLeft = 96
      ExplicitTop = 14
    end
    inherited Label2: TLabel
      Left = 66
      Width = 45
      Caption = 'T'#237'tulo'
      ExplicitLeft = 66
      ExplicitWidth = 45
    end
    object Label3: TLabel [2]
      Left = 63
      Top = 81
      Width = 50
      Height = 21
      Caption = 'Artista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 19
      Top = 116
      Width = 94
      Height = 21
      Caption = 'Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited edtID: TEdit
      Left = 119
      OnKeyPress = edtIDKeyPress
      ExplicitLeft = 119
    end
    inherited edtNome: TEdit
      Left = 119
      Width = 583
      Height = 27
      OnKeyPress = edtIDKeyPress
      ExplicitLeft = 119
      ExplicitWidth = 583
      ExplicitHeight = 27
    end
    object edtArtista: TEdit
      Tag = 2
      Left = 119
      Top = 79
      Width = 583
      Height = 27
      Cursor = crHandPoint
      BevelInner = bvNone
      BevelOuter = bvNone
      CharCase = ecUpperCase
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      StyleName = 'Windows'
    end
    object dtpDataLancamento: TDateTimePicker
      Left = 119
      Top = 112
      Width = 123
      Height = 29
      Date = 45622.000000000000000000
      Time = 0.716351851850049600
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object StringGrid: TStringGrid
    Left = 200
    Top = 248
    Width = 751
    Height = 329
    TabOrder = 2
    OnDrawCell = StringGridDrawCell
  end
end
