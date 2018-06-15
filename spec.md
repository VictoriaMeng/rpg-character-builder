# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  - Sinatra required in Gemfile.
  - All controller routes use Sinatra syntax
- [x] Use ActiveRecord for storing information in a database
  - ActiveRecord required in Gemfile.
  - All model classes inherit from ActiveRecord::Base
  - All migration classes inherit from ActiveRecord::Migration
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  - Three model classes: User, Character, Game
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
  - User has_many Characters and has_many Games through Characters
  - Game has_many Characters and has_many Users through Characters
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
  - Character belongs_to User and Game
- [x] Include user accounts
  - Users may sign up for accounts and login
- [x] Ensure that users can't modify content created by other users
  - Control flow in multiple controller routes check for whether the User is logged in and owns the Character
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  - Characters can be created, viewed, updated, and destroyed.
- [x] Include user input validations
  - Users may not sign up with username/email that's already taken.
  - Empty fields not allowed when creating characters.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
  - Flash messages alert users of validation errors.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  - Done.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
