require_relative('./decorator')
class Trimmer < Decorator
  def correct_name
    @nameable[0...9] if @nameable
  end
end
