unit uIMaquina;

interface

uses
  Classes;

type

  IMaquina = interface
  ['{FB006B46-3D5F-4B7F-BE75-25E2968C9A1E}']
    function MontarTroco(Troco: Double): TList;
  end;

implementation

end.

