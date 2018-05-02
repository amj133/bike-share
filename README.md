# Bike share

This application is used to track bike share data within the greater San Fransisco Metropolitan Bay Area.  The data includes 70 stations throughout the Bay area, with over 600,000 trips between the stations.  Users can view analytics for stations, trips, and weather conditions.  Complex analytic queries were performed using Active Record.  The site offers seperate functionality for guests, users, and administrators.  Authentication of users is performed using bcrypt.  Guests have the ability to view station, trip, and conditions info, as well as add bike shop accessoires to their cart, however they cannot checkout without first registering as a user.  This application employs a session based cart.  Users can view analytics of bike share data and checkout items from the bike shop.  Administrators can add or delete station, trips, and condition information.  Administrators can also add and remove items from the bike shop, as well as view orders from users and mark the orders as paid, pending, or cancelled.    

![schema](https://i.imgur.com/B03c8aY.png)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.  Visit the deployed site at: https://enigmatic-spire-10343.herokuapp.com/ 

### Installing

Follow these steps to install the bike share application locally and run the development environment. Clone the repository to your local computer using the command below:

```
git clone https://github.com/amj133/bike-share.git
```

Run bundle to make sure you have all the required gems installed.

```
bundle
```

* To configure the database run the following commands.

```
rails db:create
rails db:migrate
rails db:seed
```


## Running the tests

In order to run the test suite, run the following command:
```
rspec
```

## Authors

* [Andy Dymond](https://github.com/andymond)
* [Andrew Jeffery](https://github.com/amj133)
* [Kyle Sallette](https://github.com/kylesallette)
