# Ruby On Rails - todo_app

Basically I code in Java or Node.JS,These days I thought of learning Ruby on Rails, and here goes my first application. 

For mac, Ruby will be by default available but you need to install rails. To install rails the command is 
```sudo gem install rails```

Once rails is installed you can create the complete skeleton of the rails app using the command ```rails new todo```. please replace the name of your choice.

Till Now things needed for rails to set up is done, Now you can run the rails server by using the command ```rails server```

![above command output] (AppSkeleton.png)



#####  bundle_install
![above command output] (BundleInstall.png)


Gemfile contains all the gems that are necessary for the basic application to run. if we need any extra features apart from the default gems, we need to add them up in the Gem file.

If you hit localhost:3000 in the browser, Then you can see the output of default rails application in action.


Before Jumping into the application lets know something more about the default structure of Rails. 

**1.public:** public/index.html is the file that gets rendered when you see the output of the default Rails application in App Output tab. All the publicly accessible files resides in this folder. Rails won't process these folders these are accessible directly from the browser

**2.Gemfile:** It contains the gems necessery for the application.These gems are installed by using the command bundle install. If in between developing the application if we need any other gems, Then add those gems in the Gemfile and you need to run the command again.
let
**3.app** Here comes the actual stuff. app directory contains all application related files - the models, controllers and views. This is the heart of your application where all the magic happens.	

**4.config:** All the configuration related to the application is done here. Changes done to this file forces you to restart the server again.


Apart from Text editor like sublime, I recomend any one to try **Ruby Mine**. I felt more comfortable with this IDE and it helps you debug the code so easily and understand how rails works.  

#### Let the magic show begin:

**1.** Now we are about to create few controllers which will handle the requests and present the related views to it.
```rails generate controller Todo index```

**2.** The above command says create a controller **Todo** with **index**  as path. The result of the above commmand creates the things below

```

create  app/controllers/todo_controller.rb
       route  get 'todo/index'
      invoke  erb
      create    app/views/todo
      create    app/views/todo/index.html.erb
      invoke  test_unit
      create    test/controllers/todo_controller_test.rb
      invoke  helper
      create    app/helpers/todo_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/todo.coffee
      invoke    scss
      create      app/assets/stylesheets/todo.scss
      
      ```

**3.** The above result clearly shows that it had created controller with name **todo_controller** and add the routes accordingly in routes.rb, It had created the relative views under app/views/pages. Helpers, Javascripts and stylsheet are also created. 


#### Flow of rails

**1.** when the request comes from the browser say	 **localhost:3000/todo/index** , the request first comes to routes.rb, matches with the **get "todo/index"**. As a result the request is forwarded to **todo_controller** and **index** action.If there is no matching url find, you will come across routing error. 

**2.** Lets see how the view is rendered,

All view files are dumped inside app/views directory of the Rails app by default. Inside app/views, every Controller gets a directory for its views. The directory name is Controller's name but in small letters. So 'todo' controller's views are inside 'todo' directory of app/views.

You might have already figured out that there is a view file for every action of a Controller dumped inside the Controller's view directory. Again the association is by name. For index action, the corresponding view file is app/views/todo/index.html.erb. So when 'index' action executes, it fetches the view file & show it on the browser.

Here goes the image of the total structure of Rails
##### image rails structure 


In this app, I am going add functionalities like 

- Add a todo
- Mark a todo as complete
- Unmark a todo
- delte a todo



#### Generating the model
```

rails generate model Todo todo_item:string
       invoke  active_record
      create    db/migrate/20150716185841_create_todos.rb
      create    app/models/todo.rb
      invoke    test_unit
      create      test/models/todo_test.rb
      create      test/fixtures/todos.yml
/Users/zakirelahi/GitHubProjects/todo_app $ 
      ```
      
      
from above we can se that it has created a model in `app/models/todo.rb` and create a migration file under `app/migrate` and then test cases.

we can edit this migration file to change the schema of the table or insert few rows....

**rake db:migrate** pushes the database changes from the migration file to the actual database. In Rails the default database is sqlite.

```
rake db:migrate 
== 20150716185841 CreateTodos: migrating ======================================
-- create_table(:todos)
   -> 0.0030s
== 20150716185841 CreateTodos: migrated (0.0031s) =============================


    ```
 
 Rails model help us get rid of running sql queries for each and every database task which is not fine=

  You would hardly need to refer to the actual table by the name todos. You would only be accessing the data through the model Todo.

#### Adding the unit to the database
- Add html under `app/views/todos/index.html.erb`
```html

<%= form_tag("/todos/add", :method=>"post") do %>
  <%= text_field_tag(:todo_text) %>
  <%= submit_tag("Add todo", :class=>"btn") %>
<% end %>
```
- Adding the route in `config/routes.rb`
```html

match "todos/add" => "todos#add", :via => :post
```
- Adding add function in Todo controller
```ruby
def add
   Todo.create(:todo_item => params[:todo_text])
   redirect_to :action => 'index'
  end
  ```
  - Above Todo.create will fail, To get rid of that add the following line 
 `  attr_accessible :todo_item` in `app/models/todo.rb`

- ITts time to validate the enter todo unit
- 

#### Delete an unit

- Create a new view - app/views/todo/delete.html.erb.
`touch app/views/todo/delete.html.erb`
- Add the line below anywhere in config/routes.rb. Rails router will map /todo/delete to the delete action that we created.` get "/todo/delete"`


#### Include Bootstrap
- Including the bootstrap from CDN to application 
 ```html
 
<%= stylesheet_link_tag "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" %>
```

- Include the below code in `app/views/layouts/application.html.erb"
```html

<body>
<div class="navbar">
  <div class="navbar-inner">
    <a class="brand" href="#">ZAK todo</a>
  </div>
</div>

<%= yield %>

```


#### app/assets/stylesheets/application.css

```

 * You're free to add application-wide styles to this file and they'll appear at the top of the
 * compiled file, but it's generally better to create a new file per style scope.
 *
 *= require_self
 *= require_tree .
*/

```

- The line require_tree . includes all the files which are present inside the directory where the file is - app/assets/stylesheets/. Since bootstrap.css is in the directory, it gets included automatically.
- Rails processes all the files inside app/assets/ and makes them available under '/assets' url. So bootstrap.css, if dumped inside app/assets/stylesheets directory, becomes available at '/assets/bootstrap.css'.
