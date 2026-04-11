-- UhhhhhhReanim/Modules/Cinderella.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "24 Hours Cinderella"
	m.Description = "Step and Go!"
	m.Assets      = {"Cinderella.anim@https://github.com/czmalio291/Mkaxss/blob/main/goodies/contents/Cinderella.anim", "Cinderella.mp3@https://github.com/czmalio291/Mkaxss/blob/main/goodies/contents/Cinderella.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "No settings.", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("Cinderella.mp3"), "Cinderella", 1, NumberRange.new(0, 600))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("Cinderella.anim"))
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
