require 'rails_helper'

RSpec.describe Perspective do
  fixtures :perspectives

  it 'has valid fixture data' do
    perspectives.each do |perspective_fixture|
      expect(perspective_fixture).to be_valid
    end
  end

  describe 'validations' do
    it 'requires a title' do
      perspective = perspectives(:valid)
      perspective.title = nil

      expect(perspective).not_to be_valid
      expect(perspective.errors[:title]).to include("can't be blank")
    end

    it 'requires a description' do
      perspective = perspectives(:valid)
      perspective.description = nil

      expect(perspective).not_to be_valid
      expect(perspective.errors[:description]).to include("can't be blank")
    end

    it 'needs the title to be at most 100 characters' do
      perspective = perspectives(:valid)
      perspective.title = 'x' * 100
      expect(perspective).to be_valid

      perspective.title = 'x' * 101
      expect(perspective).not_to be_valid
      expect(perspective.errors[:title]).to include(/^is too long/)
    end
  end
end
