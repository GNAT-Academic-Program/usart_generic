with Usart_Types;

with System.Storage_Elements;
use System.Storage_Elements;

--  USART_Interface models a physical USART peripheral (USART1, USART2, etc.).
--  The instantiation IS the bus. There is no Device_T.
--
--  USART is a one-level abstraction: bus = device. You never have two software
--  clients sharing the same UART.

generic
   with procedure Driver_Init    (Cfg : Usart_Types.Usart_Config);
   with procedure Driver_Enable;
   with procedure Driver_Disable;
   with procedure Driver_Reset;
   with procedure Driver_Tx_Push (B         : Storage_Element;
                                  Accepted  : out Boolean);
   with procedure Driver_Rx_Pop  (B         : out Storage_Element;
                                  Available : out Boolean);

package Usart_Interface is

   procedure Open (Cfg : Usart_Types.Usart_Config);

   procedure Close;

   procedure Write (Buf     : Storage_Array;
                    Written : out Storage_Offset);

   procedure Read (Buf      : out Storage_Array;
                   Received : out Storage_Offset);

   -- Add more portable policy here later:
   -- Write_Blocking, Read_Exactly, Recover, Flush, etc.
end Usart_Interface;