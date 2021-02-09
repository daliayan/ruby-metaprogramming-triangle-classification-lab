class Triangle

  attr_reader :triangle_a, :triangle_b, :triangle_c

  def initialize(triangle_a, triangle_b, triangle_c)
    @triangle_a = triangle_a
    @triangle_b = triangle_b
    @triangle_c = triangle_c
  end

  def kind
    kind_of_triangle
    if triangle_a == triangle_b && triangle_b == triangle_c
      :equilateral
    elsif
      triangle_a == triangle_b || triangle_b == triangle_c || triangle_c == triangle_a
      :isosceles
    else
      :scalene
    end
  end

  def kind_of_triangle
    triangles_combo = [(triangle_a +  triangle_b > triangle_c), (triangle_a + triangle_c > triangle_b), (triangle_b + triangle_c > triangle_a)]
      [triangle_a, triangle_b, triangle_c].each do |side|
        triangles_combo << false if side <= 0
      raise TriangleError if triangles_combo.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
