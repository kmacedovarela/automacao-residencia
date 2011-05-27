require 'spec_helper'

describe Preset do

  before do
    Factory.create :preset
  end

  context 'quando referente a validação dos campos' do
    it { should validate_presence_of :nome }
    it { should belong_to :residencia }

    it { should validate_uniqueness_of :nome }
  end

end

