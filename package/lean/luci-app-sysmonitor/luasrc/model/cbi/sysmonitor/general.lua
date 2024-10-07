
local m

m = Map("sysmonitor",translate("General Settings"))

s = m:section(TypedSection, "sysmonitor")
s.anonymous = true

o = s:option(Value, "systime", translate("Check system time(s)"))
o.rmempty = false

o = s:option(Value, "nextvpntime", translate("Switch VPN time(m)"))
o.rmempty = false

o = s:option(Value, "chkprog", translate("Check delay_prog time(s)"))
o.rmempty = false

o = s:option(Value, "firmware", translate("Download firmware url"))
o.rmempty = false

o = s:option(Value, "mosdns_url", translate("Update Mosdns-data url"))
o.rmempty = false

return m
