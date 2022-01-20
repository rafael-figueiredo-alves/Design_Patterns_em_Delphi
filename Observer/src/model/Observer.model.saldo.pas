unit Observer.model.saldo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, Observer.model.interfaces;

type
  TFrameSaldo = class(TFrame, iObserver)
    Label1: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Label2: TLabel;
    LabelCreditos: TLabel;
    Label4: TLabel;
    LabelDebitos: TLabel;
    Label6: TLabel;
    LabelSaldo: TLabel;
  private
    { Private declarations }
    FCreditos : Currency;
    FDebitos  : Currency;
  public
    { Public declarations }
    Function Atualizar (Value: TNotificacao) : iObserver;
  end;

implementation

{$R *.fmx}

{ TFrame1 }

function TFrameSaldo.Atualizar(Value: TNotificacao): iObserver;
Var saldo : currency;
begin
  Result := Self;
  if Value.Operacao = 'Crédito' then
   FCreditos := FCreditos + Value.Valor
  else if value.Operacao = 'Débito' then
        FDebitos := FDebitos + Value.Valor;

  saldo := FCreditos - FDebitos;

  LabelCreditos.Text := FormatCurr('R$ #,##0.00', FCreditos);
  LabelDebitos.Text  := FormatCurr('R$ #,##0.00', FDebitos);
  LabelSaldo.Text    := FormatCurr('R$ #,##0.00', saldo);

end;

end.
