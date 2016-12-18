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

