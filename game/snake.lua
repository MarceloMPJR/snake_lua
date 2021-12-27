Snake = Object:extend()

local INITIAL_X = 3
local INITIAL_Y = 3
local INITIAL_SIZE = 10

SNAKE_POS = Enum.new("SnakePosition", {"right", "up", "left", "down"})

function Snake:new()
  self.x = INITIAL_X
  self.y = INITIAL_Y
  self.pos = SNAKE_POS.right

  self:create_head()

  for i=0,INITIAL_SIZE-1 do
    self:grow()
  end
end

function Snake:create_head()
  self.head = {}
  self.head.x = INITIAL_X
  self.head.y = INITIAL_Y
  self.head.body = nil
end

function Snake:grow()
  local old_head = self.head
  self.head = {}
  self.head.body = old_head
  self.head.x = old_head.x
  self.head.y = old_head.y

  self:move_head()
end

function Snake:move()
  new_x, new_y = self.head.x, self.head.y
  self:move_head()

  snake_body = self.head.body

  while snake_body.body do
    old_x, old_y = snake_body.x, snake_body.y

    snake_body.x, snake_body.y = new_x, new_y

    new_x, new_y = old_x, old_y
    snake_body = snake_body.body
  end
end

function Snake:set_pos(key)
  if key == "right" and self.pos ~= SNAKE_POS.left then
    self.pos = SNAKE_POS.right
  elseif key == "up" and self.pos ~= SNAKE_POS.down then
    self.pos = SNAKE_POS.up
  elseif key == "left" and self.pos ~= SNAKE_POS.right then
    self.pos = SNAKE_POS.left
  elseif key == "down" and self.pos ~= SNAKE_POS.up then
    self.pos = SNAKE_POS.down
  end
end

function Snake:move_head()
  if self.pos == SNAKE_POS.right then
    self.head.x = self.head.x + 1
  elseif self.pos == SNAKE_POS.up then
    self.head.y = self.head.y - 1
  elseif self.pos == SNAKE_POS.left then
    self.head.x = self.head.x - 1
  elseif self.pos == SNAKE_POS.down then
    self.head.y = self.head.y + 1
  end
end
