# ASKME

This is unofficial clone of ask.fm

Application was created due to educational proccess. It contains custom user authentication and authorization model,
questions may be asked either by registered user or by anonymous visitor. 

Also you can find `#hashtags` in this project: you can create hashtags by including it in your questions/answers,
the list of all tags located on the root page.

Create your personal account, send the link to your friends and get an interesting questions!

![alt text](https://media.giphy.com/media/ZV5tLvBbr7knzOhglw/giphy.gif)

To run this project on your local machine you have to:
1. Clone this repo use `git@github.com:knmrftw/askme.git`, make cd to new directory. 
2. Have installed `ruby-3.0.1`
3. Run `bundle` to install all gems and dependencies
4. Have `yarn` installed
5. Run `yarn` to pack all the frontend content
6. Also, make `rails db:migrate' to create database and migrate all dependencies
7. Run `rails s` to start local server and `bin/webpack-dev-server` to start webpacker server

Also you can find this application deployed on [Heroku](https://askme-07290.herokuapp.com/)

Hope you will enjoy it!
