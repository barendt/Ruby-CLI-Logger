require 'base64'
require 'net/http'
require 'net/https'

class Simplenote

  def initialize(email, password)
    @email = email
    @password = password
    @token = nil
    authenticate
  end

  private
  def authenticate
    resource = '/api/login'
    body = Base64.encode64("email=#{@email}&password=#{@password}")
    make_request(resource, body)
  end

  def make_request(resource, body)
    @ua = Net::HTTP.new('simple-note.appspot.com', 443)
    @ua.use_ssl = true
    response, token = @ua.post(resource, body)
    puts token
    puts response.code.to_s
  end
end
