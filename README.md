Language: [English](https://github.com/WillACosta/astronomy) | [Português](https://github.com/WillACosta/astronomy/tree/main/docs/translations/pt-BR)

<div align="center" border-radius="100px">
  <img src="https://imgur.com/U1p21DT.png" width="100" height="100" />
</div>

##

Astronomy is a mobile app made in Flutter to display awesome pictures and videos of the universe every day using NASA's public APOD API, containing features such as downloading, gallery usage, state management, saving favorites, animations and more.

<a href='https://play.google.com/store/apps/details?id=com.application.astronomy'>
  <img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' height="70" />
</a>

## Content

- **[Design](#design)**
- **[Features](#features)**
- **[Technical Resources](#technical-resources)**
- **[How to Use](#how-to-use)**
- **[Contributing](#contributing)**
- **[App Flow Sample](#app-flow-sample)**

## Design

The app has a clean and minimalist proposal and also a style guide. You can copy this to your [Figma account](https://www.figma.com/file/3vfTFRteEH1hAvT6D5igl0/Astronomy-App-Concept?node-id=157%3A14).

<img src='https://i.imgur.com/KIzTLgV.jpg' />

## Features

- View the image of the day with an explanation written by a professional astronomer
- View a gallery of previous APOD images and jump quickly to any date
- Share and download any image in HD
- Dark mode
- Save your favorites
- Showcase features on first launch

## Technical Resources

- Developed with Clean Architecture
- State management with MobX
- Unit testing
- Internationalization
- Animations and custom widgets
- Local storage with Hive
- Shimmer loading effect
- API Request using NASA'S APOD

## How to Use

```bash
## clone this repo
$ git clone https://github.com/WillACosta/astronomy

## go to the directory
$ cd astronomy

## install the dependencies
$ flutter pub get

## rename the '.env-example' file to '.env' in the root directory with
$ mv .env-example .env

## open the file and add your API KEY (Get on https://api.nasa.gov/)

## run the app
$ flutter run
```

## Contributing

If you've read this far, how about helping out and contributing to the project? Let's study together and make Flutter even better known! :)

## App Flow Sample

<img src="docs/sample.gif" />

---

Made with 🖤 by Will
