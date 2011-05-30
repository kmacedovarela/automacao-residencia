require "rubygems"
require "serialport"

#params for serial port
port_str = "/dev/tty.usbserial-A100eDTh"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

while true do
  sp.write 1
  sleep 1
  sp.write 0

  sleep 1
end

sp.close

