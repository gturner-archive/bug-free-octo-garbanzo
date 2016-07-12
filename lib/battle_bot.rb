class BattleBot
  attr_reader :name, :health, :enemies, :weapon

  @@count = 0

  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @@count += 1
  end

  def self.count
    @@count
  end

  def dead?
    @health <= 0 ? true : false
  end

  def has_weapon?
    @weapon == nil ? false : true
  end

  def pick_up(weapon)
    raise ArgumentError unless weapon.class == Weapon &&
                                               weapon.bot == nil
    #raise ArgumentError if weapon.bot != nil
    if @weapon == nil
      weapon.bot = self
      @weapon = weapon
    else
      nil
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil
  end

  def take_damage(damage)
    raise ArgumentError unless damage.class == Fixnum
    if (@health - damage) < 0
      @@count -= 1
      @health = 0
    else
      @health -= damage
    end
  end

  def heal
    if @health <= 100 && @health > 90
      @health = 100
    elsif @health > 0
      @health += 10
    else
      @health
    end
  end

  def attack(enemy)
    raise ArgumentError unless enemy.class == BattleBot &&
                                              enemy != self &&
                                              @weapon != nil
    enemy.receive_attack_from(self)
  end

  def receive_attack_from(enemy)
    raise ArgumentError unless enemy.class == BattleBot &&
                                              enemy != self &&
                                              enemy.weapon != nil
    @enemies << enemy if !@enemies.include?(enemy)
    take_damage(enemy.weapon.damage)
    defend_against(enemy)
  end

  def defend_against(enemy)
    if !dead? && has_weapon?
      attack(enemy)
    end
  end

end
