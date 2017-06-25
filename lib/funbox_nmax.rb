require 'algorithms'
require 'gmp'

require "funbox_nmax/version"

module FunboxNmax
  module_function

  def n_max(n, io = $stdin)
    heap = Containers::MinHeap.new

    numbers_from_io(io) do |num|
      heap << num
      heap.pop if heap.size > n
    end

   result = []
    result << heap.pop while heap.size.nonzero?
    result.reverse
  end

  def numbers_from_io(io)
    numstr = ''
    io.each_char do |c|
      if ('0'..'9').cover?(c)
        numstr << c
      elsif !numstr.empty?
        yield int(numstr)
        numstr = ''
      end
    end
    yield int(numstr) unless numstr.empty?
  end

  def int(s)
    GMP::Z.new(s, 10)
  end
end
