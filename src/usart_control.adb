package body Usart_Control is

   procedure Init (Cfg : Usart_Types.Usart_Config) is
   begin
      Driver_Init (Cfg);
   end Init;

   procedure Enable is
   begin
      Driver_Enable;
   end Enable;

   procedure Disable is
   begin
      Driver_Disable;
   end Disable;

   procedure Reset is
   begin
      Driver_Reset;
   end Reset;

end Usart_Control;