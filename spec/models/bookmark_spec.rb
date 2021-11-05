require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  before do
    @bookmark = create(:bookmark)
  end

  context 'バリデーション' do
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

  context 'dependent: :destroy' do
    it 'プラン削除時に関連したブックマークも削除される' do
      expect do
        @bookmark.plan.destroy
      end.to change { Bookmark.count }.by(-1)
    end

    it 'ユーザー削除時に関連したブックマークも削除される' do
      expect do
        @bookmark.user.destroy
      end.to change { Bookmark.count }.by(-1)
    end
  end
end
