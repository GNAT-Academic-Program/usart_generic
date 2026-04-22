package body Usart_Data is

   procedure Write (Dev     : in out Device;
                    Buf     : Storage_Array;
                    Written : out Storage_Offset) is
      Accepted : Boolean;
   begin
      Written := 0;

      for I in Buf'Range loop
         Driver_Tx_Push (Dev, Buf (I), Accepted);

         if not Accepted then
            -- Backend cannot accept more data right now
            return;
         end if;

         Written := Written + 1;
      end loop;
   end Write;

   procedure Read (Dev  : in out Device;
                   Buf  : out Storage_Array;
                   Read : out Storage_Offset) is
      B : Storage_Element;
      Available : Boolean;
   begin
      Read := 0;

      for I in Buf'Range loop
         Driver_Rx_Pop (Dev, B, Available);

         if not Available then
            -- No more data available right now
            return;
         end if;

         Buf (I) := B;
         Read := Read + 1;
      end loop;
   end Read;

end Usart_Data;