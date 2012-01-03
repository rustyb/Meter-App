require 'test_helper'

class MeterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Meter.new.valid?
  end
end
