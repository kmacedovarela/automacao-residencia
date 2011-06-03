require "rubygems"
require "serialport"

#params for serial port
port_str = "/dev/tty.usbserial-A100eDTh"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

def altera_estado periferico

port_str = "/dev/tty.usbserial-A100eDTh"  #may be different for you
baud_rate = 9600
data_bits = 8 
stop_bits = 1 
parity = SerialPort::NONE

  sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

  
  if periferico.estado
    sp.write periferico.estado_ligado.chr
  else
    sp.write periferico.estado_desligado.chr
  end

  periferico.update_attribute(:estado, !periferico.estado)

  sp.close
end

