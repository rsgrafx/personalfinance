Application
// Elixir 1.x Erlang/OTP 17

Datastore
// Requires Postgres, Redis

$> iex -S mix
$> PurchasesSupervisor.start_link

In seperate terminal. start Redis
$> redis-server
In seperate terminal. start Redis-CLI
$> redis-cli
##### Example of what it expects from from the redis channel.
redis 127.0.0.1:6379> PUBLISH ocr_data '{"description" : "Target store receipt", "tags" : "clothing, household", "amount": 35.32}'

TODO: The goal of this application is to have an easy mechanism for the user to track her spending habits and match with income / debt in order to come up with some basic savings goals.

##### What do I want it to do?
  • I want to be able to track my spending.
  • I want to be able to upload all my receipts to one place and have it sent back to me in a spreadsheet - visual graph so I can review it.

##### How can this be done:
    • OCR / ( Seperate application )- upload individual photos of receipts and have the application process the images storing it in a database with a set schema.
    • I want it to calculate my monthly, weekly, bi-weekly spending habits.

#####  How can this be done:
    • Once a user had at least two weeks worth of data -  perform calculations that will tally up all purchase data
    • Present them to the user via a web dashboard so she can categorize them in pre-set groups.