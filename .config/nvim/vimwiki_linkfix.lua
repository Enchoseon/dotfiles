-- This simple Pandoc filter appends ".html" to local links. It might screw up local images.
function Link(el)
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
