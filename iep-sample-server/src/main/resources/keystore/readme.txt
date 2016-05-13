# Para gerar um novo keystore:

1 - Digite: keytool -genkeypair -alias exemplo -keyalg RSA -keypass Minh@Senha! -storepass Minh@Senha! -keystore exemplo.jks

Substitua:
 - alias: para um nome de keystore desejado.
 - keypass e storepass: para uma senha forte.
 

2 - No arquivo config/application.properties

Substitua:
  - oauth.server.keystore.file=keystore/exemplo.jks
  - oauth.server.keystore.pair=exemplo
  - oauth.server.keystore.pass=Minh@Senha!