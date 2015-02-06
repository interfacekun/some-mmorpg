local sparser = require "sprotoparser"

local login_proto = {}

login_proto.c2s = sparser.parse [[
.package {
	type 0 : integer
	session 1 : integer
}

handshake 1 {
	request {
		name 0 : string
		client_pub 1 : string
	}
	response {
		errno 0 : integer
		salt 1 : string
		server_pub 2 : string
	}
}

register 2 {
	request {
		name 0 : string
		password 1 : string
	}
	response {
		errno 0 : integer
		id 1 : integer
		token 2 : string
	}
}

login 3 {
	request {
		name 0 : string
		password 1 : string
	}
	response {
		errno 0 : integer
		id 1 : integer
		token 2 : string
	}
}

]]

login_proto.s2c = sparser.parse [[
.package {
	type 0 : integer
	session 1 : integer
}
]]

return login_proto