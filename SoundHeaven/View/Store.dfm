inherited frmStore: TfrmStore
  Caption = 'Store'
  ClientHeight = 278
  ExplicitHeight = 317
  TextHeight = 15
  inherited pnlCampos: TPanel
    Top = 71
    Width = 721
    Height = 170
    ExplicitTop = 71
    ExplicitWidth = 721
    ExplicitHeight = 170
    inherited Label2: TLabel
      Width = 45
      Caption = 'T'#237'tulo'
      ExplicitWidth = 45
    end
    object Label3: TLabel [2]
      Left = 2
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
    inherited edtID: TEdit
      OnKeyPress = edtIDKeyPress
    end
    inherited edtNome: TEdit
      Width = 583
      Height = 27
      ExplicitWidth = 583
      ExplicitHeight = 27
    end
    object edtArtista: TEdit
      Tag = 2
      Left = 58
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
  end
end