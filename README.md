# README

## To create a project:

* User the right ruby version: `rvm use 2.6.x` where x is your installed minor version `rvm list rubies` to see installed rubies
* Check rails version: `rails -v`, it should be `5.2`
* Then `rails new path/to/project`, can be just: `rails new lgm_redmine` to create the project in current folder

* The `root` of the project (or "racine" in French), is the lgm_redmine folder created above.

**Some options**

These can be used with the `rails new` command:

* --database=mysql : preconfigure project with specified database (postgresql, mysql...), sqlit3 by default
* --api : generate a smaller stack to use Rails as a backend API only
* --webpacker=react : preconfigure project with webpack and a JS framework (react, vue, angular...)
* --help : to see all the options

## Before we begin

Clone project from github
Do a bundle install, check if it is running ok

## Course plan

* Exercice solutions
* Rails and MVC presentation
* New project
* What is `defined?` and `&.` trick, quickly explain that rails had its own method `.try`
* Explain what `rails new project` did
* Discover Rails architecture

* launch server: `rails server` or just `rails s` (options: -p 3001 -b 0.0.0.0)
* Define main route
* Create a controller and an action
* Create a view
* Explain rescue_from

### Models

* Generate a model, explain what it does (with a published thing)
`rails g model Project title:string archive:boolean description:text`
`rake db:create`
`rake db:migrate`

* Explain validations, show example in console: `rails console` or just `rails c` - show error because of database not null constraint
[doc](https://guides.rubyonrails.org/active_record_validations.html#validation-helpers)

* Explain migrations, generate a new migration to edit previously created table:
`rails g migration add_slug_to_projects 'slug:string{60}'`
`rake db:migrate`
[doc](https://guides.rubyonrails.org/active_record_migrations.html)

* Explain callbacks, show an example
```ruby
p = Project.create(title: "Super project")
p2 = Project.create(title: SecureRandom::hex(64))
p2.destroy
p.delete # explain diff
```

* Use seed and explain
`rake db:seed`

* Play with active record in console
[doc](https://guides.rubyonrails.org/active_record_querying.html)

* Explain scopes, show an example

**Exercice 1**

* Create the Task model, with a title, a content and a priority (integer)
* Add a seed to create some tasks
* Add a validation (a task should have a title, and a priority from 0 to 5)
* Add a two scopes:
* one named most_importants (show tasks with priority 4 or 5)
* one named by_priority (to order tasks by priority)

### Layout and styling

* Explain how the layout works, show content_for? / content_for & yield(...)
* Replace with a @variable
* Add some style
* Explain helpers
* Explain partials

**Exercice 2**

* Create a partial for the footer
* Add some styling to the footer (nothing too fancy)

### Views and controllers

* Explain routes.rb, show rails routes / rails routes -g, add a resources, show differences with only, except. Add some member/collection routes. Explain admin namespace
* Create the index / new / show / edit / update / form logic
* Show byebug

**Exercice 3**

* Let them handle the logic for tasks

**Solution**
* Explain scaffold, use it to solve the exercice
* Explain what it creates by default (and rails formats)

### Associations

* Explain associations, associate project and tasks
* Explain build, create (with has_one / has_many)
* Explain:

```ruby
.where().first_or_create
.find_or_create_by()
```

* Add tasks number in projects index
* Explain N+1 problem and its solution (2 solutions, with includes & counter_cache)
* Explain diff between .length .count .size (maybe with .explain)
* Nested tasks, usefull partial, counter cache, moving tasks and a bit of coffee

**Exercice 4**

* Generate a new Category model using scaffold, with just a name:string property
* Create a join table between categories and projects, command:
```bash
rails g migration CreateJoinTableCategoryProject category project
```

* Use the [has_and_belongs_to_many](https://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association) association
* Create a category (from console or web app)
* Try: `Category.first.projects << Project.last` in a **rails console** and try to understand what it does
* Try another time the same command... see what happens
* How could we prevent this problem? - maybe with [this?](https://guides.rubyonrails.org/association_basics.html#methods-added-by-has-and-belongs-to-many-collection-exists-questionmark)
* Remove data with: `Category.first.projects.delete(Project.last)`
* Add a projects list in the category show page

**-- End ex 4 --**

* Explain how to add a select field in project form to select several categories


### Gems!

* Explain rubygems, Gemfile & bundler, launch doc server: `gem server`, if no doc: `gem rdoc --all`
* Install devise gem (for authentication), add a "admin" boolean
* add a "private" part (only viewable by current user)
* Install letter opener
* We now have authentication

* Add some authed part, with some secret data
* Display a logo somewhere

**Exercice 5**

* Add an attachment to [projects](https://guides.rubyonrails.org/active_storage_overview.html#attaching-files-to-records)
* Only allow admin to see that field in the form
* How would you prevent the update of that field from the controller by normal/guest users?

**-- End ex5 --**

* Explain how to display the image
* Send a notification to users linked to a project when a task is created (explain Action Mailer), add an attachment
* Explain TDD
* Explain translations (i18n)
* Show usual gems

## If we have time:

* Explain how to create API
* Explain documentation
* Use another db
* Explain rails/rake tasks (and create one - for cronjobs for instance)
* Explain turbolinks
* Explain concerns
* Explain default security in Rails
* Explain how to deploy with capistrano
* Add CSS framework (zurb foundation)
* Add a lib through webpacker
* Action Cable
* Active Job
* logger

### What gems do I use?

* slim - indented html
* simple_form - simple way to create forms (detect validations...)
* cocoon - simple way to handle nested models in forms, works great with simple_form
* gon - easy way to give some JS info from Rails to JS code
* will_paginate - handle pagination
* devise - authentication
* devise_masquerade - masquerade
* pundit - authorizations
* rolify - roles management
* prawn - pdf generator

**In dev**

* annotate - add some info to your models
* byebug - debug
* rspec - unit tests
* factory bot - simple way to create data in unit tests
* guard - a watcher that can be extended
* guard livereload / rack livereload - livereload
* letter opener - to see and get emails when developing
* rails best practices - to check your code and propose some improvements
* brakeman - to check your code for vulnerabilities
* bundler-audit - to check existing CVE in used gems
* rubocop - to check code syntax
* rubocop-rails_config - to configure rubocop with same configs as the official rails repo
* bullet - logs N+1 problems

**For deployment**

* capistrano - best tool to deploy an app in ruby
* capistrano-rvm
* capistrano-yarn
* capistrano-bundler
* capistrano-rails
* capistrano-rake
