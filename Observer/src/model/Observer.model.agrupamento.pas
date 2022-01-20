unit Observer.model.agrupamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.DB, Datasnap.DBClient, System.Rtti, FMX.Grid.Style,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Observer.model.interfaces;

type
  TFrameAgrupamento = class(TFrame, iObserver)
    ClientDataSet1: TClientDataSet;
    Grid1: TGrid;
    ClientDataSet1Categoria: TStringField;
    ClientDataSet1Total: TCurrencyField;
    Label1: TLabel;
    BindSourceDB12: TBindSourceDB;
  private
    { Private declarations }
  public
    { Public declarations }
    Function Atualizar (Value: TNotificacao) : iObserver;
  end;

implementation

{$R *.fmx}

{ TFrame2 }

function TFrameAgrupamento.Atualizar(Value: TNotificacao): iObserver;
begin
  Result := self;
  if value.Operacao = 'Crédito' then
   Exit;

  if ClientDataSet1.Locate('Categoria', Value.Categoria, []) then
   begin
     ClientDataSet1.Edit;
     ClientDataSet1.FieldByName('Total').AsCurrency := ClientDataSet1.FieldByName('Total').AsCurrency + Value.Valor;
     ClientDataSet1.Post;
     exit
   end;

   ClientDataSet1.AppendRecord([value.Categoria, Value.Valor]);

end;

end.
