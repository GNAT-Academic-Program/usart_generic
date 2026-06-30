with System.Storage_Elements;
use System.Storage_Elements;

generic
   with procedure Driver_Tx_Push (B         : Storage_Element;
                                  Accepted  : out Boolean);
   with procedure Driver_Rx_Pop  (B         : out Storage_Element;
                                  Available : out Boolean);
package Usart_Data is

   procedure Write (Buf     : Storage_Array;
                    Written : out Storage_Offset);

   procedure Read (Buf  : out Storage_Array;
                   Read : out Storage_Offset);

end Usart_Data;