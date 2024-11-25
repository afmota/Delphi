inherited frmArtistas: TfrmArtistas
  Caption = 'Artistas'
  ClientHeight = 417
  ClientWidth = 650
  ExplicitWidth = 666
  ExplicitHeight = 456
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Width = 650
    ExplicitWidth = 650
  end
  inherited pnlCampos: TPanel
    Left = 120
    Width = 505
    Height = 218
    ExplicitLeft = 120
    ExplicitWidth = 505
    ExplicitHeight = 218
    inherited Label1: TLabel
      Left = 30
      ExplicitLeft = 30
    end
    inherited Label2: TLabel
      Left = 0
      ExplicitLeft = 0
    end
    object Label3: TLabel [2]
      Left = 5
      Top = 81
      Width = 42
      Height = 21
      Caption = 'Estilo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited edtID: TEdit
      Left = 53
      OnKeyPress = edtIDKeyPress
      ExplicitLeft = 53
    end
    inherited edtNome: TEdit
      Left = 53
      ExplicitLeft = 53
    end
    object cbEstilo: TComboBox
      Tag = 3
      Left = 53
      Top = 78
      Width = 306
      Height = 29
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = 16772332
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'DANCE'
        'ELETR'#212'NICA'
        'HARD ROCK'
        'HIP HOP'
        'METAL'
        'NEW AGE'
        'NEW WAVE'
        'NU METAL'
        'POP'
        'RAP'
        'ROCK')
    end
    object btnUpEstilo: TBitBtn
      Tag = -1
      Left = 365
      Top = 78
      Width = 29
      Height = 29
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7E
        78FFD15D55FFCE5048FFCE5249FFD4655DFFDF8C86FFEFC7C4FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA6FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF0CC
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97871FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC48
        3FFFE5A29DFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF8F8FFD7716AFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25E56FFD8736CFFD66F68FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A09CFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE4A19DFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCC473FFFCC483FFFF0CAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF7F7FFE39B96FFCC4A42FFCC4940FFE9B3AFFFFEFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFCC47
        3FFFCC473FFFCC473FFFD36159FFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DBD9FFE9B1ADFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF4F3FFD25D
        55FFCC473FFFCC473FFFCC473FFFEEC3C0FFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCF6F5FFE9B2
        AEFFCC473FFFCC473FFFCC473FFFDD8680FFFCF6F5FFFCF7F6FFFFFFFFFFFFFF
        FFFFFEFEFEFFE19691FFDA7D77FFFDFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6F5FFD7716AFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFE29893FFFFFFFFFFFEFE
        FEFFE39C97FFCC473FFFCC473FFFDC827CFFFDFBFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F4FFD66D
        66FFCC473FFFCC473FFFCC473FFFCC473FFFE0928DFFFEFEFEFFFEFEFEFFE39A
        95FFCC473FFFCC473FFFCC473FFFCC473FFFDB807AFFFEFCFCFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3
        F3FFD66F68FFCC473FFFCC473FFFE1948FFFFEFEFEFFFEFEFEFFE4A09BFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFFEFBFBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBF3F3FFD56B63FFDF8F89FFFEFEFEFFFFFFFFFFFEFEFEFFF7E4E3FFF7E4
        E2FFCF554CFFCC473FFFCC473FFFCD4E45FFF5DBD9FFF7E4E3FFFDFBFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF5F5FFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDF8E88FFCC473FFFCC473FFFCC473FFFE29994FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAFFFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6DEDDFFCC4940FFCC473FFFCC473FFFCC483FFFE9B3AFFFFEFEFEFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFDB7F
        79FFF9EAE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE19590FFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCE5249FFE9B3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF9F9FFD7726BFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25D55FFD8736CFFD66E67FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A19CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97972FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC49
        40FFE5A29EFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA7FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF1CD
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7F
        78FFD25D55FFCE5048FFCE524AFFD4655EFFDF8C87FFEFC7C5FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 3
      OnClick = btnUpEstiloClick
    end
  end
end
