require 'rails_helper'

describe Contact do

  # タイトルがあれば有効な状態であること
  it "is valid with name and email" do
    contact = Contact.new(name: '', email: '', content: '問い合わせです')
    expect(contact).to be_valid
  end

  #タイトルがなければ無効であること
  it "is invalid without a name and an email" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end
end
