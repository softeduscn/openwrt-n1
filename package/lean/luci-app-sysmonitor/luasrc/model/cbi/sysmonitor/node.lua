nextvpn=luci.sys.exec("uci get sysmonitor.sysmonitor.nextvpn")
chkvpn=luci.sys.exec("uci get sysmonitor.sysmonitor.chkvpn")
shunt=luci.sys.exec("uci get sysmonitor.sysmonitor.shunt")
m = Map("sysmonitor",translate("VPN Nodes"))
s = m:section(TypedSection, "sysmonitor", "")
if tonumber(nextvpn) == 1 then
	box=' <input type="checkbox" checked="checked" />'
	check='Disable switch VPN'
else
	box=' <input type="checkbox" />'
	check='Enable switch VPN'	
end
if tonumber(chkvpn) == 1 then
	vpn=' <input type="checkbox" checked="checked" />'
	checkvpn='Disable URL check VPN'
else
	vpn=' <input type="checkbox" />'
	checkvpn='Enable URL check VPN'	
end
if tonumber(shunt) == 1 then
	myshunt=' <input type="checkbox" checked="checked" />'
	checkmyshunt='Disable shunt'
else
	myshunt=' <input type="checkbox" />'
	checkmyshunt='Enable shunt'	
end
s.description = '<table><style>.button1 {-webkit-transition-duration: 0.4s;transition-duration: 0.4s;padding: 1px 3px;text-align: center;background-color: white;color: black;border: 2px solid #4CAF50;border-radius:5px;}.button1:hover {background-color: #4CAF50;color: white;}.button1 {font-size: 11px;}</style><tr><td><button class="button1" title="Set switch VPN mode"><a href="/cgi-bin/luci/admin/sys/sysmonitor/sysmenu?sys=VPNswitch&sys1=&redir=node">'..translate(check)..'</a></button>'..box..' <button class="button1" title="Set URL check VPN mode"><a href="/cgi-bin/luci/admin/sys/sysmonitor/sysmenu?sys=URLchkVPN&sys1=&redir=node">'..translate(checkvpn)..'</a></button>'..vpn..' <button class="button1" title="Set shunt mode"><a href="/cgi-bin/luci/admin/sys/sysmonitor/sysmenu?sys=shunt&sys1=&redir=node">'..translate(checkmyshunt)..'</a></button>'..myshunt
s.anonymous = true

f = SimpleForm("sysmonitor")
f.reset = false
f.submit = false
f:append(Template("sysmonitor/node"))
return m,  f
