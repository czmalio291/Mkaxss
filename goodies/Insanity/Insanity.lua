-- UhhhhhhReanim/Modules/Insanity.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "Insanity"
	m.Description = "Ran Ran Ruu!"
	m.Assets      = {"Insanity.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/Insanity.anim", "Insanity.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/Insanity.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "where is my burger?", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("insanity.mp3"), "IAinsanity", 0.8, NumberRange.new(0, 20.16))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("insanity.anim"))
		animator.looped = false
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
