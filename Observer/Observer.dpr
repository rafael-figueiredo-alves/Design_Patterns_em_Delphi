program Observer;

uses
  System.StartUpCopy,
  FMX.Forms,
  Observer.view.main in 'src\view\Observer.view.main.pas' {FormMain},
  Observer.model.interfaces in 'src\model\Observer.model.interfaces.pas',
  Observer.model.saldo in 'src\model\Observer.model.saldo.pas' {FrameSaldo: TFrame},
  Observer.model.agrupamento in 'src\model\Observer.model.agrupamento.pas' {FrameAgrupamento: TFrame},
  Observer.model.logOperacoes in 'src\model\Observer.model.logOperacoes.pas' {FrameLog: TFrame},
  Observer.model.Operacoes in 'src\model\Observer.model.Operacoes.pas' {FrameOperacoes: TFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
