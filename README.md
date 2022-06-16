# 👨‍👧‍👦NURTURE 
<i> The easiest way to help tutors engage with students and guide their progress. </i>

## Background
Nurture was an idea that sprung from my days as an English tutor, where I would often set homework for my students and ask them to deliver it in a format other than an essay, for e.g: in a live presentation format or recording themselves on video visually explaining the homework. I wanted to create a platform which helped to bring students together in a peer-to-peer learning effort (to gain inspiration from each other), while getting them to exercise their creativity skills in an approach similar to social media (e.g: Instagram). 

Our lead dev Shunjiro also had a real life tennis tutor friend that was having difficulty in maintaining records for his students, especially because all their feedback was written on paper forms. He really needed a way to properly maintain all feedback, visually see the data on his students lesson improvement over time, and communicate with his students one-on-one. 

Hence Nurture was created to bring those two ideas together on one platform, with a primary focus for helping tennis tutors teach their students more effectively by seeing their progress on a chart and allocating more homework in the areas they were struggling.

App home: https://nurture-lw.herokuapp.com/

<img src="https://res.cloudinary.com/snoared/image/upload/v1655352583/screenshot-nurture-lw.herokuapp.com-2022.06.16-11_57_36_udracf.png" width="850" height="420">
<img src="https://res.cloudinary.com/snoared/image/upload/v1655352583/screenshot-nurture-lw.herokuapp.com-2022.06.16-11_58_04_fa7nak.png" width="850" height="600">
<img src="https://res.cloudinary.com/snoared/image/upload/v1655352583/screenshot-nurture-lw.herokuapp.com-2022.06.16-11_58_49_ucho4w.png" width="850" height="420">

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Roles and Acknowledgements
* I took on project management duties and was responsible for developing the presentation, 
* Shunjiro as lead dev took on all the duties for Heroku pushes, repairing the auto-mailer, code quality, and fixing clashes as they came. 
* James was our lead back-end dev, as well as creating and maintaining the 1-on-1 chatbox, 
* while Shingo was responsible for all things front end. 

Everyone did a marvellous job and without their hard work and effort, this project would not have been possible. All our success is because of them.

## Team Members
- [Edmund Oh](https://www.linkedin.com/in/edmund-0h/)
- [Shunjiro Yatsuzuka](https://www.linkedin.com/in/syatsuzuka/)
- [James reed](https://github.com/Jimreed91)
- [Shingo Kubomura](https://www.linkedin.com/in/shingokubomura/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
