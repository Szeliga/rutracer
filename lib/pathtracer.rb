require 'matrix'
require_relative 'utils'
require_relative 'core'

camera = Core::Camera.new(Vector[10, 0, 0], Vector[0, 0, 0], 90, 1 / 1)
ray = camera.spawn_ray(0, 0)
puts ray.origin, ray.direction, ray.t
