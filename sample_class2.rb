require "./validation"

class Sample2Class
  include Validation
  @name, @age, @email = nil
  attr_accessor :name, :age, :email

  validate :name, presence: true
  validate :age, presence: true
  validate :email, presence: true

  def initialize name, age, email
    @name, @age, @email = name, age, email
  end

end
