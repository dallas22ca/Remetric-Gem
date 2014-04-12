require 'test_helper'

module Remetric
  class EventTest < ActiveSupport::TestCase
    test "the truth" do
      c = {
        id: "123",
        name: "Awesome Person"
      }
      e = Remetric.track(
        description: "{{ contact.name }} did this thing.",
        contact: c
      )
      assert e.story.include? c[:name]
    end
  end
end
