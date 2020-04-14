# SDK 3DS iOS
Link para a documentação do SDK 3DS para iOS: https://developercielo.github.io/manual/integracao-sdk-ios

### Utilização

Para adicionar o sdk ao projeto basta seguir os seguintes passos:

1. Adicionar o sdk ao projeto, acessando as configurações do projeto na aba General, procurar a seção Frameworks, Libraries, and Embedded Content e clicar no botão +.
2. Selecione o arquivo Braspag3dsSdk.framework e clique em Add.
      - É importante ressaltar que, nas últimas versões do macOS, os arquivos com a extensão `.framework` estão sendo exibidos como pastas comuns. Ao selecionar a buscar pela biblioteca Braspag3dsSdk.framework é necessário selecionar a pasta em si e não o arquivo .framework que se encontra dentro da pasta.
      - Após adicionar o SDK é necessário verificar a coluna Embed. O valor dessa coluna precisa ser Embed Without Signing para que o SDK seja executado da forma correta no projeto.
3. Após adicionar o sdk ao projeto é necessário compilar o projeto através do menu Product -> Build ou pressionando cmd + B.
4. Assim que a build finalizar com sucesso, basta fazer o import do sdk nas classes desejadas.
