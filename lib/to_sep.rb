require "to_sep/version"
require "to_sep/korean_separator"

module ToSep
  def to_unicode
    self.unpack("U*").first
  end

  def korean?
    if (self.match(/[ㄱ-힇]/)) 
      if self.match(/[ㄱ-ㅎ]/) or self.match(/[ㅏ-ㅣ]/)
        false
      else
        true
      end
    else
      false
    end
  end

  def to_sep
    KoreanSeparator.split(self)
  end
end

class Fixnum
  def unicode_chr 
    self.chr(Encoding::UTF_8)
  end  
end

class String
  include ToSep
end

