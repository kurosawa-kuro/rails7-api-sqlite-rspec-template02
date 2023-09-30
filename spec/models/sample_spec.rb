require 'rails_helper'

RSpec.describe Sample, type: :model do
  # サンプルモデルのインスタンスを生成
  subject { described_class.new(title: "Valid Title") }

  # titleが存在する場合、有効であること
  it "is valid with a title" do
    expect(subject).to be_valid
  end

  # titleが存在しない場合、無効であること
  it "is not valid without a title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end
end
