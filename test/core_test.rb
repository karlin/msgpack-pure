#! ruby -Ku
# coding: utf-8

require "test_helper"
require "msgpack_pure/core"

class CoreTest < Test::Unit::TestCase
  def setup
    @module = MessagePackPure
  end

  def test_pack
    assert_equal("\x00", @module.pack(0))
  end

  def test_unpack
    assert_equal(0, @module.unpack("\x00"))
  end
end
