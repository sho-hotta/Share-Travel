require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context 'バリデーション' do
    before do
      @bookmark = create(:bookmark)
    end

    it 'user_idが存在しなければ無効' do
      @bookmark.user_id = nil
      expect(@bookmark).to be_invalid
    end

    it 'plan_idが存在しなければ無効' do
      @bookmark.plan_id = nil
      expect(@bookmark).to be_invalid
    end

    it 'user_idとplan_idの組み合わせは一意である' do
      another_bookmark = @bookmark.dup
      expect(another_bookmark).to be_invalid
    end
  end
end
