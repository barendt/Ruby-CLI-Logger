require 'rcl/simplenote'

class PushHandler

  def initialize(options)
    @options = options
  end

  def handle
    puts "Simplenote email: "
    email = gets.chomp
    puts "Simplenote password: "
    password = gets.chomp

    s = Simplenote.new(email, password)
  end

end
