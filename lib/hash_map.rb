require 'digest'

class HashMap
  attr_reader :map_lenght, :map

  def initialize(length = 6)
    @map = []
    @map_lenght = length
  end

  def index(key)
    Digest::SHA1.hexdigest(key.to_s).to_i(16) % map_lenght
  end

  def set(key, value)
    index = index(key)
    # if map[index]=nil
      @map[index] = value
    # else
    #   aux = map[index]
    #   @map[index] = [aux,HashMap.new.set(key,value)]
    # end
  end

  def get(key)
    index = index(key)
    map[index]
  end

end
