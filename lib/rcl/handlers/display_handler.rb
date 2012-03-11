require 'rcl/item'
require 'rcl/item_finder'

class DisplayHandler

  def initialize(options)
    @options = options
  end

  def handle
    puts "ID\tText\n"
    puts "--\t----\n"
    if @options[:since]
      items = ItemFinder.new.since(@options[:since])
    elsif @options[:on]
      items = ItemFinder.new.on(@options[:on])
    elsif @options[:searchstring]
      items = Item.filter("entry LIKE ?", '%'+@options[:searchstring]+'%')
    else
      items = Item.all
    end
    items.each do |i|
      puts "#{i.id}\t#{i.entry}\n"
    end
  end

end
