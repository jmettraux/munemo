#--
# Copyright (c) 2015-2016, John Mettraux, jmettraux@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# Made in Japan.
#++


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

