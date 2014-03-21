require File.expand_path('../../spec_helper', __FILE__)

describe KoreanSeparator do 
  it ".split should return separated charactors" do
    KoreanSeparator.split("안녕하세요.").should == "ㅇㅏㄴㄴㅕㅇㅎㅏㅅㅔㅇㅛ."
    KoreanSeparator.split("반갑습니다.").should == "ㅂㅏㄴㄱㅏㅂㅅㅡㅂㄴㅣㄷㅏ."
  end
  
  it "#sep_by should return separated charactors for just a charactor" do
    korean_separator = KoreanSeparator.new("Something")
    korean_separator.sep_by("안").should == "ㅇㅏㄴ"
  end

  it "#unicode_composite should return a charactor that composition of [u_initial_consonant, u_vowel, u_final_consonant]" do
    korean_separator = KoreanSeparator.new("Something")
    korean_separator.unicode_composite("ㅇ".to_unicode, "ㅏ".to_unicode, "ㄴ".to_unicode).should == "안"
  end
end