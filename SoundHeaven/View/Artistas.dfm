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
  end
end
