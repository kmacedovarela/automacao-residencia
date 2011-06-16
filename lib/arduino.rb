require "serialport"

module Arduino

  def alterar_estado_periferico periferico, estado = !periferico.estado

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

    if estado
        estado_na_arduino = periferico.estado_ligado
    else
        estado_na_arduino = periferico.estado_desligado
    end

    puts "sem o chr: #{estado_na_arduino}"
    estado_na_arduino = estado_na_arduino.chr

    puts "estado na arduino #{estado_na_arduino}"
    sp.write estado_na_arduino
    puts "estado sendo atualizado #{estado}"
    periferico.update_attribute(:estado, estado)

    sp.close
  end
end
