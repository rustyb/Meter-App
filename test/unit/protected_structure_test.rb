require 'test_helper'

class ProtectedStructureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProtectedStructure.new.valid?
  end
end
