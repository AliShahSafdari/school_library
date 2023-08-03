require_relative '../lib/teacher'

describe Teacher do
  context 'we create the Teacher object and test it ' do
    let(:teacher) { Teacher.new('Programming', 30, 'Mohammad') }
    it 'Teacher name must be Mohammad' do
      expect(teacher.name).to eq('Mohammad')
    end
    it 'Teacher age must be 30' do
      expect(teacher.age).to be 30
    end
    it 'Teacher can_use_services must be true' do
      expect(teacher.can_use_services?).to eq(true)
    end

    it 'Teacher specialization must be Programming' do
      expect(teacher.specialization).to eq('Programming')
    end
  end
end
