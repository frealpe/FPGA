# Semana 1 · Tu primer sistema Nios II en FPGA

Material de apoyo de la serie publicada en la página **Fpga** de Facebook (20 publicaciones, del
lunes 19 al viernes 23 de octubre de 2026). Tarjeta: **Terasic DE10-Nano**, Cyclone V SE
`5CSEBA6U23I7`.

## Qué hay aquí

| Archivo | Para qué |
| --- | --- |
| `hardware/principal.vhd` | Top-level: instancia el sistema `Gpio` y le conecta el reloj `FPGA_CLK1_50` |
| `hardware/pines_de10nano.csv` | Asignación de pines (`Assignments → Import Assignments`): el reloj en `PIN_V11` |
| `software/hello_world.c` | El programa de la plantilla *Hello World* de Nios II EDS |

El sistema de Platform Designer no viene hecho: armarlo es el ejercicio de la semana.

## Pasos

1. **Quartus Prime** (en la serie, Lite 17.0): *File → New Project Wizard*, proyecto `Gpio`,
   familia Cyclone V, dispositivo `5CSEBA6U23I7`.
2. **Platform Designer** (*Tools → Qsys*): sistema `Gpio` con
   - `clk_0` (Clock Source), con `clk_in` exportado;
   - Nios II (núcleo `/e`), con `instruction_master` y `data_master` a la memoria;
   - On-Chip Memory (RAM), destino de los vectores de reset y de excepción;
   - JTAG UART, colgado del `data_master`, con su IRQ.

   *System → Assign Base Addresses* hasta tener 0 errores, y *Generate HDL*.
3. Añade `principal.vhd` al proyecto, ponlo como top-level e importa `pines_de10nano.csv`.
4. *Processing → Start Compilation*, y *Tools → Programmer*: el `.sof` va en la FPGA
   (`5CSEBA6U23`); el HPS (`SOCVHPS`) de la cadena JTAG se deja sin marcar.
5. **Nios II EDS**: *File → New → Nios II Application and BSP from Template*, con el
   `Gpio.sopcinfo` y la plantilla *Hello World*. *Build Project* y *Run As → Nios II Hardware*.

Debe aparecer `Hello from Nios II!` en la consola.

## Reto

Agrega un PIO de salida de 1 bit, regenera el sistema y el BSP, y haz que el programa también
encienda y apague un LED de la tarjeta.
