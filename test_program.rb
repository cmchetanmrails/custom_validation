require './sample_class2.rb'
require './sample_class.rb'

validation_hash = {}
validation_hash[:sample_class_b ] = SampleClass.new("abc", 25, "ja\\nta@gmail.com")
validation_hash[:sample_class_b1] = SampleClass.new("abc28", 22, "abc@gmail.com")

validation_hash[:sample_class_c ] = SampleClass.new("xyz", 22, 129)
validation_hash[:sample_class_c1] = SampleClass.new("jkl", "21", 120)

validation_hash[:sample_class_a ] = Sample2Class.new(" ",26, "abc@gmail.com")
validation_hash[:sample_class_a1] = Sample2Class.new(nil, 23, "abc@gmail.com")
validation_hash[:sample_class_a2] = Sample2Class.new("Samantha", nil, "abc@gmail.com")

puts "Validation of a valid object                ::   #{validation_hash[:sample_class_a].valid?.to_s} "
puts "Validation of a invalid object with presence::   #{validation_hash[:sample_class_a1].valid?.to_s}, #{validation_hash[:sample_class_a2].valid?.to_s} "
puts "Validation of a invalid object with format  ::   #{validation_hash[:sample_class_b].valid?.to_s}, #{validation_hash[:sample_class_b1].valid?.to_s} "
puts "Validation of a invalid object with type    ::   #{validation_hash[:sample_class_c].valid?.to_s}, #{validation_hash[:sample_class_c1].valid?.to_s} "

validation_hash.each_pair do |k, v|
  begin
    v.validate!
  rescue StandardError => e
    puts e.to_s
  end
end

begin
  require './sample_class3.rb'
  validation_hash[:sample_class_c4] = Sample3Class.new("germany", "73", 112)
rescue StandardError => e
  puts e.to_s
end

