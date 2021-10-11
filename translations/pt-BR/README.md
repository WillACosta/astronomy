[![Build Status](https://app.travis-ci.com/WillACosta/astronomy.svg?branch=main)](https://app.travis-ci.com/WillACosta/astronomy)

Línguagem: [English](https://github.com/WillACosta/astronomy) | [Português](https://github.com/WillACosta/astronomy/tree/main/translations/pt-BR)

<div align="center">
  <img src="https://imgur.com/U1p21DT.png" width="100" height="100" />
</div>

##

O Astronomy é um app mobile feito em flutter para exibir incríveis imagens e vídeos do nosso universo todos os dias utilizando a API pública da nasa, contendo recursos como download, uso de galeria, gerenciamento de estado, salvamento de favoritos, animações e muito mais.

<a href='https://play.google.com/store/apps/details?id=com.application.astronomy&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'>
  <img alt='Disponível no Google Play' src='https://play.google.com/intl/pt-BR/badges/static/images/badges/pt-br_badge_web_generic.png' height='80' />
</a>

## Conteúdo

- **[Design](#design)**
- **[Funcionalidades](#funcionalidades)**
- **[Recursos Técnicos](#recursos-técnicos)**
- **[Planejamento Técnico](#planejamento-técnico)**
- **[Como Usar](#como-usar)**
- **[Contribuição](#contribuição)**
- **[Demonstração do App](#demonstração-do-app)**

## Design

O app possui uma proposta de design limpa e minimalista e também um guia de estilo. Você também pode fazer uma cópia do design para sua conta no [Figma](https://www.figma.com/file/3vfTFRteEH1hAvT6D5igl0/Astronomy-App-Concept?node-id=157%3A14).

<img src='https://i.imgur.com/KIzTLgV.jpg' />

## Funcionalidades

- Visualização da imagem do dia, com uma descrição escrita por um astronônomo profissional
- Galeria para visualização das imagens anteriores, contando com mais de 7000 imagens desde 1995.
- Download e compartilhamento das imagens
- Darkmode
- Visualização e Download das imagens em HD
- Salvar os favoritos
- Apresentação das funcionalidades na primeira execução

## Recursos Técnicos

- Desenvolvido utilizando Arquitetura Limpa
- Gerenciamento de estados com MobX
- Testes de unidade
- Intercionalização
- Animações e Widgets customizados
- Salvamento de dados locais com Hive
- Efeito de carregamento Shimmer
- Consumo de APIs

## Planejamento Técnico

- [ ] Tema pré-definido de acordo com o sistema
- [ ] Esconder `bottomBar` para obter uma maior imersão da imagem do dia
- [ ] Esconder `appBar` e `bottomBar` na tela de grid
- [ ] Tema adicional baseado em Glassmorphism
- [ ] Opções de acessibilidade
- [ ] Notificações diárias sobre a imagem do dia
- [ ] Definir imagem como Wallpaper
- [ ] Design responsivo para outros dispositivos

## Como Usar

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

## Demonstração do App

<img src="../../github/sample.gif" />

---

Feito com 🖤 por Will
