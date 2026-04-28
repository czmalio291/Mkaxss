-- UhhhhhhReanim/Modules/Greedy.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "I CAME TO GREED"
	m.Description = "Sit yo happy self down"
	m.Assets      = {"nil_ICAMETOGREED.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_ICAMETOGREED.anim", "InescapableRush.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/InescapableRush.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "No settings.", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("InescapableRush.mp3"))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_ICAMETOGREED.anim"))
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
