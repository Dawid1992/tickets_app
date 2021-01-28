Ruby version : 2.7.2

Rails : 6.1.1

DB : sqlite3 v 1.4

Server : puma v 5.0

Tests : Rspec v 3.1

the project involves buying tickets to selected events

the first registered user automatically becomes an administrator

administrator can add new events, edit and delete them

normal user can view event details, purchase tickets or set reminders

in order to purchase tickets you need to provide the correct card number

For the purpose of this project I added the following card numbers that trigger a certain event:

1212 1212 1212 1212 - the ticket was purchased correctly

2323 2323 2323 2323 - Your card has been declined.

3434 3434 3434 3434 - Something went wrong with your transaction.

any other string or number - Wrong card number

after the purchase we can see the list of available tickets

Tests are executed after the command  $ rspec -f d spec/

I used simple styling from bootstrap to make the views less intimidating

The application is still being developed, in the future I would like to add sending emails after ticket purchase and adding a photo gallery in events