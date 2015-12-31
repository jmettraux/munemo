
# munemo

[![Build Status](https://secure.travis-ci.org/jmettraux/munemo.png)](http://travis-ci.org/jmettraux/raabro)

A port of [mnemo](https://github.com/flon-io/mnemo) from C to Ruby. Mnemo and munemo are reworked versions of [rufus-mnemo](https://github.com/jmettraux/rufus-mnemo).

Munemo uses the following syllables to map integer numbers to strings.
```ruby
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
```
The syllable `xa` prefixes negative numbers.

Interface:
```ruby
# Munemo.to_s(i)

Munemo.to_s(0) # => 'ba'
Munemo.to_s(1) # => 'bi'
Munemo.to_s(99) # => 'zo'
Munemo.to_s(100) # => 'biba'
Munemo.to_s(101) # => 'bibi'
Munemo.to_s(392406) # => 'kogochi'
Munemo.to_s(25437225) # => 'haleshuha'

Munemo.to_s(-1) # => 'xabi'
Munemo.to_s(-99) # => 'xazo'
Munemo.to_s(-100) # => 'xabiba'


# Munemo.to_i(s)

Munemo.to_i('blah blah blah')
  # => ArgumentError: "unknown syllable 'bl'"

Munemo.to_i('xabixabi')
  # => ArgumentError: "unknown syllable 'xa'"

Munemo.to_i('yoshida') # => 947110
Munemo.to_i('bajo') # => 34
Munemo.to_i('xabaji') # => -31
Munemo.to_i('tonukatsu') # => 79523582
```

## LICENSE

MIT, see [LICENSE.txt](LICENSE.txt)

