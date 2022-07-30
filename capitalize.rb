require_relative('./decorator')
class Capitalize < Decorator
  def correct_name
    @neameabl.correct_name.capitalize
  end
end
