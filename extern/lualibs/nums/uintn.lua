-- Lua-nums @fef161a940aaafdbb8d9c75fe073b8bb43152474 | /nums/uintn.lua | https://github.com/user-none/lua-nums | License: MIT License | Minified using https://www.npmjs.com/package/luamin/v/1.0.4
-- Copyright (c) 2016 John Schember
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
local a={}local b={}local function c(d,e)local f=false;if not a.isuint(d)then d,e=e,d;f=true end;if a.isuint(e)then e=e._val else e=tonumber(e)end;return d:copy(),e,f end;local function g(h)if h._val==h._max then h._val=0 elseif h._val<0 or h._val>h._max then h._val=h._val%h._max end end;b.__index=a;b.__add=function(d,e)local i;d,e,i=c(d,e)if i then d._val=e+d._val else d._val=d._val+e end;g(d)return d end;b.__sub=function(d,e)local i;d,e,i=c(d,e)if i then d._val=e-d._val else d._val=d._val-e end;g(d)return d end;b.__mul=function(d,e)d,e=c(d,e)d._val=d._val*e;g(d)return d end;b.__div=function(d,e)return d//e end;b.__mod=function(d,e)local i;d,e,i=c(d,e)if i then d._val=e%d._val else d._val=d._val%e end;g(d)return d end;b.__pow=function(d,e)local i;d,e,i=c(d,e)if i then d._val=e^d._val else d._val=d._val^e end;g(d)return d end;b.__unm=function(d)d=d:copy()d._val=-d._val;g(d)return d end;b.__idiv=function(d,e)local i;d,e,i=c(d,e)if i and e==0 then d._val=0;return d end;if i then d._val=e//d._val else d._val=d._val//e end;g(d)return d end;b.__band=function(d,e)d,e=c(d,e)d._val=d._val&e;g(d)return d end;b.__bor=function(d,e)d,e=c(d,e)d._val=d._val|e;g(d)return d end;b.__bxor=function(d,e)d,e=c(d,e)d._val=d._val~e;g(d)return d end;b.__bnot=function(d)d=d:copy()d._val=~d._val;g(d)return d end;b.__shl=function(d,e)local i;d,e,i=c(d,e)if i then d._val=e<<d._val else d._val=d._val<<e end;g(d)return d end;b.__shr=function(d,e)local i;d,e,i=c(d,e)if i then d._val=e>>d._val else d._val=d._val>>e end;g(d)return d end;b.__concat=function(d,e)if a.isuint(d)and a.isuint(e)then return d._val..e._val elseif a.isuint(d)and not a.isuint(e)then return d._val..e end;return d..e._val end;b.__len=function(d)return d._bits end;b.__eq=function(d,e)d,e=c(d,e)return d._val==e end;b.__lt=function(d,e)local i;d,e,i=c(d,e)if i then return d._val>e end;return d._val<e end;b.__le=function(d,e)if d<e or d==e then return true end;return false end;b.__tostring=function(d)return tostring(d._val)end;local function j(k,l)local h=setmetatable({},b)h._bits=k;h._max=1<<h._bits;if l==nil then l=0 end;if a.isuint(l)then h._val=l._val else h._val=tonumber(l)end;g(h)return h end;function a.isuint(m)if type(m)=="table"and getmetatable(m)==b then return true end;return false end;function a.u8(n)return j(8,n)end;function a.u16(n)return j(16,n)end;function a.u32(n)return j(32,n)end;function a:copy()return j(self._bits,self._val)end;function a:set(l)if a.isuint(l)then self._val=l._val else self._val=tonumber(l)end;g(self)end;function a:swape()local n;local l=0;local m;n=self:asbytearray()for o=1,#n//2 do m=n[o]n[o]=n[#n-o+1]n[#n-o+1]=m end;m={}for o=#n,1,-1 do m[#m+1]=n[o]end;for o=1,#m do l=l|(m[o]<<o*8-8)end;return j(self._bits,l)end;function a:asnumber()return self._val end;function a:ashex(p)local q="%"if p~=nil then q=q.."0"..tostring(p)end;q=q.."X"return q:format(self._val)end;function a:asbytearray()local m={}for o=self._bits-8,0,-8 do m[#m+1]=self._val>>o&0xFF end;return m end;function a:asbytestring()local e;e=self:asbytearray()for o=1,#e do e[o]=string.char(e[o])end;return table.concat(e)end;return a