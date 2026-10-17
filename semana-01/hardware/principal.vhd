-- Semana 1 · Top-level para la Terasic DE10-Nano (Cyclone V SE 5CSEBA6U23I7).
--
-- Instancia el sistema "Gpio" que se arma en Platform Designer (Nios II + memoria on-chip +
-- JTAG UART). Ese sistema solo exporta el reloj (clk_clk), que aquí se conecta a FPGA_CLK1_50
-- (50 MHz, PIN_V11). Los nombres de componente y puertos son los que genera Platform Designer:
-- si tu sistema se llama distinto, cópialos de "Generate → Show Instantiation Template".
library ieee;
use ieee.std_logic_1164.all;

entity principal is
    port (
        FPGA_CLK1_50 : in std_logic
        -- Opcional, si exportas también el reset del sistema en Platform Designer:
        -- ; KEY : in std_logic_vector(1 downto 0)   -- pulsadores, activos en bajo
    );
end entity principal;

architecture rtl of principal is

    component Gpio is
        port (
            clk_clk : in std_logic := 'X'
            -- ; reset_reset_n : in std_logic := 'X'
        );
    end component Gpio;

begin

    u0 : component Gpio
        port map (
            clk_clk => FPGA_CLK1_50
            -- , reset_reset_n => KEY(0)   -- KEY es activo en bajo: presionado = reset
        );

end architecture rtl;
