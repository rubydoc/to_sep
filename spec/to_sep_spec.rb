require File.expand_path('../spec_helper', __FILE__)

describe String do 
  it "#to_sep  should return separated charactors" do
    KoreanSeparator.split("안녕하세요.").should == "ㅇㅏㄴㄴㅕㅇㅎㅏㅅㅔㅇㅛ."
    KoreanSeparator.split("반갑습니다.").should == "ㅂㅏㄴㄱㅏㅂㅅㅡㅂㄴㅣㄷㅏ."
  end 
end
