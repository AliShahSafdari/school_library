require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    owner.animals.push(self) unless owner.animals.include?(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    owner.animals.push(self) unless owner.animals.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
