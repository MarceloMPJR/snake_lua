local rect

local FPS = 9

local function nextTime()
  return love.timer.getTime() + 1/(FPS + phase.totalPoints)
end

function love.load()
  Object = require "libs.classic"
  Enum = require "libs.enum"

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
  local myNextTime = nextTime()
  local timedif = myNextTime - love.timer.getTime()

  if timedif > 0 then love.timer.sleep(timedif) end
  myNextTime = myNextTime + 1/FPS

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
