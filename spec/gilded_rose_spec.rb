require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    before do
      @items = [
        Item.new("foo", 10, 10), 
        Item.new("bar", 10, 0), 
        Item.new("milk", 0, 10), 
        Item.new("gold", 10, 51), 
        Item.new("Aged Brie", 10, 10), 
        Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
      GildedRose.new(@items).update_quality()
    end
    it "does not change the name" do
      expect(@items[0].name).to eq "foo"
    end

    it "decreases quality of normal item" do
      expect(@items[0].quality).to eq 9
    end

    it "sell_in decreases" do
      expect(@items[0].sell_in).to eq 9
    end

    it "quality never goes below zero" do
      expect(@items[1].quality).not_to eq -1
    end

    it "once sell by date passes, quality drops twice as much" do
      expect(@items[2].quality).to eq 8
    end

    it "quality can never go above 50" do
      expect(@items[3].quality).to eq 50
    end

    it "aged brie goes up in quality" do
      expect(@items[4].quality).to eq 11
    end

    it "sulfuras doesn't need to be sold and doesn't decrease in quality" do
      expect(@items[5].quality).to eq 10
      expect(@items[5].sell_in).to eq 10
    end
  end

end
