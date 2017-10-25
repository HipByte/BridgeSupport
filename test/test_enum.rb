require "minitest/autorun"
require "./helper"

class TestEnum < MiniTest::Test
  def setup
    @bs = gen_bridge_metadata("enum.h")
  end

  def test_enum_RM886
    klass = @bs["class"].first
    assert_equal(klass["name"], "Foo")

    method = klass["method"][0]
    assert_equal(method["selector"], "foo:")

    enum = @bs["enum"]
    assert_equal(enum[0]["name"], "ASScrollDirectionNone")
    assert_equal(enum[0]["value"], "0")
  end

  def test_enum_RM479
    enum = @bs["enum"]
    assert_equal(enum[1]["name"], "FooBarBaz")
    assert_equal(enum[1]["value"], "42")
  end

end
