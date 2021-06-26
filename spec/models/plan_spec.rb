require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = create(:plan)
    @user = @plan.user
  end

  context 'バリデーション' do
    it 'user_idが存在しなければ無効' do
      @plan.user_id = nil
      expect(@plan).to be_invalid
    end

    it 'user_idが存在すれば有効' do
      expect(@plan).to be_valid
    end

    it 'titleが存在しなければ無効' do
      @plan.title = nil
      expect(@plan).to be_invalid
    end

    it 'titleが31文字以上であれば無効' do
      @plan.title = 'a' * 31
      expect(@plan).to be_invalid
    end

    it 'titleが30文字であれば有効' do
      @plan.title = 'a' * 30
      expect(@plan).to be_valid
    end

    it 'regionが存在しなければ無効' do
      @plan.region = nil
      expect(@plan).to be_invalid
    end

    it 'regionが存在すれば有効' do
      expect(@plan).to be_valid
    end

    it 'prefectureが存在しなければ無効' do
      @plan.prefecture = nil
      expect(@plan).to be_invalid
    end

    it 'prefectureが存在すれば有効' do
      expect(@plan).to be_valid
    end
  end

  context 'dependent: :destroy' do
    it 'ユーザー削除時に関連したプランも削除される' do
      expect do
        @user.destroy
      end.to change { Plan.count }.by(-1)
    end
  end
end
