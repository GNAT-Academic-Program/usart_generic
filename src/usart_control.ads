with Usart_Types;

generic

   type Device is limited private;

   with procedure Driver_Init
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config;
      Result : out Usart_Types.Status);

   with procedure Driver_Start
     (Dev    : in out Device;
      Result : out Usart_Types.Status);

   with procedure Driver_Stop
     (Dev    : in out Device;
      Result : out Usart_Types.Status);

   with procedure Driver_Reset
     (Dev    : in out Device;
      Result : out Usart_Types.Status);

package Usart_Control is

   -----------------
   -- Control API --
   -----------------

   procedure Init
     (Dev    : in out Device;
      Cfg    : Usart_Types.Usart_Config;
      Result : out Usart_Types.Status);

   procedure Start
     (Dev    : in out Device;
      Result : out Usart_Types.Status);

   procedure Stop
     (Dev : in out Device;
      Result : out Usart_Types.Status);

   procedure Reset
     (Dev : in out Device;
      Result : out Usart_Types.Status);

end Usart_Control;