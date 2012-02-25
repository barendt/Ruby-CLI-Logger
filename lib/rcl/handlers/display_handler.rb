require 'rcl/item'

class DisplayHandler

  def initialize(args)
  end

  def handle
    puts "ID\tText\n"
    puts "--\t----\n"
    Item.all.each do |i|
      puts "#{i.id}\t#{i.entry}\n"
    end
  end

end
