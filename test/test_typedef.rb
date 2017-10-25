require "minitest/autorun"
require "./helper"

class TestTypedef < MiniTest::Test
  def setup
    @bs = gen_bridge_metadata("typedef.h")
  end

  def test_typedef
    struct = @bs["struct"]
    assert_equal(struct[0]["name"], "NSPoint")
  end

end
