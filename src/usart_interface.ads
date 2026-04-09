with Usart_Types;

with System.Storage_Elements;
use System.Storage_Elements;

generic
   type Device is limited private;
   with procedure Driver_Init    (Dev : in out Device;
                                  Cfg : Usart_Types.Usart_Config);
   with procedure Driver_Start   (Dev : in out Device);
   with procedure Driver_Stop    (Dev : in out Device);
   with procedure Driver_Reset   (Dev : in out Device);
   with procedure Driver_Tx_Push (Dev       : in out Device;
                                  B         : Storage_Element;
                                  Accepted  : out Boolean);
   with procedure Driver_Rx_Pop  (Dev       : in out Device;
                                  B         : out Storage_Element;
                                  Available : out Boolean);

package Usart_Interface is
   procedure Open
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config);

   procedure Close (Dev : in out Device);

   procedure Write
     (Dev     : in out Device;
      Buf     : Storage_Array;
      Written : out Natural);

   procedure Read
     (Dev  : in out Device;
      Buf  : out Storage_Array;
      Read : out Natural);

   -- Add more portable policy here later:
   -- Write_Blocking, Read_Exactly, Recover, Flush, etc.
end Usart_Interface;