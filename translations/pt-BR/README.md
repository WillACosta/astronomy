Language: [English](https://github.com/WillACosta/astronomy) | [Português](https://github.com/WillACosta/astronomy/tree/main/translations/pt-BR)

<center>
  <img src="https://imgur.com/U1p21DT.png" width="100" height="100" />
</center>

## Astronomy Project

O projeto foi criado com Flutter e utiliza a API pública da NASA APOD (Astronomy Picture of the Day) para exibir todos os dias images ou vídeos do nosso incrível Universo.

## Design

O aplicativo possui uma proposta de design limpa e minimalista. Você também pode fazer uma cópia do design para sua conta no [Figma](https://www.figma.com/file/3vfTFRteEH1hAvT6D5igl0/Astronomy-App-Concept?node-id=157%3A14).

---

<img src='https://i.imgur.com/KIzTLgV.jpg' />

## Style Guide

O projeto possui um guia de estilo para manter a consistência de padrões estéticos na aplicação, você pode encontra-lo nas 'pages' do arquivo do figma.

## Features

- Visualização da imagem do dia, com uma descrição escrita por um astronônomo profissional

- Galeria para visualização das imagens anteriores, contando com mais de 7000 imagens desde 1995.

- Download e compartilhamento das imagens

- Darkmode

- Visualização e Download das imagens em HD

- Salvar os favoritos

## Recursos Técnicos

- Desenvolvido utilizando Arquitetura Limpa
- Gerenciamento de estados com MobX
- Testes de unidade
- Intercionalização com o pacote Intl
- Animações e Widgets customizados
- Salvamento de preferências locais com Hive
- Efeito de carregamento Shimmer
- Consumo da NASA's APOD API

### Pacotes utilizados

- GetIt - Service Locator
- Injectable - Dependency Injection
- HTTP
- Google Fonts
- Mocktail

## Como usar

```bash
## Clone este repositório
$ git clone https://github.com/WillACosta/astronomy

## Entre no diretório
$ cd astronomy

## Instale as dependências
$ flutter pub get

## Renomeie o arquivo '.env-example' para '.env' no diretório raiz com
$ mv .env-example .env

## Abra o arquivo e adicione suas credenciais (Obtenha sua chave no site da NASA https://api.nasa.gov/)

## Execute o projeto
$ flutter run
```

## Contribuição

Se você leu até aqui, que tal dar aquela força e contribuir com o projeto? Vamos estudar juntos e tornar o Flutter ainda mais conhecido! :)

---

Feito com ❤️ por Will
