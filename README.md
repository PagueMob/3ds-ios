# SDK 3DS iOS
Link para a documentação do SDK 3DS para iOS: https://developercielo.github.io/manual/integracao-sdk-ios

### Utilização

Para adicionar o sdk ao projeto basta seguir os seguintes passos:

1. Adicionar o sdk ao projeto, acessando as configurações do projeto na aba General, procurar a seção Frameworks, Libraries, and Embedded Content e clicar no botão +.
2. Selecione o arquivo Braspag3dsSdk.framework e clique em Add.
      - Após adicionar o SDK é necessário verificar a coluna Embed. O valor dessa coluna precisa ser Embed Without Signing para que o SDK seja executado da forma correta no projeto.
3. Após adicionar o sdk ao projeto é necessário compilar o projeto através do menu Product -> Build ou pressionando cmd + B.
4. Assim que a build finalizar com sucesso, basta fazer o import do sdk nas classes desejadas.
