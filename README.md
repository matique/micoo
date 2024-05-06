# Micoo

[![Gem Version](https://badge.fury.io/rb/micoo.png)](http://badge.fury.io/rb/micoo)
[![GEM Downloads](https://img.shields.io/gem/dt/micoo?color=168AFE&logo=ruby&logoColor=FE1616)](https://rubygems.org/gems/micoo)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](http://choosealicense.com/licenses/mit/)

Micoo (minimal Cookie) is a Rails Engine handling the Cookie consent.
Besides installing the gem just a minimal code is required (see _Usage_).

Micoo display a styled text including buttons for
accepting or rejecting usage of cookies.

Clicking *Accept* set the cookie "cookiesOK" to "x",
clicking *Reject" will delete the cookie.

## Optional Parameters

Optional parameters for *CookiesComponent.new(...)* are:

### _text_

Default is:

   You may delete and block all cookies from this site,
but parts of the site will not work.

   Click *Accept* if you consent usage of cookies, otherwise click *Reject*.

### _text2_

_text2_ may be used to
add additional text and links for further description.

### _url_

Redirection to _url_ will be triggered by clicking *Accept* or *Reject*.
Defult is "/".

## Usage

```ruby
# app/controllers/application_controller.rb (recommended)
  ...
  before_action :always

  def always
    unless cookies[:cookiesOK] == "x"
      render CookiesComponent.new(url: root_path)
    end
  end
  ...
```

## Installation
As usual:

```ruby
# Gemfile
gem "micoo"
```

and run "bundle install".

## License
Copyright (c) 2024 Dittmar Krall (www.matiq.com),
released under the [MIT license](https://opensource.org/licenses/MIT).
