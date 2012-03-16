require 'chronic'
require 'rcl/item'

class ItemFinder

  def all
    Item.all
  end

  def like(search_string)
    Item.filter(:entry.like("%#{search_string}%"))
  end

  def since(date_string)
    Item.filter("logged_at > ?", Chronic.parse(date_string))
  end

  def on(date_string)
    date_specified = Chronic.parse(date_string)
    start_of_day = Time.mktime(date_specified.year, date_specified.month, date_specified.day, 0)
    end_of_day = Time.mktime(date_specified.year, date_specified.month, date_specified.day, 24)
    Item.filter("logged_at BETWEEN ? AND ?", start_of_day, end_of_day)
  end
end
