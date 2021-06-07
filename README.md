# ASKME

This is unofficial clone of ask.fm

Application was created due to educational proccess. It contains custom user authentication and authorization model,
questions may be asked either by registered user or by anonymous visitor. 

Also you can find `#hashtags` in this project: you can create hashtags by including it in your questions/answers,
the list of all tags located on the root page.

Create your personal account, send the link to your friends and get an interesting questions!

You can find this application deployed on [Heroku](https://askme-07290.herokuapp.com/)

![alt text](https://media.giphy.com/media/ZV5tLvBbr7knzOhglw/giphy.gif)

To run this project on your local machine you have to:
Clone this repo using 
  ```
  git clone git@github.com:knmrftw/askme.git
  ``` 
then make cd to new directory.

Make sure you have installed `ruby-3.0.1`, or just skip this step if you have it installed already on your machine.

Run 
```
bundle
``` 
to install all gems and it's dependencies.

Install `yarn` on your local machine or just skip this step if you have it.

Run
```
yarn
``` 
to pack all the frontend content.

Do not forget to make 
```
rails db:create
rails db:migrate
``` 
to create database and run all ActiveRecord migrations.

Run 
```
rails s
``` 
to start local server and 
```
bin/webpack-dev-server
``` 
to start webpacker server.

By default, your application will be available at `localhost:3000` link

Hope you will enjoy it!
