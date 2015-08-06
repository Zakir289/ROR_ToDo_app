class TodosController < ApplicationController
  def index
      @todo_items = Todo.all
  end

  def delete
  	t = Todo.last
  	t.delete
  end

 def add
   Todo.create(:todo_item => params[:todo_text])
   redirect_to :action => 'index'
  end

   def complete
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
          t.update_attribute(:completed, true)
     end
    redirect_to :action => 'index'
 end
end