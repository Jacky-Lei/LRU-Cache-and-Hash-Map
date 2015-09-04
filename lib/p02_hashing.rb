class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0.hash + 1 if self.empty? #ensures there is some output for empty array
    self.map.with_index do |el, idx|
      (el.hash * (idx+1)) # multiplying the idx in so that order is taken into account
      # need to multiply by idx + 1 because if you do 0, that will return 0
      # for any first element, or any array with just one element 
    end.inject(:+) #adds up the resulting function output to create output
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  def hash
    self.to_a.sort.hash
  end
end
