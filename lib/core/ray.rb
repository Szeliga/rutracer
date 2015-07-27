# Parametric representation of a 3D line
# r(t) = origin + t * direction
module Core
  class Ray
    attr_accessor :origin, :direction, :t

    def initialize(origin, direction)
      self.origin = origin
      self.direction = direction
      self.t = Float::INFINITY
    end
  end
end
