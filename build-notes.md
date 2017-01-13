Create TextMessage model
```
bin/rails g scaffold TextMessage subject body send_at:datetime
bin/rake db:migrate
```

Add jquery assets to Bowerfile
```
# /Users/davidvezzani/rails-app/wardmcm/Bowerfile
asset 'jquery-ui'
asset 'jquery-timepicker'
```

Pull in assets
```
rake bower:install
```

Add js assets to pipeline; paths relative to `vendor/assets/bower_components`
```
# /Users/davidvezzani/rails-app/wardmcm/app/assets/javascripts/application.js
//= require jquery-ui/jquery-ui
//= require jquery-timepicker/jquery.ui.timepicker

```

Add css assets to pipeline.  Could probably provide additional path information instead of adding to assets path.
```
# /Users/davidvezzani/rails-app/wardmcm/app/assets/stylesheets/application.css.scss
 *= require jquery-ui
 *= require jquery.ui.timepicker

# /Users/davidvezzani/rails-app/wardmcm/config/application.rb
config.assets.paths << Rails.root.join("vendor","assets","bower_components","jquery-ui","themes","black-tie")
config.assets.paths << Rails.root.join("vendor","assets","bower_components","jquery-timepicker")
```

Use date/time picker widget for datetime attributes
```
# /Users/davidvezzani/rails-app/wardmcm/app/inputs/date_time_input.rb
template.content_tag(:div) do
  [template.content_tag(:input, nil, {id: "#{self.object_name}_#{self.attribute_name}_date", class: 'form-control datetime optional', name: "#{self.object_name}[#{self.attribute_name}][date]"}), 
   template.content_tag(:input, nil, {id: "#{self.object_name}_#{self.attribute_name}_time", class: 'form-control timetime optional', name: "#{self.object_name}[#{self.attribute_name}][time]"})].join("\n").html_safe
end
```

Add phone number attribute for user
```
bin/rails g migration add_phone_number_to_users phone:string
bin/rake db:migrate
```

Add draper for decorator support
```
# Gemfile
gem 'draper'

rails generate decorator User
```

bin/rake db:rollback
bin/rails destroy scaffold PersonalHistoryStory

bin/rails g scaffold PersonalHistoryStory subject body:text took_place_at:datetime
bin/rake db:migrate

bin/rails g scaffold LessActiveMember surname given_name current_address:text new_address:text new_phone reference:text
#bin/rake db:rollback
bin/rake db:migrate

bin/rails g migration add
$ bin/rails generate migration AddPartNumberToProducts part_number:string:index
bin/rails g migration AddLessActiveMemberIndexToSurnameGivenName 

bin/rails g migration AddToProducts part_number:string:index

add_index :products, :part_number

bin/rails g scaffold Note user_id:integer body:text

bin/rails g migration add_resources_to_less_active_members resources:text


class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :notable_id
      t.string :notable_type
      t.integer :author_id
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end

bin/rails g scaffold Attachment user_id:integer body:text

render file: "/u/apps/warehouse_app/current/app/views/products/show"

bin/rails destroy controller File
bin/rails g controller File file

      create  app/controllers/file_controller.rb
       route  get 'file/file'
      invoke  erb
      create    app/views/file
      create    app/views/file/file.html.erb
      invoke  rspec
      create    spec/controllers/file_controller_spec.rb
      create    spec/views/file
      create    spec/views/file/file.html.erb_spec.rb
      invoke  helper
      create    app/helpers/file_helper.rb
      invoke    rspec
      create      spec/helpers/file_helper_spec.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/file.coffee
      invoke    scss
      create      app/assets/stylesheets/file.scss
      invoke  decorator
      create    app/decorators/file_decorator.rb
      invoke    rspec
      create      spec/decorators/file_decorator_spec.rb

