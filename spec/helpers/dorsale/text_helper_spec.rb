require 'rails_helper'

describe Dorsale::TextHelper, type: :helper do
  it "hours" do
    expect(hours(nil)).to be nil
    expect(hours(1)).to eq "1,00 heure"
    expect(hours(3)).to eq "3,00 heures"
    expect(hours(3.5)).to eq "3,50 heures"
    expect(hours(3.123)).to eq "3,12 heures"
  end

  it "number" do
    expect(number(nil)).to be nil
    expect(number(1)).to eq "1"
    expect(number(1.2)).to eq "1,20"
    expect(number(1.234)).to eq "1,23"
    expect(number(123456.789)).to eq "123 456,79"
  end

  it "percentage" do
    expect(percentage(nil)).to be nil
    expect(percentage(1)).to eq "1 %"
    expect(percentage(1.123)).to eq "1,12 %"
  end

  it "euros" do
    expect(euros(nil)).to be nil
    expect(euros(1)).to eq "1 €"
    expect(euros(1.123)).to eq "1,12 €"
  end

  it "text2html" do
    expect(text2html(nil)).to be nil
    expect(text2html(" \n")).to be nil
    expect(text2html("hello\nworld")).to eq "hello<br />world"
    expect(text2html("hello\r\nworld")).to eq "hello<br />world"
    expect(text2html("\n\nhello\nworld\n\n\n")).to eq "hello<br />world"
    expect(text2html("<b>hello</b> world")).to eq "hello world"
  end

end
