# Bloat

[![Gem Version](https://badge.fury.io/rb/bloat.svg)](https://badge.fury.io/rb/bloat)
![CI](https://github.com/stephendolan/bloat/workflows/CI/badge.svg)

Bloat is a tiny wrapper around a [Thor](http://whatisthor.com) `apply` call, and allows running arbitrary Thor template code from anywhere!

## Installation

In a ruby project, you can add `bloat` to your `Gemfile`

For non-ruby projects, you'll need to install ruby, and then `gem install bloat`

## Usage

Just run `bloat with {template_url}`, and the content at the template will be run from your current directory! For examples of what you might want to do, check out [RailsBytes](https://railsbytes.com).

## Examples

Let's check out using `bloat` to make templates from [RailsBytes](https://railsbytes.com) work in a [Lucky](https://luckyframework.org) application.

#### We can add the lovely [StimulusJS](https://stimulusjs.org) library to Lucky our app with one command!

`bloat with https://railsbytes.com/script/zl0sKQ`

#### How about a Lucky app styled with TailwindCSS?

`bloat with https://railsbytes.com/script/VeKsGg`

#### Maybe we want to use TypeScript with Lucky?

`bloat with https://railsbytes.com/script/zl0sNL`

#### Bloat can even manage getting your Lucky app deployed to Heroku!

`bloat with https://railsbytes.com/script/VQLsab`
