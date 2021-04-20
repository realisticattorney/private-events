![](https://img.shields.io/badge/Microverse-blueviolet)

# Association: Private Events!

This project was focused on the data relations between users, events/posts they can create and into which they can enroll as well. UI is not done at all.
Each user can see a list of his events, and these events are classified into two parts: upcoming and past events:

![screenshot](./app/assets/images/home.png)

## Built With

- Ruby (v. 2.7.2)
- Ruby on Rails (v. 6.1.1)

GEMS:

- Rubocop
- Bootstrap
- Devise
- Rolify
- Pundit
- Simple Form

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby and Rails on your local machine

### Setup

1- Open your terminal

2- Clone the repository typing $ git clone git@github.com:realisticattorney/members-only.git

3- Go to members-only repository by typing $ cd members-only
4- Enter $ bundle install to install bundler gem

5- Now run:

$ rails db:create
$ rails db:migrate

to run all the migrations needed on the database.

6- Finally, enter the following command to run the app on your server

$ rails server

### How to Run Tests

1- Make sure you have already run $ bundle install

2- Run this on the console: rspec spec/-FILENAME-.rb

## Author

👤 **German Aquila**

- GitHub: [@realisticattorney](https://github.com/realisticattorney)
- Twitter: [@ContoliAxl](https://www.twitter.com/contoliaxl)
- Linkedin: [@germanaquila](https://www.linkedin.com/in/german-aquila-55a9171b5/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE).
