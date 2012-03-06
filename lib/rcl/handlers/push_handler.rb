require 'highline/import'
require 'rcl/simplenote'

class PushHandler

  def initialize(options)
    @options = options
  end

  def handle
    prompt
    s = Simplenote.new(@email, @password)
  end

  private
  def prompt
    @email = ask("Enter your Simplenote email:  ") { |q| q.echo = true }
    @password = ask("Enter your Simplenote password:  ") { |q| q.echo = "*" }
  end

end
