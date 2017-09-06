local fn = require("functions")
function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
function paddleCollision()
  return checkCollision(player.x, player.y, player.width, player.height, ball.x, ball.y, ball.width, ball.height)
end
gamestates = { MENU = "menu", PLAY = "game", PAUSE ="gamepaused", END ="gameover" } -- Game states, en teoria esto es generico
menucaptions = { "Play", "Options", "Exit" }  -- Labels de los items del menu
menuoptions = {  -- Funcionalidad de los items del menu
  Play = function() play() end,
  Options = function() options() end,
  Exit = function() love.event.quit() end
}
function createball()
  local angle = fn.randomdouble(math.pi / 4, 3 * math.pi / 4)
  ball = { height = startingballsize, width = startingballsize, direction = { x = math.cos(angle), y = -math.sin(angle) }, speed = 100, acceleration = 10 }
  ball.x, ball.y = window.width / 2 - ball.width / 2, 3 * window.height / 4 - ball.height / 2
end
function createpaddle()
  player = { width = window.width / 10, height = 10, speed = 200 }
  player.x, player.y = window.width / 2 - player.width / 2, window.height * 7 / 8 - player.height / 2
end
function createstage()
  stage = {
    { x = 0, y = 0, type = 8 },
    { x = 1, y = 0, type = 8 },
    { x = 2, y = 0, type = 8 },
    { x = 3, y = 0, type = 8 },
    { x = 4, y = 0, type = 8 },
    { x = 5, y = 0, type = 8 },
    { x = 6, y = 0, type = 8 },
    { x = 7, y = 0, type = 8 },
    { x = 8, y = 0, type = 8 },
    { x = 9, y = 0, type = 8 },
    { x = 10, y = 0, type = 8 },
    { x = 11, y = 0, type = 8 },
    { x = 12, y = 0, type = 8 },
    { x = 0, y = 1, type = 4 },
    { x = 1, y = 1, type = 4 },
    { x = 2, y = 1, type = 4 },
    { x = 3, y = 1, type = 4 },
    { x = 4, y = 1, type = 4 },
    { x = 5, y = 1, type = 4 },
    { x = 6, y = 1, type = 4 },
    { x = 7, y = 1, type = 4 },
    { x = 8, y = 1, type = 4 },
    { x = 9, y = 1, type = 4 },
    { x = 10, y = 1, type = 4 },
    { x = 11, y = 1, type = 4 },
    { x = 12, y = 1, type = 4 },
    { x = 0, y = 2, type = 7 },
    { x = 1, y = 2, type = 7 },
    { x = 2, y = 2, type = 7 },
    { x = 3, y = 2, type = 7 },
    { x = 4, y = 2, type = 7 },
    { x = 5, y = 2, type = 7 },
    { x = 6, y = 2, type = 7 },
    { x = 7, y = 2, type = 7 },
    { x = 8, y = 2, type = 7 },
    { x = 9, y = 2, type = 7 },
    { x = 10, y = 2, type = 7 },
    { x = 11, y = 2, type = 7 },
    { x = 12, y = 2, type = 7 },
    { x = 0, y = 3, type = 5 },
    { x = 1, y = 3, type = 5 },
    { x = 2, y = 3, type = 5 },
    { x = 3, y = 3, type = 5 },
    { x = 4, y = 3, type = 5 },
    { x = 5, y = 3, type = 5 },
    { x = 6, y = 3, type = 5 },
    { x = 7, y = 3, type = 5 },
    { x = 8, y = 3, type = 5 },
    { x = 9, y = 3, type = 5 },
    { x = 10, y = 3, type = 5 },
    { x = 11, y = 3, type = 5 },
    { x = 12, y = 3, type = 5 },
    { x = 0, y = 4, type = 6 },
    { x = 1, y = 4, type = 6 },
    { x = 2, y = 4, type = 6 },
    { x = 3, y = 4, type = 6 },
    { x = 4, y = 4, type = 6 },
    { x = 5, y = 4, type = 6 },
    { x = 6, y = 4, type = 6 },
    { x = 7, y = 4, type = 6 },
    { x = 8, y = 4, type = 6 },
    { x = 9, y = 4, type = 6 },
    { x = 10, y = 4, type = 6 },
    { x = 11, y = 4, type = 6 },
    { x = 12, y = 4, type = 6 },
    { x = 0, y = 5, type = 3 },
    { x = 1, y = 5, type = 3 },
    { x = 2, y = 5, type = 3 },
    { x = 3, y = 5, type = 3 },
    { x = 4, y = 5, type = 3 },
    { x = 5, y = 5, type = 3 },
    { x = 6, y = 5, type = 3 },
    { x = 7, y = 5, type = 3 },
    { x = 8, y = 5, type = 3 },
    { x = 9, y = 5, type = 3 },
    { x = 10, y = 5, type = 3 },
    { x = 11, y = 5, type = 3 },
    { x = 12, y = 5, type = 3 }
  }
end
function respawn()

