function draw_tile(type, x, y)
  if type == PHASE_OBJECTS.empty then return end

  set_color(type)
  love.graphics.rectangle("fill", x, y, PHASE_BLOCK_SIZE, PHASE_BLOCK_SIZE)
end

function set_color(type)
  if type == PHASE_OBJECTS.wall then
    love.graphics.setColor(1, 1, 1)
  elseif type == PHASE_OBJECTS.snake then
    love.graphics.setColor(0, 1, 0)
  elseif type == PHASE_OBJECTS.point then
    love.graphics.setColor(255, 255, 0)
  end
end
