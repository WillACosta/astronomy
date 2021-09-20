Language: [English](https://github.com/WillACosta/astronomy) | [Português](https://github.com/WillACosta/astronomy/tree/main/translations/pt-BR)

<div align="center" border-radius="100px">
  <img src="https://imgur.com/U1p21DT.png" width="100" height="100"/>
</div>

##

Astronomy is a mobile app made in Flutter to display awesome pictures and videos of the universe every day using NASA's public APOD API, containing features such as downloading, gallery usage, state management, saving favorites and much more.

## Design

The app has a clean and minimalist proposal and also a style guide. You can copy this to your [Figma account](https://www.figma.com/file/3vfTFRteEH1hAvT6D5igl0/Astronomy-App-Concept?node-id=157%3A14).

<img src='https://i.imgur.com/KIzTLgV.jpg' />

## Features

- View the image of the day with an explanation written by a professional astronomer

- View a gallery of previous APOD images and jump quickly to any date

- Share and download any image in HD

- Dark mode

- Save your favorites

## Technical Resources

- Developed with Clean Architecture
- State management with MobX
- Unit testing
- Internationalization
- Animations and custom widgets
- Local storage with Hive
- Shimmer loading effect
- NASA'S APOD API requests

## How to use

```bash
## Clone this repo
$ git clone https://github.com/WillACosta/astronomy

## Go to the directory
$ cd astronomy

## Install the dependencies
$ flutter pub get

## Rename the '.env-example' file to '.env' in the root directory with
$ mv .env-example .env

## Open the file and add your API KEY (Get on https://api.nasa.gov/)

## Run the app
$ flutter run
```

## Contribution

If you've read this far, how about helping out and contributing to the project? Let's study together and make Flutter even better known! :)

---

Made with ❤️ by Will
