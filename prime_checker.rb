class BitField
  def initialize(n = 0, fill: false)
    @fill = !!fill
    @bits = []
    bits(n)
  end

  def get(i)
    bits(i)[i]
  end

  def set(i, b)
    bits(i)[i] = !!b
  end

  def length
    @bits.length
  end

  private

  def bits(n)
    extra = n - length
    @bits += Array.new(extra, @fill) if extra > 0
    @bits
  end
end

class PrimeChecker
  def initialize
    @checklist = BitField.new(3)
    @checklist.set(2, true)
    @free = @checklist.length
  end

  def prime?(n)
    return false if n < 0
    return @checklist.get(n) if n < @free
    # root = Math.sqrt(n).to_i
    ret = false
    (@free..n).each do |i|
      ret = prime_so_far?(i)
      @checklist.set(i, ret)
      @free = i + 1
    end
    ret
  end

  private

  def primes_so_far
    Enumerator.new do |y|
      (2...@free).each { |i| y.yield i if @checklist.get(i) }
    end
  end

  def prime_so_far?(n)
    primes_so_far.none? { |p| n % p == 0 }
  end
end
