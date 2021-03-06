Phase = Object:extend()

PHASE_BLOCK_SIZE = 20

local SIZE_X = 40
local SIZE_Y = 30

PHASE_OBJECTS = Enum.new("Objects", { "empty", "wall", "snake", "point" })

local function randomPoint()
  math.randomseed(os.time())
  local x = math.random(2, SIZE_X - 3)

  math.randomseed(os.time())
  local y = math.random(2, SIZE_Y - 3)

  return {x, y}
end

function Phase:new()
  require "game.snake"

  self.snake = Snake()
  self.totalPoints = 0

  self:newPoint()
  self:update()
end

function Phase:newPoint()
  self.point = randomPoint()
end

function Phase:update()
  self.tilemap = {}

  for i = 0, SIZE_Y-1 do
    self.tilemap[i] = {}

    for j = 0, SIZE_X-1 do
      local object = PHASE_OBJECTS.empty

      if j == 0 or j == SIZE_X-1 or i == 0 or i == SIZE_Y-1 then object = PHASE_OBJECTS.wall end

      self.tilemap[i][j] = object
    end
  end

  local snake_body = self.snake.head

  while snake_body.body do
    self.tilemap[snake_body.y][snake_body.x] = PHASE_OBJECTS.snake

    snake_body = snake_body.body
  end

  self.tilemap[self.point[2]][self.point[1]] = PHASE_OBJECTS.point
end

function Phase:grow()
  if self:shold_grow() then
    self.snake:grow()
    self:newPoint()
    self.totalPoints = self.totalPoints + 1
  end
end

function Phase:shold_grow()
  return self.tilemap[self.snake.head.y][self.snake.head.x] == PHASE_OBJECTS.point
end

function Phase:is_gameover()
  return self.tilemap[self.snake.head.y][self.snake.head.x] == PHASE_OBJECTS.wall or
    self.tilemap[self.snake.head.y][self.snake.head.x] == PHASE_OBJECTS.snake
end

function Phase:draw()
  for i = 0, SIZE_Y-1 do
    for j = 0, SIZE_X-1 do
      draw_tile(self.tilemap[i][j], j * PHASE_BLOCK_SIZE, i * PHASE_BLOCK_SIZE)
    end
  end
  draw_total_points(self.totalPoints)
end

function Phase:debug()
  for i = 0, SIZE_Y-1 do
    for j = 0, SIZE_X-1 do
      io.write(self.tilemap[i][j].value)
    end
    io.write("\n")
  end
end
