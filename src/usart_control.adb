package body Usart_Control is

   procedure Init
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config) is
   begin
      Driver_Init (Dev, Cfg);
   end Init;

   procedure Start
     (Dev    : in out Device) is
   begin
      Driver_Start (Dev);
   end Start;

   procedure Stop
     (Dev    : in out Device) is
   begin
      Driver_Stop (Dev);
   end Stop;

   procedure Reset
     (Dev    : in out Device) is
   begin
      Driver_Reset (Dev);
   end Reset;

end Usart_Control;