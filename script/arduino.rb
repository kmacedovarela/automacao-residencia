require "rubygems"
require "serialport"

#params for serial port
port_str = "/dev/tty.usbserial-A100eDTh"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
#sp.write [1,2,3].chr.to_s
sp.write 10.chr

sp.close


def altera_estado periferico
  sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

  sp.write periferico.pino.chr
  sp.close
end

