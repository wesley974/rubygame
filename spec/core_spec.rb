require 'spec_helper'

describe Core do
  before :each do
    @core = Core.new
  end

  it 'should have default value tries as 0' do
    expect(@core.instance_variable_get(:@tries)).to eql(0)
  end

  it 'should have secret range in between 1 and 100' do
    expect(@core.instance_variable_get(:@secret)).to be_between(1, 100)
  end
end
