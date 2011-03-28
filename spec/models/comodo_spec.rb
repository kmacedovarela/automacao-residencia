require 'spec_helper'

describe Comodo do
  
  context 'quando referente a associações' do
    it { should belong_to(:residencia) }
    it { should have_many(:perifericos) }
  end
  
end
