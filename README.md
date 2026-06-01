# usart_generic

Generic USART abstraction layer for bare-metal Ada applications.

## Overview

`usart_generic` provides a hardware-independent USART/UART interface for embedded systems. It separates control and data operations through distinct generic packages, enabling flexible instantiation patterns for serial communication.

## Features

- Hardware-agnostic USART abstraction
- Configurable baud rate, word length, parity, and stop bits
- Separate control and data operation packages
- Combined interface package for convenience
- Blocking and non-blocking transmit/receive operations
- Zero runtime overhead through generic instantiation

## API

### USART_Interface

```ada
generic
   type Device_T is limited private;
   with procedure Driver_Init (Dev : in out Device_T; Cfg : USART_Types.USART_Config);
   with procedure Driver_Enable (Dev : in out Device_T);
   with procedure Driver_Disable (Dev : in out Device_T);
   with procedure Driver_Send (Dev : in out Device_T; B : MT.UInt8);
   with procedure Driver_Recv (Dev : in out Device_T; B : out MT.UInt8);
   with function Driver_Tx_Ready (Dev : Device_T) return Boolean;
   with function Driver_Rx_Ready (Dev : Device_T) return Boolean;
package USART_Interface is
   subtype Device is Device_T;
   
   procedure Open (Dev : in out Device; Cfg : USART_Types.USART_Config);
   procedure Close (Dev : in out Device);
   procedure Put (Dev : in out Device; C : Character);
   procedure Put_Line (Dev : in out Device; S : String);
   function Get (Dev : in out Device) return Character;
   procedure Write (Dev : in out Device; Buf : Storage_Array);
   procedure Read (Dev : in out Device; Buf : out Storage_Array);
end USART_Interface;
```

## Usage

### 1. Implement Hardware Driver Layer

Create a hardware-specific package with device type and driver procedures.

### 2. Instantiate USART_Interface

```ada
package USART_Port is new USART_Interface
  (Device_T         => MCU_USART.Device,
   Driver_Init      => MCU_USART.Init,
   Driver_Enable    => MCU_USART.Enable,
   Driver_Disable   => MCU_USART.Disable,
   Driver_Send      => MCU_USART.Send,
   Driver_Recv      => MCU_USART.Recv,
   Driver_Tx_Ready  => MCU_USART.Tx_Ready,
   Driver_Rx_Ready  => MCU_USART.Rx_Ready);
```

### 3. Use USART

```ada
USART_Port.Open (USART_Dev, (Baud_Rate => 115200, Word_Length => 8, Parity => None, Stop_Bits => 1));
USART_Port.Put_Line (USART_Dev, "Hello, World!");
USART_Port.Close (USART_Dev);
```

## Integration

Add to your `alire.toml`:

```toml
[[depends-on]]
usart_generic = "^0.1.0"
```

## Dependencies

- `machine_types` - Provides `MT.UInt8` type

## License

MIT OR Apache-2.0 WITH LLVM-exception
