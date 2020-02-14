require_relative 'data_formatter.rb'
require_relative 'santafe_events.rb'
require_relative 'menu.rb'

class SceneManager
  def initialize
    @single_scene = nil
    @ui = UiCommons.new
    @app_state = 1
    @single_scene = MenuScene.new
  end

  def run
    puts "\e[H\e[2J"
    @ui.loading(1)
    sleep(2)
    while @app_state == 1
      case @single_scene.run
      when 0
        @single_scene = MenuScene.new
      when 2
        @single_scene = SantaFe.new
      when 5
        exit
      end
      puts "\e[H\e[2J"
      @single_scene.run
    end
  end
end
