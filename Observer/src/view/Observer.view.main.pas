unit Observer.view.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Observer.model.Operacoes, FMX.Layouts, Observer.model.logOperacoes,
  Observer.model.agrupamento, Observer.model.saldo, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid;

type
  TFormMain = class(TForm)
    Layout1: TLayout;
    FrameSaldo1: TFrameSaldo;
    FrameAgrupamento1: TFrameAgrupamento;
    FrameLog1: TFrameLog;
    FrameOperacoes1: TFrameOperacoes;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FrameOperacoes1
    .AddObserver(FrameSaldo1)
    .AddObserver(FrameAgrupamento1)
    .AddObserver(FrameLog1);
end;

end.
