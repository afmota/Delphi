object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
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
  Menu = MainMenu1
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 360
    Top = 320
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Artistas1: TMenuItem
        Caption = 'Artistas'
        OnClick = Artistas1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
