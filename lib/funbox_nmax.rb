require 'algorithms'
require 'gmp'

require "funbox_nmax/version"

module FunboxNmax
  module_function

  def n_max(n, io = $stdin)
    heap = Containers::MinHeap.new

    # TODO: consider using some other iteration method?
    io.each_line(' ', 2000) do |line|
      line.scan(/\d+/).each do |e|
        heap << GMP::Z.new(e)
        heap.pop if heap.length > n
      end
    end

    result = []
    result << heap.pop while heap.size.nonzero?
    result.reverse
  end
end
