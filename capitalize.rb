require_relative('./decorator')
class Capitalize < Decorator
  def correct_name
    @neameable.correct_name.capitalize
  end
end
