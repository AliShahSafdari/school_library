require_relative 'nameable'
require_relative 'base_decrator'
require_relative 'capitalize_decrator'
require_relative 'trimmer_decrator'

class Person < Nameable
  def initialize(age, name = nil, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name || 'unknown'
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id

  attr_accessor :name, :age

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
