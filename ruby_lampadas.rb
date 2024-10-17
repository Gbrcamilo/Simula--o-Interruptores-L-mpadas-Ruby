class Lampada
  attr_accessor :estado, :temperatura

  def initialize
    @estado = false # false para desligada, true para ligada
    @temperatura = "fria" # "fria" ou "quente"
  end

  # Simula o aquecimento da lâmpada quando ligada por um tempo
  def ligar
    @estado = true
    @temperatura = "quente"
  end

  # Simula esfriar quando desligada
  def desligar
    @estado = false
    @temperatura = "fria"
  end
end

class Sala
  attr_accessor :lampadas

  def initialize
    @lampadas = [Lampada.new, Lampada.new, Lampada.new]
  end

  # Método para controlar as lâmpadas via interruptor
  def controlar_lampada(index, acao)
    case acao
    when :ligar
      @lampadas[index].ligar
    when :desligar
      @lampadas[index].desligar
    end
  end

  # Checa o estado das lâmpadas e retorna qual interruptor controla qual
  def identificar_lampadas
    lampada_ligada = lampadas.find_index { |l| l.estado == true }
    lampada_quente = lampadas.find_index { |l| l.estado == false && l.temperatura == "quente" }
    lampada_fria = lampadas.find_index { |l| l.estado == false && l.temperatura == "fria" }

    {
      "Interruptor 1" => lampada_quente ? lampada_quente + 1 : nil,
      "Interruptor 2" => lampada_ligada ? lampada_ligada + 1 : nil,
      "Interruptor 3" => lampada_fria ? lampada_fria + 1 : nil
    }
  end
end

# Exemplo de execução
sala = Sala.new

# Passo 1: Ligar a primeira lâmpada por um tempo e depois desligar
sala.controlar_lampada(0, :ligar)
sleep(5) # Simula o tempo para a lâmpada esquentar
sala.controlar_lampada(0, :desligar)

# Passo 2: Ligar a segunda lâmpada e deixar ligada
sala.controlar_lampada(1, :ligar)

# Agora vá até a sala e identifique qual interruptor controla qual lâmpada
resultado = sala.identificar_lampadas
puts "Resultado: #{resultado}"
