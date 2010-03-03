# coding: utf-8

# MessagePack format specification
# http://msgpack.sourceforge.jp/spec

module MessagePackPure
  module Packer
  end
end

module MessagePackPure::Packer
  def self.pack(io, value)
    case value
    when NilClass   then self.pack_nil(io)
    when TrueClass  then self.pack_true(io)
    when FalseClass then self.pack_false(io)
    when Integer    then self.pack_fixnum(io, value)
    end
    return io
  end

  def self.pack_fixnum(io, num)
    case num
    when (-32..127)
      io.write([num].pack("C"))
    when (0x00..0xFF)
      io.write("\xCC")
      io.write([num].pack("C"))
    when (0x0000..0xFFFF)
      io.write("\xCD")
      io.write([num].pack("n"))
    else
      io.write("\xCE")
      io.write([num].pack("N"))
    end
    return io
  end

  def self.pack_nil(io)
    io.write("\xC0")
    return io
  end

  def self.pack_true(io)
    io.write("\xC3")
    return io
  end

  def self.pack_false(io)
    io.write("\xC2")
    return io
  end
end
