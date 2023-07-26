# require_relative 'base_decrator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length < 11
      @nameable.correct_name
    else
      @nameable.correct_name.strip
    end
  end
end
