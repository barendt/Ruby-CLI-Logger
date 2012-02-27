require 'rcl/item'

class DisplayHandler

  def initialize(options)
    @options = options
  end

  def handle
    puts "ID\tText\n"
    puts "--\t----\n"
    if @options[:searchstring]
      items = Item.filter("entry LIKE ?", '%'+@options[:searchstring]+'%')
    else
      items = Item.all
    end
    items.each do |i|
      puts "#{i.id}\t#{i.entry}\n"
    end
  end

end
