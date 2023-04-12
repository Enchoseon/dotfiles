-- Explanation: This filter ensures that LaTeX encased in pairs of $$ is parsed as raw latex.
-- Why not just remove the $$'s? Because they ensure parity with KaTeX!
--
-- Obviously, if you don't need KaTeX parity, then this filter is wholly unnecessary.
function Math (elem)
	if elem.mathtype == 'DisplayMath' then
		return {
			pandoc.RawInline('latex', elem.text),
		}
	end
end
