require_relative 'person'

class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
student = Student.new('A class ', 18, 'Ali', parent_permission: false)
puts student.id
