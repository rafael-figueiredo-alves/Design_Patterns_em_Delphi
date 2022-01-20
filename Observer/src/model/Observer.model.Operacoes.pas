unit Observer.model.Operacoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Grid, FMX.Layouts, FMX.Edit, FMX.ListBox, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB,
  Datasnap.DBClient, Observer.model.interfaces, System.Generics.Collections;

type
  TFrameOperacoes = class(TFrame, iSubject)
    Grid1: TGrid;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    ComboOperacao: TComboBox;
    ComboCategoria: TComboBox;
    EditValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Operação: TStringField;
    ClientDataSet1Categoria: TStringField;
    ClientDataSet1Valor: TCurrencyField;
    BindSourceDB12: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FObservers : TList<iObserver>;
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Function AddObserver(value: iObserver): iSubject;
    Function RemoveObserver(value: iObserver): iSubject;
    Function Notificar: iSubject;
  end;

implementation

{$R *.fmx}

{ TFrame4 }

function TFrameOperacoes.AddObserver(value: iObserver): iSubject;
begin
  Result := Self;
  FObservers.Add(value);
end;

procedure TFrameOperacoes.Button1Click(Sender: TObject);
begin
  ClientDataSet1.AppendRecord([ComboOperacao.Selected.Text, ComboCategoria.Selected.Text, StrToCurr(EditValor.Text)]);
  Notificar;
end;

constructor TFrameOperacoes.Create(AOwner: TComponent);
begin
  inherited;
  FObservers := TList<iObserver>.create;
end;

destructor TFrameOperacoes.Destroy;
begin
  FObservers.DisposeOf;
  inherited;
end;

function TFrameOperacoes.Notificar: iSubject;
Var
 Notificacao : TNotificacao;
 Observer    : iObserver;
begin
  Result := Self;
  Notificacao.Operacao  := ClientDataSet1.FieldByName('Operação').AsString;
  Notificacao.Categoria := ClientDataSet1.FieldByName('Categoria').AsString;
  Notificacao.Valor     := ClientDataSet1.FieldByName('Valor').AsCurrency;

  for Observer in FObservers do
  begin
    Observer.Atualizar(Notificacao);
  end;

end;

function TFrameOperacoes.RemoveObserver(value: iObserver): iSubject;
begin
  Result := self;
  FObservers.Delete(FObservers.IndexOf(value));
end;

end.
