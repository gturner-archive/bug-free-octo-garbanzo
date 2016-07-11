class BattleBot
  attr_reader :name, :health, :enemies, :weapon

  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil

  end

  def dead?
    @health <= 0 ? true : false
  end

  def has_weapon?
    @weapon == nil ? false : true
  end

  def pick_up(weapon)
    raise ArgumentError unless weapon.class == Weapon && weapon.bot == nil
    #raise ArgumentError if weapon.bot != nil
    if @weapon == nil
      weapon.bot = self
      @weapon = weapon
    else
      nil
    end
  end

  def drop_weapon
    @weapon = nil
    @weapon.bot = nil
  end

  def take_damage(damage)
    raise ArgumentError unless damage.class == Fixnum
    if (@health -= damage) < 0
      @health = 0
    else
      @health -= damage
    end
  end

  def heal
    if @health < 100 && @health > 90
      @health = 100
    elsif @health > 0
      @health += 10
    else
      @health
    end
  end

  def attack

  end

end
