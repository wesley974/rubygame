require 'spec_helper'
require_relative '../lib/format'

describe Format do
  before :each do
  end

  it 'text' do
    expected = 'My title'
    actual = Format.text(title: "My title")
    actual.must_include expected
  end
end
