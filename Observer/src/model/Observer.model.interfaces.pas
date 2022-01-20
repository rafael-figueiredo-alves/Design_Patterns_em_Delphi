unit Observer.model.interfaces;

interface

Type
 TNotificacao = record
   Operacao  : string;
   Categoria : string;
   Valor     : currency;
 end;

 iObserver = interface
   ['{DD7C4E16-46BD-4536-96CE-45833F57CE36}']
   Function Atualizar (Value: TNotificacao) : iObserver;
 end;

 iSubject = interface
   ['{73FEC908-9797-4BE4-93F2-BB92544319B3}']
   Function AddObserver (value : iObserver) : iSubject;
   Function RemoveObserver (value: iObserver) : iSubject;
   Function Notificar : iSubject;
 end;

implementation

end.
