require_relative '../lib/student'

describe Student do
  context 'we create the Student object and test it ' do
    let(:student) { Student.new('DataStructure', 23, 'Ali', parent_permission: false) }
    it 'Student name must be Ali' do
      expect(student.name).to eq('Ali')
    end
    it 'Student age must be 23' do
      expect(student.age).to be 23
    end
    it 'Student parent_permission must be false' do
      expect(student.parent_permission).to be false
    end
  end
end
