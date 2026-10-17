-- Estado da animacao da ilha: o ActionTimer chama Step(+-0.1) em sequencia e
-- este script publica Prog (linear) e E (suavizado) como variaveis.

function Initialize()
	prog = tonumber(SKIN:GetVariable('AlwaysOpen')) or 0
	push()
end

function push()
	local e = prog * prog * (3 - 2 * prog)
	SKIN:Bang('!SetVariable', 'Prog', string.format('%.3f', prog))
	SKIN:Bang('!SetVariable', 'E', string.format('%.4f', e))
end

function Step(delta)
	prog = math.max(0, math.min(1, prog + delta))
	push()
end
