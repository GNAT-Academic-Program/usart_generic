package body Usart_Control is

   procedure Init
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config) is
   begin
      Driver_Init (Dev, Cfg);
   end Init;

   procedure Enable
     (Dev    : in out Device) is
   begin
      Driver_Enable (Dev);
   end Enable;

   procedure Disable
     (Dev    : in out Device) is
   begin
      Driver_Disable (Dev);
   end Disable;

   procedure Reset
     (Dev    : in out Device) is
   begin
      Driver_Reset (Dev);
   end Reset;

end Usart_Control;