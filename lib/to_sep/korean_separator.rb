class KoreanSeparator
  def self.split string
    self.new(string).split
  end

  def initialize string
    @string = string
  end

  def split
    @string.split('').inject("") do |string, ch|
      if ch.korean?
        string += (sep_by ch)
      else
        string += ch
      end
    end
  end

  def sep_by ch
    unicode = ch.to_unicode
    i = initial_consonant[ (unicode-offset) / 
                    (vowel.length * final_consonant.length) ] 
    v = vowel[((unicode-offset) %
                      (vowel.length * final_consonant.length)) /
                          final_consonant.length ]
    f = final_consonant[ (unicode-offset) % final_consonant.length ]
   
    [i, v, f].join.strip
  end

  def unicode_composite u_initial_consonant, u_vowel, u_final_consonant
    i = initial_consonant.index u_initial_consonant.unicode_chr
    v = vowel.index u_vowel.unicode_chr
    f = final_consonant.index u_final_consonant.unicode_chr
    unicode = offset  +  (i * 588) + (v * 28) + (f)
    unicode.unicode_chr
  end

  def offset
    "가".to_unicode
  end
  
  # 초성
  def initial_consonant
    ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
  end

  # 중성
  def vowel
    ["ㅏ","ㅐ","ㅑ","ㅒ","ㅓ","ㅔ","ㅕ","ㅖ","ㅗ","ㅘ",
     "ㅙ","ㅚ","ㅛ","ㅜ","ㅝ","ㅞ","ㅟ","ㅠ","ㅡ","ㅢ","ㅣ"]
  end

  # 종성
  def final_consonant 
    [" ","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ",
     "ㄻ","ㄼ","ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ",
     "ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
  end
end