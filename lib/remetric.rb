require "remetric/version"

class Remetric
  
  def initialize api_key, sandbox = false
    @rm_api_key = api_key
    @rm_sandbox = sandbox
  end

  def api_key
    @rm_api_key
  end

  def save_contact data = {}
    RestClient.post "#{endpoint}/contacts/save.json", {
  		api_key: api_key,
  		contact: {
  		  data: data
  		}
    }
  end

  def track description, data = {}
    RestClient.post "#{endpoint}/events.json", {
  		api_key: api_key,
  		event: {
  			data: data,
  			description: description
  		}
    }
  end

  def endpoint
    @rm_sandbox ? "http://localhost:3000" : "https://secure.remetric.com"
  end
end
