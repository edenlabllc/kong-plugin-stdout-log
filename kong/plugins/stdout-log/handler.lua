local cjson = require "cjson"
local basic_serializer = require "kong.plugins.log-serializers.basic"

local BasePlugin = require "kong.plugins.base_plugin"
local StdoutLogHandler = BasePlugin:extend()

StdoutLogHandler.PRIORITY = 9
StdoutLogHandler.VERSION = "0.0.1"

function StdoutLogHandler:new()
  StdoutLogHandler.super.new(self, "stdout-log")
end

function StdoutLogHandler:log(conf)
  StdoutLogHandler.super.log(self)
  local message = basic_serializer.serialize(ngx)
  print(cjson.encode(message))
end

return StdoutLogHandler
