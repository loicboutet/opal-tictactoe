require 'vienna/template_view'

class CaseView < Vienna::TemplateView
  template :case

  on :click do
    @app.play_turn(@x, @y)
  end

  def initialize(app, x, y)
    @app = app
    @x = x
    @y = y
  end

  def render
    super
  end

  def tag_name
    :td
  end

  def class_name
    :case
  end
end
