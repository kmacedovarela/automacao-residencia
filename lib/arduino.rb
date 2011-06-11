require "serialport"

module Arduino

  def alterar_estado_periferico periferico, estado = !periferico.estado
    puts "Entrei no alterar_estado_periferico"
    #params for serial port
    port_str = "/dev/tty.usbserial-A700ewHI"  #may be different for you
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    
    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    
    if estado.class == String
      estado = estado == "ligado" ? true : false
    end
    estado_na_arduino = periferico.estado ? periferico.estado_ligado.chr : periferico.estado_desligado.chr

    sp.write estado_na_arduino
    periferico.update_attribute(:estado, estado)

    sp.close
  end
end
