-- This simple Pandoc filter appends ".html" to local links. It might screw up local images.
local path = require "pandoc.path"
local system = require "pandoc.system"
function Link(el)
	local outputDirectory = path.directory(PANDOC_STATE.output_file)
	local htmlFilePath = path.join({outputDirectory, decodeURI(el.target) .. ".html"})
	if is_file(el.target) then
		el.target = el.target .. ".html"
	end
	return el
end
-- Determine (guess) if a link is to a local file
function is_file(target)
	if string.find(target, "://") then
		return false
	end
	return true
end
-- Decode URI (https://stackoverflow.com/a/20407113)
local hex = {}
for i = 0, 255 do
	hex[string.format("%02x", i)] = string.char(i)
	hex[string.format("%02X", i)] = string.char(i)
end
function decodeURI(s)
	return (s:gsub('%%(%x%x)', hex))
end
