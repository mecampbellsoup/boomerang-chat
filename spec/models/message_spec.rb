require 'spec_helper'

describe Message do
  let(:message) { Message.new }

  it 'should have content' do
    subject.update(:content => "Hello, world!")
    expect(subject.content).to eq("Hello, world!")
  end

  it 'should be invalid without content' do
    expect(subject).to be_invalid
  end
end
