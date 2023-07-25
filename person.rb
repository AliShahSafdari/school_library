class Person
  def initialize(age, name = nil, parent_permission: true)
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
end
