package body Usart_Control is

   procedure Init
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config;
      Result : out Usart_Types.Status) is
   begin
      Driver_Init (Dev, Cfg, Result);
   end Init;

   procedure Start
     (Dev    : in out Device;
      Result : out Usart_Types.Status) is
   begin
      Driver_Start (Dev, Result);
   end Start;

   procedure Stop
     (Dev    : in out Device;
      Result : out Usart_Types.Status) is
   begin
      Driver_Stop (Dev, Result);
   end Stop;

   procedure Reset
     (Dev    : in out Device;
      Result : out Usart_Types.Status) is
   begin
      Driver_Reset (Dev, Result);
   end Reset;

end Usart_Control;