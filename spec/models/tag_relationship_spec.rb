require 'rails_helper'

RSpec.describe TagRelationship, type: :model do
  before do
    @tag_relationship = create(:tag_relationship)
  end

  context 'バリデーション' do
    it 'plan_idが存在しなければ無効' do
      @tag_relationship.plan_id = nil
      expect(@tag_relationship).to be_invalid
    end

    it 'tag_idが存在しなければ無効' do
      @tag_relationship.tag_id = nil
      expect(@tag_relationship).to be_invalid
    end

    it 'plan_idとtag_idの組み合わせは一意である' do
      another_tag_relationship = @tag_relationship.dup
      expect(another_tag_relationship).to be_invalid
    end
  end
end
