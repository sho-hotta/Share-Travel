require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'バリデーション' do
    before do
      @like = create(:like)
    end

    it 'user_idが存在しなければ無効' do
      @like.user_id = nil
      expect(@like).to be_invalid
    end

    it 'plan_idが存在しなければ無効' do
      @like.plan_id = nil
      expect(@like).to be_invalid
    end

    it 'user_idとplan_idの組み合わせは一意である' do
      another_like = @like.dup
      expect(another_like).to be_invalid
    end
  end
end
