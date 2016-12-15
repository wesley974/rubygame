require 'spec_helper'

describe Core do
  before :each do
    @core = Core.new
  end

  it 'should have default value tries as 0' do
    @core.tries.must_equal 0
  end

  it 'should have secret range in between 1 and 100' do
    (1..100).must_include @core.instance_variable_get(:@secret)
  end
end
