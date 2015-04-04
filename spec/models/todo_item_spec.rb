require 'spec_helper'
require "minitest/autorun"

describe TodoItem do
  it { should belong_to(:todo_list) }
end
