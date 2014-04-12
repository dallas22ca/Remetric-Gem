Remetric.config do |config|
  config.trackable_models = {
    contact: {
      key: :id,
      id: "string",
      name: "string",
      email: "string"
    },
    organization: {
      key: :id,
      id: "string",
      name: "string"
    }
  }
end
