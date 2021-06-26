require 'rails_helper'

RSpec.describe Destination, type: :model do
  before do
    @destination = create(:destination)
    @plan = @destination.plan
    @user = @plan.user
  end

  context 'バリデーション' do
    it 'plan_idが存在しなければ無効' do
      @destination.plan_id = nil
      expect(@destination).to be_invalid
    end

    it 'plan_idが存在すれば有効' do
      expect(@destination).to be_valid
    end

    it 'nameが存在しなければ無効' do
      @destination.name = nil
      expect(@destination).to be_invalid
    end

    it 'nameが31文字以上であれば無効' do
      @destination.name = 'a' * 31
      expect(@destination).to be_invalid
    end

    it 'nameが30文字以内であれば有効' do
      @destination.name = 'a' * 30
      expect(@destination).to be_valid
    end

    it 'descriptionが301文字以上であれば無効' do
      @destination.description = 'a' * 301
      expect(@destination).to be_invalid
    end

    it 'descriptionが300文字以内であれば有効' do
      @destination.description = 'a' * 300
      expect(@destination).to be_valid
    end
  end

  context 'dependent: :destroy' do
    it 'プラン削除時に関連した目的地も削除される' do
      expect do
        @plan.destroy
      end.to change { Destination.count }.by(-1)
    end

    it 'ユーザー削除時に関連したプランの目的地も削除される' do
      expect do
        @user.destroy
      end.to change { Destination.count }.by(-1)
    end
  end
end
