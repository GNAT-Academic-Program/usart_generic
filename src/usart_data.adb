package body Usart_Data is

   procedure Write
     (Dev     : in out Device;
      Buf     : Storage_Array;
      Written : out Natural) is
      Ok_Flag : Boolean;
   begin
      Written := 0;

      for I in Buf'Range loop
         Driver_Tx_Push (Dev, Buf (I), Ok_Flag);

         if not Ok_Flag then
            -- Backend cannot accept more data right now
            return;
         end if;

         Written := Written + 1;
      end loop;
   end Write;

   procedure Read
     (Dev  : in out Device;
      Buf  : out Storage_Array;
      Read : out Natural) is
      B : Storage_Element;
      Ok_Flag : Boolean;
   begin
      Read := 0;

      for I in Buf'Range loop
         Driver_Rx_Pop (Dev, B, Ok_Flag);

         if not Ok_Flag then
            -- No more data available right now
            return;
         end if;

         Buf (I) := B;
         Read := Read + 1;
      end loop;
   end Read;

end Usart_Data;