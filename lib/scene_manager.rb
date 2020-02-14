require_relative 'data_formatter.rb'
require_relative 'menu.rb'

class SceneManager
  def initialize
    @single_scene = nil
    @ui = UiCommons.new
    @app_state = 1
  end

  def run
    @ui.loading(1)
    sleep(2)
    while @app_state == 1
      @single_scene = MenuScene.new
      case @single_scene.run
      when 5
        exit
      end
    end
  end
end
