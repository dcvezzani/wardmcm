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

