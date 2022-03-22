class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do | item |
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.quality = backstage_pass(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros" || item.quality == 0
        next
      elsif item.name == "Aged Brie"
        item.quality += 1
      else
        if item.sell_in > 0 
          item.quality -= 1
        else
          item.quality -= 2
        end
      end

      item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
    end

  end

  def backstage_pass(item)
    if item.sell_in > 10
      item.quality + 1
    elsif item.sell_in > 5
      item.quality + 2
    elsif item.sell_in > 0
      item.quality + 3
    else
      0
    end
  end
  
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
