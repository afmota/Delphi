unit RoundButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Graphics, Vcl.Forms, System.Types, Winapi.Windows;

type
  TRoundButton = class(TCustomControl)
  private
    FColor: TColor;
    FBorderColor: TColor;
    procedure SetColor(const Value: TColor);
    procedure SetBorderColor(const Value: TColor);
  protected
    procedure Paint; override;
    procedure Resize; override;
    procedure Click; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Color: TColor read FColor write SetColor;
    property BorderColor: TColor read FBorderColor write SetBorderColor;
    property OnClick;
    property Align;
    property Anchors;
    property Caption;
    property Font;
    property Height;
    property Width;
    property Visible;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TRoundButton]);
end;

{ TRoundButton }

constructor TRoundButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FColor := clBtnFace;
  FBorderColor := clBlack;
  Width := 100;
  Height := 40;
  ControlStyle := [csClickEvents, csCaptureMouse, csDoubleClicks, csOpaque];
end;

procedure TRoundButton.Paint;
var
  R: TRect;
  Radius: Integer;
  TextRect: TRect;
begin
  inherited Paint;

  R := ClientRect;
  Radius := Height div 4; // Define o raio dos cantos arredondados

  // Define o fundo do botão
  Canvas.Brush.Color := FColor;
  Canvas.Pen.Color := FBorderColor;
  Canvas.Pen.Width := 2;

  // Desenha o retângulo com cantos arredondados
  Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, Radius, Radius);

  // Desenha o texto centralizado
  Canvas.Brush.Style := bsClear;
  TextRect := R;
  DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TRoundButton.Resize;
begin
  inherited Resize;
  Invalidate; // Redesenha o botão quando seu tamanho muda
end;

procedure TRoundButton.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Invalidate;
  end;
end;

procedure TRoundButton.SetBorderColor(const Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    Invalidate;
  end;
end;

procedure TRoundButton.Click;
begin
  inherited Click;
  // Adiciona o evento OnClick aqui se necessário
end;

end.

