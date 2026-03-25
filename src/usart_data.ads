with System.Storage_Elements;
use System.Storage_Elements;

generic
   type Device is limited private;

   with procedure Driver_Tx_Push
     (Dev : in out Device;
      B   : Storage_Element;
      Ok  : out Boolean);

   with procedure Driver_Rx_Pop
     (Dev : in out Device;
      B   : out Storage_Element;
      Ok  : out Boolean);

package Usart_Data is

   procedure Write
     (Dev     : in out Device;
      Buf     : Storage_Array;
      Written : out Natural);

   procedure Read
     (Dev  : in out Device;
      Buf  : out Storage_Array;
      Read : out Natural);

end Usart_Data;