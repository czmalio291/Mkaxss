-- UhhhhhhReanim/Modules/Birthday.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "Birthday"
	m.Description = "Ots my birthday today"
	m.Assets      = {"Birthday.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/Birthday.anim", "Birthday.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/Birthday.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "No settings.", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("Birthday.mp3"))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("Birthday.anim"), "today", 0.7, NumberRange.new(0, 67))
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
