object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Soundhaven'
  ClientHeight = 561
  ClientWidth = 864
  Color = clBtnFace
  Constraints.MinHeight = 567
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 542
    Width = 864
    Height = 19
    Panels = <>
  end
  object pnlTaskBar: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 0
    Align = alTop
    TabOrder = 1
  end
  object MainMenu: TMainMenu
    Tag = 2
    Left = 808
    Top = 8
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      OnClick = MenuClick
      object Estilos1: TMenuItem
        Tag = 1
        Caption = 'Estilos'
        OnClick = MenuClick
      end
      object Artistas1: TMenuItem
        Tag = 2
        Caption = 'Artistas'
        OnClick = MenuClick
      end
      object Produtores1: TMenuItem
        Tag = 3
        Caption = 'Produtores'
        OnClick = MenuClick
      end
      object Gravadoras1: TMenuItem
        Tag = 4
        Caption = 'Gravadoras'
        OnClick = MenuClick
      end
      object lbuns1: TMenuItem
        Tag = 5
        Caption = #193'lbuns'
        OnClick = MenuClick
      end
      object Store1: TMenuItem
        Tag = 6
        Caption = 'Store'
        OnClick = MenuClick
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object AnimationTimer: TTimer
    Enabled = False
    Interval = 16
    OnTimer = AnimationTimerTimer
    Left = 760
    Top = 224
  end
end
