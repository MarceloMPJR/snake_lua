local rect

local FPS = 9
local nextTime = love.timer.getTime() + 1/FPS

function love.load()
  Object = require "classic"
  Enum = require "enum"

  require "game.ui"
  require "game.phase"

  phase = Phase()
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end

  phase.snake:set_pos(key)
end

function love.update(dt)
  local timedif = nextTime - love.timer.getTime()
  if timedif > 0 then love.timer.sleep(timedif) end
  nextTime = nextTime + 1/FPS

  phase.snake:move()
  phase:grow()
  gameover()
  phase:update()
end

function love.draw()
  phase:draw()
end

function gameover()
  if phase:is_gameover() then
    phase = Phase()
  end
end
