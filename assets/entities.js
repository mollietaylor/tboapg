// Generated by CoffeeScript 1.7.1
Game.PlayerTemplate = {
  character: '',
  foreground: 'white',
  maxHp: 40,
  attackValue: 10,
  sightRadius: 6,
  inventorySlots: 10,
  mixins: [Game.EntityMixins.PlayerActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible, Game.EntityMixins.InventoryHolder, Game.EntityMixins.MessageRecipient, Game.EntityMixins.Sight, Game.EntityMixins.Equipper]
};

Game.EntityRepository = new Game.Repository('entities', Game.Entity);

Game.EntityRepository.define('fungus', {
  name: 'fungus',
  character: ' ',
  foreground: 'green',
  maxHp: 10,
  mixins: [Game.EntityMixins.FungusActor, Game.EntityMixins.Destructible]
});

Game.EntityRepository.define('humanoid', {
  name: 'humanoid',
  character: '',
  foreground: '#a29f28',
  maxHp: 5,
  attackValue: 4,
  mixins: [Game.EntityMixins.WanderActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible]
});

Game.EntityRepository.define('robot', {
  name: 'robot',
  character: '',
  foreground: 'yellow',
  maxHp: 3,
  attackValue: 2,
  mixins: [Game.EntityMixins.WanderActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible]
});

Game.BossRepository = new Game.Repository('entities', Game.Entity);

Game.BossRepository.define('plant', {
  name: 'plant',
  character: '',
  foreground: 'hotPink',
  maxHp: 500,
  attackValue: 5,
  weakness: 'bug',
  mixins: [Game.EntityMixins.Boss, Game.EntityMixins.WanderActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible]
}, {
  disableRandomCreation: true
});

Game.BossRepository.define('dislike', {
  name: 'dislike',
  character: '',
  foreground: 'hotPink',
  maxHp: 500,
  attackValue: 5,
  weakness: 'like',
  mixins: [Game.EntityMixins.Boss, Game.EntityMixins.WanderActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible]
}, {
  disableRandomCreation: true
});

Game.BossRepository.define('cloud', {
  name: 'cloud',
  character: '',
  foreground: 'hotPink',
  maxHp: 500,
  attackValue: 5,
  weakness: 'umbrella',
  mixins: [Game.EntityMixins.Boss, Game.EntityMixins.WanderActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible]
}, {
  disableRandomCreation: true
});

Game.BossRepository.define('lock', {
  name: 'lock',
  character: '',
  foreground: 'hotPink',
  maxHp: 500,
  attackValue: 5,
  weakness: 'key',
  mixins: [Game.EntityMixins.Boss, Game.EntityMixins.WanderActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible]
}, {
  disableRandomCreation: true
});

Game.BossRepository.define('fire', {
  name: 'fire',
  character: '',
  foreground: 'hotPink',
  maxHp: 500,
  attackValue: 5,
  weakness: 'extinguisher',
  mixins: [Game.EntityMixins.Boss, Game.EntityMixins.WanderActor, Game.EntityMixins.Attacker, Game.EntityMixins.Destructible]
}, {
  disableRandomCreation: true
});
