### Ruby on rails - Todo_app

Basically I am java developer for nearly 2 years, for the last 3 months I worked with Node.js.
These days I thought of learning Ruby on Rails, and here goes my first application. 

For mac, Ruby will be by default available but you need to install rails. To install rails the command is 
```sudo gem install rails```

Once rails is installed you can create the complete skeleton of the rails app using the command ```rails new zakir_site```. please replace the name of your choice.


##### image bundle_install


Gemfile contains all the gems that are necessary for the basic application to run. if we need any extra features apart from the default gems, we need to add them up in the Gem file.

To install the gems here goes the command ```bundle install ```


Once command is run all the gems that are installed will be listed up. as the below image

Till Now things needed for rails to set up is done, Now you can run the rails server by using the command ```rails server```


If you hit localhost:3000 in the browser, Then you can see the output of default rails application in action.

####default rails browser image

Before Jumping into the application lets know something more about the default structure of Rails. 

**1.public:** public/index.html is the file that gets rendered when you see the output of the default Rails application in App Output tab. All the publicly accessible files resides in this folder. Rails won't process these folders these are accessible directly from the browser

**2.Gemfile:** It contains the gems necessery for the application.These gems are installed by using the command bundle install. If in between developing the application if we need any other gems, Then add those gems in the Gemfile and you need to run the command again.
let
**3.app** Here comes the actual stuff. app directory contains all application related files - the models, controllers and views. This is the heart of your application where all the magic happens.	

**4.config:** All the configuration related to the application is done here. Changes done to this file forces you to restart the server again.


Apart from Text editor like sublime, I recomend any one to try **Ruby Mine**. I felt more comfortable with this IDE and it helps you debug the code so easily and understand how rails works.  

#### Let the magic show begin:

**1.** Now we are about to create few controllers which will handle the requests and present the related views to it.
```rails generate controller Pages home about```

**2.** The above command says create a controller **Pages** with **home** and **about** as path. The result of the above commmand creates the things below


**3.** The above result clearly shows that it had created controller with name **pages_controller** and add the routes accordingly in routes.rb, It had created the relative views under app/views/pages. Helpers, Javascripts and stylsheet are also created. 


#### Flow of rails

**1.** when the request comes from the browser say	 **localhost:3000/pages/home** , the request first comes to routes.rb, matches with the **get "pages/home"**. As a result the request is forwarded to **pages_controller** and **home** action.If there is no matching url find, you will come across routing error. 

**2.** Lets see how the view is rendered,

All view files are dumped inside app/views directory of the Rails app by default. Inside app/views, every Controller gets a directory for its views. The directory name is Controller's name but in small letters. So 'Pages' controller's views are inside 'pages' directory of app/views.

You might have already figured out that there is a view file for every action of a Controller dumped inside the Controller's view directory. Again the association is by name. For home action, the corresponding view file is app/views/pages/home.html.erb. So when 'home' action executes, it fetches the view file & show it on the browser.

Here goes the image of the total structure of Rails
##### image rails structure 




#### Todo app

In this app, I am going add functionalities like 

- Add a todo
- Mark a todo as complete
- Unmark a todo
- delte a todo

**1.** Now we need create the basic skeleton for the rails```rails new todo_app```. The other steps will follow like ```bunle install```
start the server ```rails server```

**2.** Its time to concentrate on app directory, Lets create the controllers. ```rails generate controller Todos controller```. The above command will create controllers, views, helpers, javascript, stylesheet. please find the output below

```

create  app/controllers/todos_controller.rb
      route  get "todos/index"
      invoke  erb
      create    app/views/todos
      create    app/views/todos/index.html.erb
      invoke  test_unit
      create    test/functional/todos_controller_test.rb
      invoke  helper
      create    app/helpers/todos_helper.rb
      invoke    test_unit
      create      test/unit/helpers/todos_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/todos.js.coffee
      invoke    scss
      create      app/assets/stylesheets/todos.css.scss

```
