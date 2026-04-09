with Usart_Control;
with Usart_Data;
package body Usart_Interface is

   package Control is new Usart_Control 
     (Device       => Device, 
      Driver_Init  => Driver_Init,
      Driver_Start =>  Driver_Start,
      Driver_Stop  => Driver_Stop,
      Driver_Reset => Driver_Reset);

   package Data is new Usart_Data
     (Device         => Device, 
      Driver_Tx_Push => Driver_Tx_Push,
      Driver_Rx_Pop  =>  Driver_Rx_Pop);

   procedure Open (Dev : in out Device;
                   Cfg : Usart_Types.Usart_Config) is
   begin
      Control.Reset (Dev);
      Control.Init  (Dev, Cfg);
      Control.Start (Dev);
   end Open;

   procedure Close (Dev : in out Device) is
   begin
      Control.Stop (Dev);
   end Close;

   procedure Write (Dev     : in out Device;
                    Buf     : Storage_Array;
                    Written : out Natural) is
   begin
      if Buf'Length = 0 then
         Written := 0;
         return;
      end if;
      Data.Write (Dev, Buf, Written);
   end Write;

   procedure Read (Dev  : in out Device;
                   Buf  : out Storage_Array;
                   Read : out Natural) is
   begin
      if Buf'Length = 0 then
         raise Usart_Types.USART_Error with "Read: zero-length buffer";
      end if;
      Data.Read (Dev, Buf, Read);
   end Read;

end Usart_Interface;