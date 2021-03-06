<?xml version="1.0" encoding="UTF-8"?>
<project name="1D_ALU" board="Mojo V3" language="Lucid">
  <files>
    <src>shift.luc</src>
    <src>alu.luc</src>
    <src>testcase.luc</src>
    <src>bin_to_dec_mod.luc</src>
    <src>cmp.luc</src>
    <src>adder.luc</src>
    <src>multi_seven_seg.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>boole.luc</src>
    <src>digit_lut.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf>mojo.ucf</ucf>
    <component>decoder.luc</component>
    <component>spi_slave.luc</component>
    <component>bin_to_dec.luc</component>
    <component>uart_rx.luc</component>
    <component>cclk_detector.luc</component>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>avr_interface.luc</component>
    <component>uart_tx.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
