#      |v  /w
#      |  /
#      | /
#      |/_____u
#  position
module Core
  class Camera
    attr_accessor :position, :look_at, :fov, :aspect_ratio, :w, :u, :v,
      :half_plane_width, :half_plane_height, :corner, :to_right, :to_bottom
    using ::Utils::Trigonometry

    def initialize(position, look_at, fov, aspect_ratio)
      self.position = position
      self.look_at = look_at
      self.fov = fov
      self.aspect_ratio = aspect_ratio

      calculate_uvw
      calculate_half_plane
      calculate_directional_vectors
    end

    def spawn_ray(x, y)
      point = corner + to_right * (x / 10) + to_bottom * (y / 10)
      dir = (point - position).normalize
      Ray.new(position, dir)
    end

    private

    def calculate_uvw
      up = Vector.elements([0, 1, 0])
      self.w = look_at - position
      self.u = w.cross(up)
      self.v = u.cross(w)
    end

    def calculate_half_plane
      self.half_plane_width = w.magnitude * Math.tan(fov.to_rad / 2)
      self.half_plane_height = half_plane_width * aspect_ratio
    end

    def calculate_directional_vectors
      self.corner = position + w - (v * half_plane_height) - (u * half_plane_width)
      self.to_right = u * (2 * half_plane_width)
      self.to_bottom = v * (2 * half_plane_height)
    rescue => e
      puts e.backtrace
    end
  end
end
