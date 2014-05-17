Game.Map = (tiles, player) ->
  @_tiles = tiles;
  # cache width & height based on length of 
  # dimensions of tiles array
  @_width = tiles.length
  @_height = tiles[0].length
  # create a list that will hold the entities
  @_entities = []
  # create the engine and scheduler
  @_scheduler = new ROT.Scheduler.Simple()
  @_engine = new ROT.Engine(@_scheduler)
  # add the player
  @addEntityAtRandomPosition player
  # add random fungi
  i = 0
  while i < 10
    @addEntityAtRandomPosition new Game.Entity(Game.FungusTemplate)
    i++
  return

Game.Map::getWidth = ->
  @_width

Game.Map::getHeight = ->
  @_height

# gets the tile for given coords
Game.Map::getTile = (x, y) ->
  # make sure we're inside bounds
  if x < 0 or x >= @_width or y < 0 or y >= @_height
    Game.Tile.nullTile
  else
    @_tiles[x][y] or Game.Tile.nullTile

# Game.Map::dig = (x, y) ->
#   # if the tile is diggable, update it to a floor
#   if @getTile(x, y).isDiggable()
#     @_tiles[x][y] = Game.Tile.floorTile

Game.Map::isEmptyFloor = (x, y) ->
  # check if the tile is floor and has no entity
  @getTile(x, y) is Game.Tile.floorTile and not @getEntityAt(x, y)

Game.Map::getRandomFloorPosition = ->
  # randomly generate a tile which is a floor
  x = undefined
  y = undefined
  loop
    x = Math.floor(Math.random() * @_width)
    y = Math.floor(Math.random() * @_width)
    break unless not @isEmptyFloor(x, y)
  x: x
  y: y

Game.Map::getEngine = ->
  @_engine

Game.Map::getEntities = ->
  @_entities

Game.Map::getEntityAt = (x, y) ->
  # iterate through all entities searching for one with
  # matching position
  i = 0
  while i < @_entities.length
    return @_entities[i] if @_entities[i].getX() is x and @_entities[i].getY() is y
    i++
  return false

Game.Map::getEntitiesWithinRadius = (centerX, centerY, radius) ->
  results = []
  # determine bounds
  leftX = centerX - radius
  rightX = centerX + radius
  topY = centerY - radius
  bottomY = centerY + radius
  # iterate through entities, adding any within bounds
  i = 0
  while i < @_entities.length
    if @_entities[i].getX() >= leftX and
       @_entities[i].getX() <= rightX and
       @_entities[i].getY() >= topY and
       @_entities[i].getY() <= bottomY
      results.push(@_entities[i])
    i++
  return results

Game.Map::addEntity = (entity) ->
  # make sure entity's position is within bounds
  if entity.getX() < 0 or entity.getX() >= @_width or entity.getY() < 0 or entity.getY() >= @_height
    throw new Error('Adding entity out of bounds.')
  # update the entity's map
  entity.setMap this
  # add entity to list of entities
  @_entities.push entity
  # check if entity is actor, if so, add to scheduler
  if entity.hasMixin('Actor')
    @_scheduler.add entity, true

Game.Map::addEntityAtRandomPosition = (entity) ->
  position = @getRandomFloorPosition()
  entity.setX position.x
  entity.setY position.y
  @addEntity entity
  return

Game.Map::removeEntity = (entity) ->
  # find the entity in the list of entities
  i = 0
  while i < @_entities.length
    if @_entities[i] is entity
      @_entities.splice i, 1
      break
    i++
  # if the entity is an actor, remove them from scheduler
  @_scheduler.remove entity if entity.hasMixin('Actor')
  return



