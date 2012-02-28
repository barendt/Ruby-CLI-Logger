require 'chronic'
require 'rcl/item'

class DisplayHandler

  def initialize(options)
    @options = options
  end

  def handle
    puts "ID\tText\n"
    puts "--\t----\n"
    if @options[:since]
      items = Item.filter("logged_at > ?", Chronic.parse(@options[:since]))
    elsif @options[:on]
      date_specified = Chronic.parse(@options[:on])
      start_of_day = Time.mktime(date_specified.year, date_specified.month, date_specified.day, 0)
      end_of_day = Time.mktime(date_specified.year, date_specified.month, date_specified.day, 24)
      items = Item.filter("logged_at BETWEEN ? AND ?", start_of_day, end_of_day)
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
