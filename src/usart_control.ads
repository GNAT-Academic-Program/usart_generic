with Usart_Types;

generic
   with procedure Driver_Init    (Cfg : Usart_Types.Usart_Config);
   with procedure Driver_Enable;
   with procedure Driver_Disable;
   with procedure Driver_Reset;

package Usart_Control is

   procedure Init     (Cfg : Usart_Types.Usart_Config);
   procedure Enable;
   procedure Disable;
   procedure Reset;

end Usart_Control;