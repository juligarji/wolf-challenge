# README

**Wolf interview challenge.**

This is a API only ruby `3.0.6` rails `7.1.3.2` API only application.

Uses a SQLite DB with the next models:

- **Locations**: lat,long format of cities in the US.
- **Roles**: Jobs availables.
- **Availabilities**: Stores the non_available dates for the job seekers.
- **Seekers**: Job seekers.
- **Ratings**: many to many relationship between seekers and roles to store the specific rate from 1 to 100 of each of the Job seekers per role.


## How to Run?

- Make sure you have the mentionend verions of ruby and rails installed.
- Create a file `master.key` inside the `config` folder with a random 32 alphanumeric characters.
- run `bundle install`
- run `rake db:create db:migrate`
- run `rake db:seed` (This will fill the DB with Dummy data see `seeds.rb` file).
- run `rails s` to start the app.

You will have this HTTP endpoint available:
```
GET http://localhost:3000/find
```
with the next query params required:
- lat: float latitude value (37.7749)
- lon: float longitude value (-122.4194)
- role_id: int Id of the role in the DB (2)
- dates: array[string] to indicate the dates required (['2024-04-01'])

> **NOTE** I used San Francisco as the center to generate the remaining locations so we have cases in or out the 30 miles radius. [37.7749, -122.4194]

A complete test case query will be like this:
```
http://localhost:3000/find?lat=37.7749&lon=-122.4194&role_id=2&dates=['2024-04-01']
```

I left some comments to clarify my reasoning, hope you like it 😊
