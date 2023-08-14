require 'rspec'
require '../digit'

RSpec.describe Digit do
  context 'With some cases' do
    let(:object) { described_class.new }

    it 'expects 7' do
      response = object.sum(16)
      expect(response).to eq(7)
    end

    it 'expects 6' do
      response = object.sum(942)
      expect(response).to eq(6)
    end

    it 'expects 9' do
      response = object.sum(9999999999)
      expect(response).to eq(9)
    end
  end
end
