-- UhhhhhhReanim/Modules/Cinderella.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "24 Hours Cinderella"
	m.Description = "Step and Go!"
	m.Assets      = {"nil_Cinderella.anim@https://github.com/czmalio291/Mkaxss/blob/main/goodies/contents/nil_Cinderella.anim", "nil_Cinderella.mp3@https://github.com/czmalio291/Mkaxss/blob/main/goodies/contents/nil_Cinderella.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "No settings.", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("nil_Cinderella.mp3")

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_Cinderella.anim"))
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
