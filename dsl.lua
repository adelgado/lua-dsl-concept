INTERFACES = {}

function eth1(ip)
	return function (mask)
		e         = {}
		e.ip      = ip
		e.netmask = mask
		INTERFACES.eth1 = e
	end
end

function interfaces(config)
	for name in pairs(config) do
		load(name .. '()')
	end
end

dofile 'network.conf'

for name, value in pairs(INTERFACES) do
	print(name)
	
	for k, v in pairs(value) do
		print(k .. ":\t" .. v)
	end
	print('\r\n')
end
