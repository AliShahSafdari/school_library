require_relative '../lib/classroom'

describe Classroom do
  context 'we create the Classroom object and test it ' do
    let(:classroom) { Classroom.new("English")}
    before :each do
        @classroom = Classroom.new('CSD21')
    end
    it 'Classroom label must be English' do
      expect(classroom.label).to eq('English')
    end
    it 'checking classroom instance' do
      expect(classroom).to be_instance_of Classroom
    end
    
    it 'test for add student' do
        student = double('student')
        allow(student).to receive(:age) { '24' }
        allow(student).to receive(:name) { 'Nasir' }
        allow(student).to receive(:parent_permission) { true }
        allow(student).to receive(:classroom=).and_return(Classroom)
        expect(@classroom.add_student(student).students[0].name).to eq('Nasir')
    end
  end
end
