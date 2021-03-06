# Donut Api

This is a practice activity for setting up a Rails API. 

# Resources to Use
  *Rails 5.1.0
  *Postgres Database
  *Devise and Simple Token Authentication[https://github.com/gonzalo-bulnes/simple_token_authentication]  

  *Rspec for tests
  *Google Api for map

## Stories
  1. User can create a user with a password, login, and logout. 
  2. User can create a new donut and review it
  3. User can see all of their donuts and an average of the donut ratings
  4. User can share the donut review with other users by making it public or private
  ~5. Donuts display a map of their location.~
  ~6. Donuts of the same name and same location are grouped together under the Donut Shop~
  5. 
  7. Users can reset their password.


  Create User

  curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" --data '{"user": {"email": "dog@email.com2", "password": "password"}}' http://localhost:3000/register



  Login User

  curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" --data '{"user": {"email": "dog@email.com2", "password": "password"}}' http://localhost:3000/login


  Create Donut

 curl -H "X-User-Token:5e1944f1087fafc9a343"  --data "donut[name]=test&donut[description]=Donut has a creamy filling&donut[type_of_donut]=Yeast&donut[shop_id]=3&donut[review]=Yummy delight" http://localhost:3000/donuts 

  Get Donuts

  curl -H "X-User-Email: test@example.com2" -H "X-User-Token:efa20f6f5362fdf4864d"  http://localhost:3000/donuts

  curl -H "X-User-Token:efa20f6f5362fdf4864d"  http://localhost:3000/donuts

  
  Get Donuts from a specific user
  
  The email address must match the user with the token

  curl -H "X-User-Token:df3416d4db4142121927"  http://localhost:3000/donuts?current_user=test@email.com2




