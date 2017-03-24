
require 'stringio'


module Munemo

  VERSION = '1.0.1'

  SYLS = %w[
     ba  bi  bu  be  bo
    cha chi chu che cho
     da  di  du  de  do
     fa  fi  fu  fe  fo
     ga  gi  gu  ge  go
     ha  hi  hu  he  ho
     ja  ji  ju  je  jo
     ka  ki  ku  ke  ko
     la  li  lu  le  lo
     ma  mi  mu  me  mo
     na  ni  nu  ne  no
     pa  pi  pu  pe  po
     ra  ri  ru  re  ro
     sa  si  su  se  so
    sha shi shu she sho
     ta  ti  tu  te  to
    tsa tsi tsu tse tso
     wa  wi  wu  we  wo
     ya  yi  yu  ye  yo
     za  zi  zu  ze  zo
  ]
  SYL_COUNT = SYLS.count
  NEG = 'xa'


  def self.tos(i, sio)

    mod = i % SYL_COUNT
    rst = i / SYL_COUNT

    tos(rst, sio) if rst > 0

    sio.print(SYLS[mod])
  end

  def self.to_s(i)

    sio = StringIO.new

    if i < 0
      sio.print(NEG)
      i = -i
    end

    tos(i, sio)

    sio.string
  end

  def self.to_i(s)

    sign = 1
    result = 0

    if s[0, 2] == NEG
      sign = -1
      s = s[2..-1]
    end

    loop do
      break if s.length < 1
      i = SYLS.index(s[0, 2]) || SYLS.index(s[0, 3])
      fail ArgumentError.new("unknown syllable '#{s[0, 2]}'") unless i
      result = SYL_COUNT * result + i
      s = s[SYLS[i].length..-1]
    end

    sign * result
  end
end

