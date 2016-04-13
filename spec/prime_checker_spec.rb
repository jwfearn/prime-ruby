require 'rspec'
require_relative '../prime_checker'

RSpec.describe BitField do
end

RSpec.describe PrimeChecker do
  let(:checker) { described_class.new }

  it 'returns false for numbers less than two' do
    expect(checker.prime?(-1)).to be false
    expect(checker.prime?(0)).to be false
    expect(checker.prime?(1)).to be false
  end

  it 'returns true for known primes' do
    # require 'pry'; binding.pry
    expect(checker.prime?(2)).to be true
    expect(checker.prime?(3)).to be true
    expect(checker.prime?(11)).to be true
    expect(checker.prime?(5)).to be true
    expect(checker.prime?(7)).to be true
  end

  it 'returns false for known composites' do
    expect(checker.prime?(4)).to be false
    expect(checker.prime?(6)).to be false
    expect(checker.prime?(8)).to be false
    expect(checker.prime?(9)).to be false
    expect(checker.prime?(10)).to be false
  end
end
