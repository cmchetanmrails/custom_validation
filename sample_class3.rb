require "./validation"

class Sample3Class
  include Validation
  @name, @age, @email = nil
  attr_accessor :name, :age, :email

  validate :name, test: "error using"
  def initialize name, age, email
    @name, @age, @email = name, age, email
  end
end
