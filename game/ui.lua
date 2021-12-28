function draw_tile(type, x, y)
  if type == PHASE_OBJECTS.empty then return end

  set_color(type)
  love.graphics.rectangle("fill", x, y, PHASE_BLOCK_SIZE, PHASE_BLOCK_SIZE)
end

function draw_total_points(totalPoint)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("PONTOS: ", 1, 1, 0, 1, 1)
  love.graphics.setColor(0, 0, 255)
  love.graphics.print(tostring(totalPoint), 65, 1, 0, 1, 1)
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
