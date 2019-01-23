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


#### Whats is the purpose of ActiveRecord?
The ActiveRecord Ruby gem allows you to map relationships from databases to
actual Ruby objects. It makes CRUD tasks much more simpler and quicker to
achieve, bypassing the need to use structured query language.

#### What model and associations will you have and why?
The first model will be a User model. This will allow you to create an account,
which provides a User access to their own data on the app.

The second model will be a Player model. This will contain attributes 'name',
'price', 'team', 'futures', 'quantity' and 'date purchased'. A User will
input the data for the attributes and be able to persist them to the database.

#### What validations will you use on your models?
A User will not be able to sign up without all 3 attributes, username, email
and password. They also can not log in without providing both their email
and password. Users will not be able to sign up with an email that already
exists. A flash message will appear if an error occurs.

#### How will you implement an authentication system?
I will create User authorisation with the Bcrypt gem, and store the User ID in
a session hash.

#### Who should be able to edit and destroy a model?
Only the User who's session it is will be allowed to see their own data. They
will only be allowed to edit and destroy their own data.

#### What will you need to implement to have your application considered a CRUD app?
A User will be able to create an instance of a Player, view the player by :id,
edit the players attributes and delete the player if needed.


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

## Football Index Player Tracker - Structure

###Model
user.rb // User - will have a username, email and password(digest)
          has_many :players

player.rb // Player - will have a name, a team, a price per future(share),
          futures bought and a timestamp for when the shares were bought.
          belongs_to :user

###Views
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

###Controllers
application controller // Class Application controller, require environment,
                          configure public folder, views, sessions
                          get '/'

player_controller //  get '/players/new'
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
                    get '/logout'
