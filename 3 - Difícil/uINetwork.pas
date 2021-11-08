unit uINetwork;

interface
uses untClassConexao;

type

  INetWork = interface
  ['{5E5D78D7-646A-423B-A160-AB69448FBEE7}']
        procedure InsertElemento(prmElemento: Integer);
        procedure Clear();
        //function AdicionarConexao(Conexao: TConexoes): Boolean;
        function Conectar(Valor1, Valor2: integer; var Conexao: TConexoes): Boolean;
        function Consulta(Valor1, Valor2: Integer; ValorAnterior: integer = 0): boolean;
        function CountElementos(): Integer;
        function CountNetWorks(): Integer;
  end;

implementation





end.

