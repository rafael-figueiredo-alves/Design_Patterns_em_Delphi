unit Observer.model.logOperacoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Observer.model.interfaces, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.Controls.Presentation;

type
  TFrameLog = class(TFrame, iObserver)
    Label1: TLabel;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    Function Atualizar (Value: TNotificacao) : iObserver;
  end;

implementation

{$R *.fmx}

{ TFrame3 }

function TFrameLog.Atualizar(Value: TNotificacao): iObserver;
Var TextoLog: string;
begin
  Result := self;
  TextoLog := 'Uma operação de ' + Value.Operacao + ' no valor de ' + FormatCurr('R$ #,##0.00', value.Valor) + ' foi adicionada.';
  Memo1.Lines.Add(TextoLog);
end;

end.
