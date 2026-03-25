package body Usart_Interface is

   procedure Open
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config;
      Result : out Usart_Types.Status) is
   begin
      Control.Reset (Dev, Result);
      if not Usart_Types.Success (Result) then
         return;
      end if;
      Control.Init (Dev, Cfg, Result);
      if not Usart_Types.Success (Result) then
         return;
      end if;
      Control.Start (Dev, Result);
   end Open;

   procedure Close (Dev : in out Device) is
      use Usart_Types;
      Result : Status := (Kind => Ok);
   begin
      Control.Stop (Dev, Result);
   end Close;

   procedure Write
     (Dev     : in out Device;
      Buf     : Storage_Array;
      Written : out Natural) is
   begin
      Data.Write (Dev, Buf, Written);
   end Write;

   procedure Read
     (Dev  : in out Device;
      Buf  : out Storage_Array;
      Read : out Natural) is
   begin
      Data.Read (Dev, Buf, Read);
   end Read;

end Usart_Interface;