# ByteBank - Um projeto em Flutter

Este projeto é continuação da semana 31 - flutter web api 2.



## Tópicos importantes
* [Tipos de teste no Flutter](./notas-de-aula/aula%201.05%20-%20Foco%20em%20testes%20de%20widget.md)


## Tecnologias utilizadas

* Flutter
* sqflite - SQLite plugin for Flutter. Supports iOS, Android and MacOS.
* [http package](https://pub.dev/packages/http) - This package contains a set of high-level functions and classes that make it easy to consume HTTP resources. It's multi-platform, and supports mobile, desktop, and the browser.
*[http_interceptor](https://pub.dev/packages/http_interceptor) - This is a plugin that lets you intercept the different requests and responses from Dart's http package. You can use to add headers, modify query params, or print a log of the response.
* [uuid](https://pub.dev/packages/uuid) - Simple, fast generation of RFC4122 UUIDs.
* [mockito](https://docs.flutter.dev/cookbook/testing/unit/mocking)

## Setup

Para o app funcionar é preciso que o servidor do web api (vide pasta [servidor-webapi](./servidor-webapi/)) seja executado.

Para rodar o servidor, entre no Power Shell do windows e digite:

```
java -jar server.jar
```

## Como acessar o servidor

A rota do servidor é: http://localhost:8080/transactions

Porém, o celular não consegue acessar localhost:8080/transactions (esse endereço só dá para acessar no próprio computador).

É preciso descobrir a url que o celular consegue acessar digitando o comando "ipconfig" no power shell do windows.

Para informar o app acerca da url, modifique a variável `baseUrl` no arquivo [webclient.dart](./byte_bank/lib/http/webclient.dart).

Exemplo de url: http://192.168.15.8:8080/transactions

## Acessando o servidor por meio do NGROK

É possível compartilhar o localhost através da internet por meio do [ngrok](https://ngrok.com/).

To start a HTTP tunnel forwarding to your local port 80, run this next:
```
ngrok http 80
```

**OBS: cada vez que o ngrok é reiniciado, será necessário mudar a variável `baseUrl` no arquivo [webclient.dart](./byte_bank/lib/http/webclient.dart).**


# Senha para transações

O aplicativo pede uma senha para fazer transações.

A senha é: `1000`, conforme [README](./servidor-webapi/README.md) do servidor.
