require "minitest/autorun"
require "./helper"

class TestNSReturnsRetained < MiniTest::Test
  def setup
    @bs = gen_bridge_metadata("ns_returns_retained.h")
  end

  def test_objc_methods
    klass = @bs["class"].first

    method1 = klass["method"][0]
    assert_equal(method1["retval"][0]["already_retained"], "true")

    method2 = klass["method"][1]
    assert_equal(method2["retval"][0]["already_retained"], "false")

    method3 = klass["method"][2]
    assert_equal(method3["retval"][0]["already_retained"], nil)

    method4 = klass["method"][3]
    assert_equal(method4["retval"][0]["already_retained"], "false")
  end

  def test_functions
    func = @bs["function"][0]
    assert_equal(func["retval"][0]["already_retained"], "true")
  end

end
