require 'spec_helper'


 RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

describe 'Viewing todo items' do
	
	let!(:todo_list) { TodoList.create(title: 'Grocery List', description: 'Grocieries') }

	
	it "displays the title of the todo list" do
		visit_todo_list(todo_list)
		within("h1") do
			expect(page).to have_content(todo_list.title)
		end
	end

	it 'displays no items when a todo list is empty' do
		visit_todo_list(todo_list)
		expect(page.all("ul.todo_items li").size).to eq(0)
	end

	it 'display item content when a todo list has items' do
		todo_list.todo_items.create(content: 'Milk')
		todo_list.todo_items.create(content: 'Eggs')
		visit_todo_list(todo_list)
		expect(page.all("ul.todo_items li").size).to eq(2)

		within 'ul.todo_items' do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Milk")
		end
	end	

end