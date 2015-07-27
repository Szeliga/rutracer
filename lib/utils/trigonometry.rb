module Utils
  module Trigonometry
    refine Fixnum do
      def to_rad
        self * Math::PI / 180
      end
    end
  end
end
