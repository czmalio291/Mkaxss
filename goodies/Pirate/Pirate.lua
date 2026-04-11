-- UhhhhhhReanim/Modules/Pirate.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "Pirate"
	m.Description = "the 1700s still hit hard"
	m.Assets      = {"Pirate.anim@https://github.com/czmalio291/Mkaxss/blob/main/goodies/contents/Pirate.anim", "Pirate.mp3@https://github.com/czmalio291/Mkaxss/blob/main/goodies/contents/Pirate.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "No settings.", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("Pirate.mp3"), "1700s", 1, NumberRange.new(0, 600))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("Pirate.anim"))
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
