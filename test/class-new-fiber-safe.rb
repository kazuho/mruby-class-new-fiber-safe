class C
  def initialize(v)
    Fiber.yield(v)
  end
end

assert("Class#new") do
  f = Fiber.new do
    C.new(123)
  end
  assert_equal f.resume, 123
end
