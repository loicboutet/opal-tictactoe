require 'opal'
require 'jquery'
require 'opal-jquery'
require 'opal-haml'
require 'vienna'

require 'views/app_view'
require 'views/case_view'

require 'templates/footer'
require 'templates/case'

require 'models/player'
require 'models/game'

class Application
  def run
    @app_view = AppView.new
    router.update
  end

  def router
    @router ||= Vienna::Router.new.tap do |router|
      router.route('/new_game') do 
        @app_view.new_game
      end
    end
  end

end

# when document is ready, lets go!
Document.ready? do
  Application.new.run
end
