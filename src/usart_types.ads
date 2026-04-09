package Usart_Types is

   USART_Error        : exception;  -- programming error, bad config, unrecoverable
   USART_Unsupported  : exception;  -- hardware can't do it (9-bit + parity, etc.)

   type Transfer_Status is (Ok, Busy, Timeout);

   type Baud_Rate is
     (B1200, B2400, B4800, B9600, B19200, B38400, B57600, B115200,
      B230400, B460800, B921600, B1M, B2M);

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