package Usart_Types is
   pragma Pure;
   type Status_Kind is (Ok, Busy, Error, Unsupported, Timeout);

   type Status is record
      Kind : Status_Kind := Ok;
   end record;

   function Success (S : Status) return Boolean is (S.Kind = Ok);

   --  type Byte is mod 2**8;
   --  type Byte_Array is array (Positive range <>) of Byte;
   --  subtype Byte_Array

   type Baud_Rate is
     (B1200, B2400, B4800, B9600, B19200, B38400, B57600, B115200,
      B230400, B460800, B921600, B1M);

   type Data_Bits_Kind is (Data_7, Data_8, Data_9);

   type Parity_Kind is (None, Even, Odd);

   type Stop_Bits_Kind is (Stop_1, Stop_2);

   type Flow_Control_Kind is (None, RTS_CTS);

   type Usart_Config is record
      Baud      : Baud_Rate;
      Data_Bits : Data_Bits_Kind;
      Parity    : Parity_Kind;
      Stop_Bits : Stop_Bits_Kind;
      Flow      : Flow_Control_Kind;
   end record;

end Usart_Types;