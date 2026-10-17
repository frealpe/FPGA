# FPGA · Nios II paso a paso

Código de las series de la página **Fpga** de Facebook: sistemas embebidos en FPGA con el
procesador soft-core Nios II, Quartus Prime y Platform Designer.

Tarjeta de referencia: **Terasic DE10-Nano** (Cyclone V SE `5CSEBA6U23I7`). Con otra tarjeta de
Intel/Altera los pasos son los mismos: cambian el dispositivo y los pines.

## Semanas

| Carpeta | Tema |
| --- | --- |
| [`semana-01`](semana-01) | Tu primer sistema Nios II: Quartus → Platform Designer → Nios II EDS y *Hello World* |

Cada carpeta tiene solo fuentes (diseño, pines y C). Lo que Quartus y Nios II EDS regeneran solos
(`db/`, `output_files/`, el BSP…) no se sube: se obtiene al compilar.

## Descargar

*Code → Download ZIP*, o `git clone https://github.com/frealpe/FPGA.git`.

## Licencia

[MIT](LICENSE).
