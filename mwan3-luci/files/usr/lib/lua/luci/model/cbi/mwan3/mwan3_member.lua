-- ------ member configuration ------ --

ds = require "luci.dispatcher"


m5 = Map("mwan3", translate("MWAN3 Multi-WAN Member Configuration"))
	m5:append(Template("mwan3/mwan3_config_css"))


mwan_member = m5:section(TypedSection, "member", translate("Members"),
	translate("Members are profiles attaching a metric and weight to an MWAN3 interface<br />" ..
	"Names may contain characters A-Z, a-z, 0-9, _ and no spaces<br />" ..
	"Members may not share the same name as configured interfaces, policies or rules"))
	mwan_member.addremove = true
	mwan_member.dynamic = false
	mwan_member.sectionhead = "Member"
	mwan_member.sortable = true
	mwan_member.template = "cbi/tblsection"
	mwan_member.extedit = ds.build_url("admin", "network", "mwan3", "configuration", "member", "%s")
	function mwan_member.create(self, section)
		TypedSection.create(self, section)
		m5.uci:save("mwan3")
		luci.http.redirect(ds.build_url("admin", "network", "mwan3", "configuration", "member", section))
	end


interface = mwan_member:option(DummyValue, "interface", translate("Interface"))
	interface.rawhtml = true
	function interface.cfgvalue(self, s)
		return self.map:get(s, "interface") or "<font size=\"+4\">-</font>"
	end

metric = mwan_member:option(DummyValue, "metric", translate("Metric"))
	metric.rawhtml = true
	function metric.cfgvalue(self, s)
		return self.map:get(s, "metric") or "<font size=\"+4\">-</font>"
	end

weight = mwan_member:option(DummyValue, "weight", translate("Weight"))
	weight.rawhtml = true
	function weight.cfgvalue(self, s)
		return self.map:get(s, "weight") or "<font size=\"+4\">-</font>"
	end


return m5
