# Plataforma Profissional Anônima 📱
Aplicativo Flutter que conecta profissionais e usuários de forma anônima, oferecendo funcionalidades como chat, feed, fórum, matchmaking, suporte, perfil, vagas de empregos e envio e recebimento de notificações push via Firebase Cloud Messaging (FCM).

## Funcionalidades
* Notificações push via Firebase Cloud Messaging
* Chat, feed, fórum, matchmaking, suporte, perfil e vagas de emprego
* Integração com a API do Google Maps para exibir localização de eventos e oportunidades próximas
* Integração com a API do Ticketmaster para buscar eventos culturais, profissionais e de networking conforme a localização do usuário
* Integração com a NewsAPI para exibir notícias atualizadas de tecnologia no feed
* Integração com a TheMuse API para buscar e exibir vagas de emprego remotas ou por localização
* Gerenciamento de estado com Provider
  
## Tecnologias utilizadas
* Flutter (Dart)
* Firebase Cloud Messaging
* Google Maps API – para geolocalização e visualização de eventos no mapa
* Ticketmaster API – para busca de eventos de tecnologia
* NewsAPI – para obtenção de notícias reais
* TheMuse API – para listagem de vagas de emprego
* Provider para gerenciamento de estado
* Configuração multiplataforma (Android e Web)

## Como executar o projeto
1. Clonar o repositório
   ```
   git clone https://github.com/proanonimos/plataforma_profissional_anonima.git
   cd plataforma_profissional_anonima
2. Limpar e instalar as dependências 
   ```
   flutter clean
   flutter pub get
3. Configurar o ambiente Firebase
  - Use o FlutterFire CLI para configurar o Firebase Cloud Messaging
  - Adicione o arquivo firebase_options.dart gerado na pasta lib/
  - Documentação oficial Firebase: https://firebase.google.com/docs/flutter/setup?platform=ios
4. Configurar um emulador
  - Baixe o Android Studio
  - Configure um AVD
  - Documentação oficial Android Studio: https://developer.android.com/develop
5. Executar o projeto e escolher dispositivo android
```
   flutter run
```
### Conta pra testes
usuario: teste
senha: 1234

## Grupo e RM
| Nome                      | RM     |
|---------------------------|--------|
| Heloísa Santos de Sousa   | 550256 |
| Samuel de Paula Santolim  | 99115  |
| Francisco Henrique Lima   | 99545  |
| Lucas Henrique Carrascosa | 99883  |
| Pedro Reginato            | 550896 |
