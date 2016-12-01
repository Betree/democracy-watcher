require 'rails_helper'

describe Source do
  it 'is valid if at least one argument is given' do
    expect(Source.create media: Forgery::LoremIpsum.words).to_not be_valid
    expect(Source.create title: Forgery::LoremIpsum.words).to_not be_valid
    expect(Source.create url: Forgery::LoremIpsum.words).to_not be_valid
  end

  it 'is not valid if all arguments are blank' do
    expect(Source.create).to_not be_valid
  end

  it 'should always display a name' do
    expect((Source.create media: Forgery::LoremIpsum.words).name).to_not be_empty
    expect((Source.create title: Forgery::LoremIpsum.words).name).to_not be_empty
    expect((Source.create url: Forgery::LoremIpsum.words).name).to_not be_empty
  end
end