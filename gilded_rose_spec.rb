require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    before do
      @items = [Item.new("foo", 10, 10), Item.new("bar", 10, 0)]
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
  end

end
