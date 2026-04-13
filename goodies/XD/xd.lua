-- UhhhhhhReanim/Modules/xd.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "XD Meme"
	m.Description = "oh god no\nWould the colonthreespam likes this one?\n:3 :3 :3 :3 :3 :3 :3 "
	m.Assets      = {"nil_xd.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_xd.anim", "nil_xd.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_xd.mp3"}

	m.Config = function(parent)
		Util_CreateText(parent, "another item asylum emote", 14, Enum.TextXAlignment.Center)
	end

	m.SaveConfig = function() return {} end
	m.LoadConfig  = function(save) end

	local animator = nil
	local start    = 0

	m.Init = function(figure)
		SetOverrideDanceMusic(AssetGetContentId("nil_xd.mp3"))

		start           = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.track  = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_xd.anim"))
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
