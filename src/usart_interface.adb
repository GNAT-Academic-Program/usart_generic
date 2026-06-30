with Usart_Control;
with Usart_Data;
package body Usart_Interface is

   package Control is new Usart_Control
     (Driver_Init    => Driver_Init,
      Driver_Enable  => Driver_Enable,
      Driver_Disable => Driver_Disable,
      Driver_Reset   => Driver_Reset);

   package Data is new Usart_Data
     (Driver_Tx_Push => Driver_Tx_Push,
      Driver_Rx_Pop  => Driver_Rx_Pop);

   procedure Open (Cfg : Usart_Types.Usart_Config) is
   begin
      Control.Reset;
      Control.Init (Cfg);
      Control.Enable;
   end Open;

   procedure Close is
   begin
      Control.Disable;
   end Close;

   procedure Write (Buf     : Storage_Array;
                    Written : out Storage_Offset) is
   begin
      if Buf'Length = 0 then
         Written := 0;
         return;
      end if;
      Data.Write (Buf, Written);
   end Write;

   procedure Read (Buf      : out Storage_Array;
                   Received : out Storage_Offset) is
   begin
      if Buf'Length = 0 then
         raise Usart_Types.USART_Error with "Read: zero-length buffer";
      end if;
      Data.Read (Buf, Received);
   end Read;

end Usart_Interface;