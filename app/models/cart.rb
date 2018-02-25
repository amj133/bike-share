class Cart
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents ||= Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_accessory(accessory_id)
    @contents[accessory_id.to_s] = @contents[accessory_id.to_s].to_i + 1
  end

  def decrease_accessory(accessory_id)
    @contents[accessory_id.to_s] -= 1
  end

  def remove_accessory(accessory_id)
    @contents.delete(accessory_id.to_s)
  end

  def count_of(accessory_id)
    @contents[accessory_id.to_s]
  end

  def total_cost
    @contents.reduce(0) do |result, (key, value)|
      accessory = Accessory.find(key.to_i)
      result += accessory.price * value
      result
    end
  end

  def accessories
    accessory_ids = contents.select {|k, v| v > 0}.keys
    accessories = accessory_ids.map  do |accessory_id|
      Accessory.find(accessory_id)
    end
  end

end
