require_relative 'user_interface.rb'

class SceneBase
  def initialize
    @single_scene = nil
    @ui = UiCommons.new
  end

  def run
    @ui.loading(1)
    sleep(2)
  end
end
