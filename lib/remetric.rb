require "remetric/version"
require "base64"
require "json"
require "rest_client"

class Remetric
  def initialize api_key, sandbox = false
    @rm_api_key = api_key
    @rm_sandbox = sandbox
  end

  def api_key
    @rm_api_key
  end

  def track data = {}
    begin
      RestClient.post "#{endpoint}/events.json", {
    		remetric_api_key: api_key,
    		event: data
      }
    rescue
      { errors: "You are unauthorized." }
    end
  end
  
  def img data = {}
    base64 = to_base64 data
    src = "#{endpoint}/events/img/#{base64}";
    img = "<img src=\"#{src}\" style=\"display: none; \">";
    img
  end
  
  def redirect data = {}
    base64 = to_base64 data
    href = "#{endpoint}/events/redirect/#{base64}";
    href
  end
  
  def to_base64 data = {}
    data["remetric_api_key"] = api_key
    URI.escape Base64.encode64(JSON.generate(data))
  end

  def endpoint
    @rm_sandbox ? "http://localhost:3000" : "https://secure.remetric.com"
  end
end
