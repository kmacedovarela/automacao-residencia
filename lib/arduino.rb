require "serialport"

module Arduino

  def alterar_estado_periferico periferico
    puts "Entrei no alterar_estado_periferico"
    #params for serial port
    port_str = "/dev/tty.usbserial-A700ewHI"  #may be different for you
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

    if periferico.estado
      puts "Mandando sinal para ligar: #{periferico.estado_ligado.chr}"
      sp.write periferico.estado_ligado.chr
    else
      puts "Mandando sinal para desligar: #{periferico.estado_desligado.chr}"
      sp.write periferico.estado_desligado.chr
    end

    periferico.update_attribute(:estado, !periferico.estado)
    puts "Fiz o update :-)" 

    sp.close
  end
end
