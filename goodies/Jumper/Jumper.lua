-- UhhhhhhReanim/Modules/Jumper.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "Jumper"
	m.Description = "ometry ash"
	m.Assets      = {"nil_Jumper.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_Jumper.anim", "nil_Jumper.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_Jumper.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "refence to one dude dancing like that", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("nil_Jumper.mp3"), "gdjumper", 1, NumberRange.new(10.85, 600))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_Jumper.anim"))
		animator.looped = true
		animator.speed  = 1
	end

	m.Update = function(dt, figure)
		animator:Step(os.clock() - start)
	end

	m.Destroy = function(figure)
		animator = nil
	end

	return m
end)

return modules
