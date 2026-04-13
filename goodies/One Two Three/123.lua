-- UhhhhhhReanim/Modules/123.lua

local modules = {}

table.insert(modules, function()
	local m = {}

	m.ModuleType  = "DANCE"
	m.Name        = "One Two Three"
	m.Description = "One two three de arukidase!\n \nAdded flipped version why not?"
	m.Assets      = {"nil_123.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_123.anim", "nil_123_F.anim@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_123_F.anim", "nil_123.mp3@https://github.com/czmalio291/Mkaxss/raw/refs/heads/main/goodies/contents/nil_123.mp3"}

	m.Flip = false
	m.Config = function(parent)
		Util_CreateSwitch(parent, "Flipped vers", m.Flip).Changed:Connect(function(val)
			m.Flip = val
		end)
	end

	m.LoadConfig = function(save: any)
		m.Flip = not not save.Flip
	end

	m.SaveConfig = function()
		return {
			Flip = m.Flip
		}
	end

	local animator = nil
	local start = 0

	m.Init = function(figure: Model)
		SetOverrideDanceMusic(AssetGetContentId("nil_123.mp3"))

		start = os.clock()
		animator        = AnimLib.Animator.new()
		animator.rig    = figure
		animator.looped = true
		animator.speed  = 1
		if m.Flip then
			animator.track = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_123_F.anim"))
		else
			animator.track = AnimLib.Track.fromfile(AssetGetPathFromFilename("nil_123.anim"))
		end
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
