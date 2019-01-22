# Create a CRUD,MVC app using Sinatra
-------------------------------------------------------------------------------

*I will be creating Football Index Player Tracker
This is my custom application which will be used to track the movements
of selected players from the Football Index Website.

[Football Index](https://footballindex.co.uk)

Football index is a website that combines fantasy football with a stock market
trading platform. Customers are able to invest real money in shares(or futures
as described on the website) for a player, and can buy and sell their shares
at will.  My app will allow a customer to create an account, and with a few
attributes, be able to track players specific to them.

Upon Signup/Login, a user will be directed to their player show page, which
will display in list format, all the players they have bought/tracked.

Players
              Team          Quantity         Total Price          Share Price         
P. Pogba      Man Utd          11              £180.62              £16.42
M. Rashford   Man Utd          30              £302.40              £10.08
G. Higuain    Juventus         10              £38.60                £3.86*


## Project Review
Go through your app, and show how it meets the requirements.
10-15 mins

Explain your code from execution point to exit point (Show understanding).
10-15 mins

Live code. Either refactor of add a feature as an exercise to make sure you
are comfortable with your code.
10-15 mins

--------------------------------------------------------------------------------

## Requirements

Build an Model, Views, Controller Sinatra Application

Use ActiveRecord with Sinatra

Use at least on has_many relationship on a User model, and one belongs_to
relationship on another model

Must have user accounts - users must be able to sign up, sign in, and sign out

Validate uniqueness of user login attribute(username or email)

Once logged in, a user must have the ability to CRUD the resource that
belongs_to a user

Ensure that users can edit and delete only their own resources, not others

BONUS - Display validation failures to user with error messages.

--------------------------------------------------------------------------------

## Football Index

*Model
user.rb // User - will have a username, email and password(digest)
          has_many :players

player.rb // Player - will have a name, a team, a price per future(share),
          futures bought.
          belongs_to :user

Views
index.erb // Loads a page where a user can sign up or login to the app

layout.erb // Contains the html structure for the website

  PLAYERS
    new.erb // Create a new player to keep track of
    edit.erb // Edit number of shares bought, or price
    show.erb // Display a single player, and his information
    players.erb // Display all owned players

  USERS
    create_user.erb // Create a new user, with a username, email and password
    login.erb // Login with an existing account

Controllers
application controller // Class Application controller, require environment,
                          configure public folder, views, sessions
                          get '/'

player_controller // get '/players/new'
                      post '/players'
                      get '/players'
                      get '/players/:id'
                      get '/players/:id/edit'
                      post/patch '/players/id'
                      delete '/players/:id'


users_controller // get '/users/new'
                    post '/users'
                    get '/users/login'
                    post '/login'
                    get '/logout'*
