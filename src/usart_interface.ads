with Usart_Types;
with Usart_Control;
with Usart_Data;

with System.Storage_Elements;
use System.Storage_Elements;

generic
   type Device is limited private;

   with package Control is new Usart_Control (Device => Device, others => <>);
   with package Data    is new Usart_Data    (Device => Device, others => <>);

package Usart_Interface is
   procedure Open
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config;
      Result : out Usart_Types.Status);

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