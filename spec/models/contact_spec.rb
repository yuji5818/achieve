require 'rails_helper'

describe Contact do

  it "nameが空欄ならエラー" do
    contact = Contact.new(name: '', email: 'yuji0000@test.com', content: '問い合わせです')
    expect(contact).not_to be_valid
  end

  it "emailが空欄ならエラー" do
    contact = Contact.new(name: '秦野', email: '', content: '問い合わせです')
    expect(contact).not_to be_valid
  end

  it "問い合わせが空欄ならエラー" do
    contact = Contact.new(name: '秦野', email: 'yuji0000@test.com', content: '')
    expect(contact).not_to be_valid
  end

  it "全てフォーム欄を満たしていると成功" do
    contact = Contact.new(name: '秦野', email: 'yuji0000@test.com', content: '問い合わせです')
    expect(contact).to be_valid
  end
end
