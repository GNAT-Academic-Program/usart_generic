with Usart_Types;

generic
   type Device is limited private;
   with procedure Driver_Init    (Dev : in out Device;
                                  Cfg : Usart_Types.Usart_Config);
   with procedure Driver_Enable  (Dev : in out Device);
   with procedure Driver_Disable (Dev : in out Device);
   with procedure Driver_Reset   (Dev : in out Device);

package Usart_Control is

   procedure Init     (Dev : in out Device;
                       Cfg : Usart_Types.Usart_Config);
   procedure Enable   (Dev : in out Device);
   procedure Disable  (Dev : in out Device);
   procedure Reset    (Dev : in out Device);

end Usart_Control;