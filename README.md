# RailsTinyMCE - A Rich Text Editor for rails

TinyMCE is a javascript rich text editor. It is easy to integrate with blogs, cms, messages and mailers.

Plugin uses jrails(jQuery) and Paperclip plugin for image & media upload support

Features
--------------
- Provides Rich Text Editor
- Customisable TinyMCE plugins
- Easy to integrate
- Supports Image upload & insert
- Supports Media upload & Youtube embed 
- TODO: Document upload plugin

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_tinymce'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_tinymce

## Migrations

```ruby    
rails g tiny_migration
rake db:migrate
```
## Dependency Gems
- paperclip `git://github.com/thoughtbot/paperclip.git`
- respond_to_parent `git://github.com/itkin/respond_to_parent.git`
- will_paginate `git://github.com/mislav/will_paginate.git`

## Usage
- In your layout add following lines
```
<%= javascript_include_tag :defaults %>
<%= javascript_include_tiny_mce_if_used %>
<%= tiny_mce if using_tiny_mce? %>
``` 
- Inside controller class on top add following lines
```
uses_tiny_mce(options: AppConfig.default_mce_options, only: [:new, :edit])
```
This AppConfig.default_mce_options is in `config/initializers/tiny_mce_plus_config.rb`, you could change the setting there
- In your view add class mceEditor to text_area
Then append the following to the text area you want to transform into a TinyMCE editor.
```
:class => :mceEditor
```
- Install file lists
```
rake rails_tiny_mce:install
```
This will create following files:
``` 
    app
      |-- controller
        |-- attachments_controller.rb
      |-- helpers
        |-- remote_link_renderer.rb
      |-- models
        |-- print.rb
        |-- video.rb
      |-- views
        |-- attachments
           |-- _show_attachment_list.html.erb
    config
      |-- initializers
        |-- tiny_mce_plus_config.rb
    public
      |-- images
        |-- tiny_mce
      |-- javascripts
        |-- tiny_mce
``` 
You may custom the config in tiny_mce_plus_config.rb.
 
## Attention Note:
* Do not put `\<p> \</p>` around the textarea.
* If you are using `old will_paginate plugin`, change the *url_for* to *url_option* in *remote_link_renderer.rb*
* If you are using `gem "will_paginate", "~> 3.0.pre2"` you need changes in `app/helpers/remote_link_renderer.rb`
    `class RemoteLinkRenderer < WillPaginate::LinkRenderer`
to
    `class RemoteLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer`

## Example use:

- Create CRUD for post
    
    rails g scaffold post title:string text:description
 
- Run Migrations
    
    rake db:migrate
 
- Add following line to *posts_controller.rb*
    
    uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit])
 
- Open */views/posts/_form.html.erb* 

- Modifiy following line
    
    <%= f.text_area :description %>
to
    <%= f.text_area :description, :class => :mceEditor %>
 
## FAQ
* How to get image from post body 
```
#Add imagepath method in post model
def imagepath
  match = body.match(/img src="(.+)" border/)
  $1 if match
end
```
And use *post.imagepath* to get url of image embeded in post content

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_tinymce. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

