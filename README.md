[1;5C# Micoo

[![Gem Version](https://badge.fury.io/rb/micoo.svg)](http://badge.fury.io/rb/micoo)
[![GEM Downloads](https://img.shields.io/gem/dt/micoo?color=168AFE&logo=ruby&logoColor=FE1616)](https://rubygems.org/gems/micoo)
[![rake](https://github.com/matique/micoo/actions/workflows/rake.yml/badge.svg)](https://github.com/matique/micoo/actions/workflows/rake.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/standardrb/standard)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](http://choosealicense.com/licenses/mit/)

Micoo (minimal Cookie) is a Rails Engine handling the Cookie consent.
Besides installing the gem just a minimal code is required (see _Usage_).

Micoo display a styled text including buttons for
accepting, rejecting and customize usage of cookies.

Clicking *Accept* set the cookie "cookiesOK" to "x",
clicking *Reject* will delete the cookie,
clicking *Customize* links to administration of cookies.

## Optional Parameters

Optional parameters for *CookiesComponent.new(...)* are:

### _text_

Default is:

> You may delete and block all cookies from this site,
> but parts of the site will not work.
>
> Click *Accept* if you consent usage of cookies, otherwise click *Reject*.

### _url_

Redirection to _url_ will be triggered by clicking *Accept* or *Reject*.
Default is *request.url*.

## Usage

```ruby
# config/routes.rb
Rails.application.routes.draw do
  ...
  get "/cookies/accept"
  get "/cookies/reject"
  ...
end
```

```ruby
# app/controllers/application_controller.rb (recommended)
  ...
  before_action :always

  def always
    unless cookies[:cookiesOK] == "x"
      render CookiesComponent.new(url: request.url)
    end
  end
  ...
```

## I18n
You may provide an "internationalized" text via the _text_ parameter.

_Micoo_ buttons uses the I18n.translate method for the legend.
A configuration file (a sample) may be:

```ruby
# config/locales/en.yml
en:
  micoo:
    button:
      accept: Accept
      reject: Reject
      customize: Customize
```

## Installation
As usual:

```ruby
# Gemfile
gem "micoo"
```

and run "bundle install".

## License
Copyright (c) 2024-2025 Dittmar Krall (www.matiq.com),
released under the [MIT license](https://opensource.org/licenses/MIT).
