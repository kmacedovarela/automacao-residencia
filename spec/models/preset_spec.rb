require 'spec_helper'

describe Preset do

  context 'quando referente a validação dos campos' do
    it { should validate_presence_of :nome }
    it { should belong_to :residencia }
  end

end