end
function play()
  gamestate = gamestates.PLAY
  createball()
  createpaddle()
  createstage()
  bounds = { top = 0, left = 0, right = window.width, bottom = window.height }
end
function options()
end
function menu()
  gamestate = gamestates.MENU
  menuoption = next(menucaptions)
end
function love.load()
  window = {}
  window.width, window.height = love.graphics.getDimensions()
  startingballsize = 10
  stageblocks = { horizontal = 13, vertical = 15 }
  stageoffset = 0.1 -- pct
  stagearea = 0.5 -- pct
  menu()
end
function love.update(dt)
  fn.switch(gamestate): caseof {
    [gamestates.PLAY] = function()
      -- MOVIMEINTO
      local move = 0
      if (love.keyboard.isDown("left")) then
        move = -1
      elseif (love.keyboard.isDown("right")) then
        move = 1
      end
      if (move ~= 0) then
        player.x = math.min(math.max(player.x + player.speed * dt * move, bounds.left), bounds.right - player.width)
      end
      local nextx, nexty = ball.x + ball.direction.x * dt * ball.speed, ball.y + ball.direction.y * dt * ball.speed
      -- REBOTE CON PALA
      if (paddleCollision()) then
        nexty = player.y - ball.height
        ball.direction.y = -ball.direction.y
      end
      -- REBOTE CON PAREDES
      if (nexty < bounds.top) then
        nexty = bounds.top
        ball.direction.y = -ball.direction.y
      end
      if (nextx < bounds.left) then
        nextx = bounds.left
        ball.direction.x = -ball.direction.x
      end
      if (nextx > bounds.right - ball.width) then
        nextx = bounds.right - ball.width
        ball.direction.x = -ball.direction.x
      end
      -- BOLA CAE
      if (nexty > bounds.bottom) then
        createball()
      else
        ball.x, ball.y = nextx, nexty
        ball.speed = ball.speed + ball.acceleration * dt;
      end
    end
  }
end
function love.keypressed(key, scancode, isrepeat)
  fn.switch(gamestate): caseof {
    [gamestates.MENU] = function()
      fn.switch(key): caseof {
        up = function()
          menuoption = menuoption - 1
          if menuoption == 0 then
            menuoption = #menucaptions
          end
        end,
        down = function()
          menuoption = menuoption + 1
          if menuoption > #menucaptions then
            menuoption = 1
          end
        end,
        ["return"] = function()
          menuoptions[menucaptions[menuoption]]()
        end,
        escape = function()
          love.event.quit()
        end
      }
    end,
    [gamestates.PLAY] = function()

    end,
    [gamestates.END] = function()
      fn.switch(key): caseof {
        ["return"] = function()
          play()
        end,
        escape = function()
          menu()
        end
      }
    end
  }
end
function love.draw()
  fn.switch(gamestate): caseof {
    [gamestates.MENU] = function()
      local opt = 0
      for key, val in pairs(menucaptions) do
        if menuoption == key then
          love.graphics.setNewFont(20)
          love.graphics.setColor(255,255,255)
        else
          love.graphics.setNewFont(12)
          love.graphics.setColor(200,200,200)
        end
        love.graphics.print( val, 100, 30 * opt )
        opt = opt + 1
      end
    end,
    [gamestates.PLAY] = function()
      love.graphics.setColor(255,255,255)
      love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
      love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
      -- stage
      local offset = window.height * stageoffset
      local blocksize = { width = window.width / stageblocks.horizontal, height = window.height * stagearea / stageblocks.vertical }
      for i,block in ipairs(stage) do
        fn.switch(block.type): caseof {
          [0] = function() love.graphics.setColor(255,255,255) end,
          [1] = function() love.graphics.setColor(255,143,0) end,
          [2] = function() love.graphics.setColor(0,255,255) end,
          [3] = function() love.graphics.setColor(0,255,0) end,
          [4] = function() love.graphics.setColor(255,0,0) end,
          [5] = function() love.graphics.setColor(0,112,255) end,
          [6] = function() love.graphics.setColor(255,0,255) end,
          [7] = function() love.graphics.setColor(255,255,0) end,
          [8] = function() love.graphics.setColor(157,157,157) end,
          [9] = function() love.graphics.setColor(188,174,0) end
        }
        love.graphics.rectangle("fill", block.x * blocksize.width, offset + block.y * blocksize.height, blocksize.width, blocksize.height)
      end
    end,
    [gamestates.PAUSE] = function()
      love.graphics.setNewFont(30)
      love.graphics.setColor(255,255,255)
      love.graphics.printf( "PAUSE", window.width / 2, window.height / 2, 150, "center" )
    end,
    [gamestates.END] = function()
      love.graphics.setNewFont(30)
      love.graphics.setColor(255,255,255)
      love.graphics.printf( "END", window.width / 2, window.height / 2, 150, "center" )
    end
  }
end
function love.focus(f)
  if (f == true and gamestate == gamestates.PAUSE) then
    gamestate = gamestates.PLAY
  elseif (f == false and gamestate == gamestates.PLAY) then
    gamestate = gamestates.PAUSE
  end
end
