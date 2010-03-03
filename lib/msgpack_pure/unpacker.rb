# coding: utf-8

require "stringio"

module MessagePackPure
  module Unpacker
  end
end

module MessagePackPure::Unpacker
  def self.unpack(io)
    type = io.read(1).unpack("C")[0]

    if (type & 0b10000000) == 0b00000000 # positive fixnum
      return type
    end

    return nil
  end
end
