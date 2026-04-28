-- UhhhhhhReanim/Modules/Jackpott.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "Jackpot"
	m.Description = "Hold up, wait.\n \nI couldn't make music go slow but i made it sped up"
	m.Assets      = {"nil_Jackpot.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_Jackpot.anim", "nil_Jackpot.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_Jackpot.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "You won a 3 dollars", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("nil_Jackpot.mp3"))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_Jackpot.anim"))
		animator.looped = true
		animator.speed  = 1.33
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
