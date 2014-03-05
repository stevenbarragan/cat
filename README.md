Cat tic-tac-toe
===============

Cat is a tic-tac-toe game, player vs computer, but the computers, as you know, they're so smart, so computer always is going to win!!

Try it [cat tic-tac-toe](http://cat-tictactoe.herokuapp.com/)

Why is it called cat?
--------------------

Because in México we call this game "Gato", cat in English, why? I don't know.

Instalation
===========

```sh
git clone git@github.com:stevenbarragan/cat.git
cd cat
bundle
rails server
```

Testing
=======

## Ruby code

```sh
bundle exec rspec
```
## Javascript

### Prerequisites
```sh
brew install phantomjs
```

### Running from the command line

```sh
RAILS_ENV=test bundle exec rake spec:javascript
```

### Running from your browser

Start rails server
```sh
bundle exec rails s
```
And navitagate to `http://localhost:3000/specs`


Copyleft (c) 2014 Steven Barragan
