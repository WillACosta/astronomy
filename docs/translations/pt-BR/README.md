Linguagem: [English](https://github.com/WillACosta/astronomy) | [Português](https://github.com/WillACosta/astronomy/tree/main/docs/translations/pt-BR)

<div align="center">
  <img src="https://imgur.com/U1p21DT.png" width="100" height="100" />
</div>

##

Astronomy é um app mobile desenvolvido em Dart/Flutter para exibir incríveis imagens e vídeos do nosso universo todos os dias utilizando a API pública da nasa, contendo recursos como download, acesso à galeria, gerenciamento de estado, salvamento de favoritos, animações e muito mais.

<a href='https://play.google.com/store/apps/details?id=com.application.astronomy'>
  <img alt='Disponível no Google Play' src='https://play.google.com/intl/pt_br/badges/static/images/badges/pt_badge_web_generic.png' height="70" />
</a>

## Conteúdo

- **[Design](#design)**
- **[Funcionalidades](#funcionalidades)**
- **[Recursos Técnicos](#recursos-técnicos)**
- **[Como Usar](#como-usar)**
- **[Contribuição](#contribuição)**
- **[Demonstração do App](#demonstração-do-app)**

## Design

O app possui uma proposta de design limpa e minimalista e também um guia de estilo. Você também pode fazer uma cópia do design para sua conta no [Figma](https://www.figma.com/file/3vfTFRteEH1hAvT6D5igl0/Astronomy-App-Concept?node-id=157%3A14).

<img src='https://i.imgur.com/KIzTLgV.jpg' />

## Funcionalidades

- Visualização da imagem do dia, com uma descrição escrita por um astronônomo profissional
- Galeria para visualização das imagens anteriores, contando com mais de 7000 imagens desde 1995
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
- Consumo de APIs REST utilizando a NASA APOD

## Como Usar

```bash
## clone este repositório
$ git clone https://github.com/WillACosta/astronomy

## entre no diretório
$ cd astronomy

## instale as dependências
$ flutter pub get

## renomeie o arquivo '.env-example' para '.env' no diretório raiz com
$ mv .env-example .env

## abra o arquivo e adicione suas chave de API (Obtenha aqui https://api.nasa.gov/)

## execute o projeto
$ flutter run
```

## Contribuição

Se você leu até aqui, que tal dar aquela força e contribuir com o projeto? Vamos estudar juntos e tornar o Flutter ainda mais conhecido! :)

## Demonstração do App

<img src="../../docs/sample.gif" />

---

Feito com 🖤 por Will
