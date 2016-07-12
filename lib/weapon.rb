class Weapon
  def initialize(name, damage = 0)
    raise ArgumentError unless name.class == String &&
                                             damage.class == Fixnum
    @name = name
    @damage = damage
    @battle_bot = nil
  end

  def name
    @name
  end

  def damage
    @damage
  end

  def bot
    @battle_bot
  end

  def bot=(battlebot)
    raise ArgumentError unless battlebot.class == BattleBot ||
                                                  battlebot == nil
    @battle_bot = battlebot
  end

  def picked_up?
    @battle_bot.class == BattleBot ? true : false
  end

end
