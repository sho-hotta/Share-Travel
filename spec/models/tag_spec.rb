require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = create(:tag)
  end

  context 'バリデーション' do
    it 'wordが存在しなければ無効' do
      @tag.word = nil
      expect(@tag).to be_invalid
    end

    it 'wordは一意である' do
      another_tag = @tag.dup
      expect(another_tag).to be_invalid
    end

    it 'wordが11文字以上であれば無効' do
      @tag.word = 'a' * 11
      expect(@tag).to be_invalid
    end

    it 'wordが10文字であれば有効' do
      @tag.word = 'a' * 10
      expect(@tag).to be_valid
    end
  end
end
