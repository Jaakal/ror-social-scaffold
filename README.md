## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

https://jaak-and-yair-social.herokuapp.com/

## Getting Started

One has to clone the repository into her/his local computer.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

### Deployment

If one wants to deploy it to Heroku, then one needs on the console in root directory of the project run commands in order shown below (current branch needs to be master):

```
heroku apps:create <app-name>

git add .
git commit -m "Deploy to Heroku"
git push heroku master

heroku run rails db:migrate
heroku open

```


## Authors

👤 **Yair Fernando Facio**

<a href="https://yairfernando67.github.io/Portfolio/" target="_blank">
    
  ![Screenshot Image](app/assets/images/yair-profile.png) 

</a>

- Github: [@YairFernando67](https://github.com/YairFernando67)
- Twitter: [@YairFernando18](https://twitter.com/YairFernando18)
- Linkedin: [softwaredeveloperyairfacio](https://www.linkedin.com/in/softwaredeveloperyairfacio/)
- Email: [yair.facio11@gmail.com](https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=yair.facio11@gmail.com)
- Portfolio: [softwaredeveloper](https://yairfernando67.github.io/Portfolio/)

👤 **Jaak Kivinukk**

<a href="https://github.com/Jaakal" target="_blank">
    
  ![Screenshot Image](app/assets/images/jaak-profile.png) 

</a>

- Github: [@Jaakal](https://github.com/Jaakal)
- Twitter: [@JKivinukk](https://twitter.com/JKivinukk)
- Linkedin: [full-stack-developer](https://www.linkedin.com/in/jaak-kivinukk-7098b1153/)
- Email: [jaak.kivinukk@gmail.com](jaak.kivinukk@gmail.com)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Thanks to the Microverse for the whole experience!

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

