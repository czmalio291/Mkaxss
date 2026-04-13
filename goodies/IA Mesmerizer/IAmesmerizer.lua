-- UhhhhhhReanim/Modules/IAmesmerizer.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "IA Mesmerizer"
	m.Description = "Item asylum mesmerizer boohoo\nBasically a looped mesmerizer"
	m.Assets      = {"nil_IAmesmerizer.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_IAmesmerizer.anim", "nil_IAmesmerizer.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_IAmesmerizer.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "No settings.", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("nil_IAmesmerizer.mp3"), "Item Asylum mesmerizer", 0.9, NumberRange.new(0, 600))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_IAmesmerizer.anim"))
		animator.looped = true
		animator.speed  = 1
	end

	m.Update = function(dt, figure)
		animator:Step(os.clock() - start)
	end

	m.Update = function(dt: number, figure: Model)
		animator:Step(GetOverrideDanceMusicTime())
	end

	m.Destroy = function(figure)
		animator = nil
	end

	return m
end)

return modules
