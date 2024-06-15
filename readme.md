# app-launcher

## Script Bat para executar sites como o App no ​​Microsoft Windows

esse script encerra todas as instâncias existentes do Chrome, limpa o cache, define variáveis locais para a URL e configurações do Chrome, e então lança o Chrome com as configurações especificadas, abrindo a URL fornecida. Este tipo de script é comum em ambientes onde é necessário iniciar o navegador de forma automatizada e configurada para um uso específico, como em quiosques públicos ou aplicações corporativas.

## Matando processos do navegador 

### Essa função é opcional [ Pode ser renovado ]

Este comando encerra qualquer instância do processo chrome.exe que esteja em execução. O >nul 2>&1 é usado para redirecionar mensagens de erro e saída para o nulo, evitando que sejam exibidas ao usuário.

```
rem ==== Killing any instances of chrome
taskkill /IM "chrome.exe">nul 2>&1
```

## Excluir o cache no navegador

### Essa função é opcional [ Pode ser renovado ]

Este comando exclui de forma forçada (/f) e silenciosa (/q) o conteúdo do diretório de cache do Chrome

```
rem === Delete the cache
del /f /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache"
```

## Escolha qual site você deseja usar como app

### set app_url: 
Define a URL que será aberta no Chrome. Neste caso, é definida como https://teams.microsoft.com/v2/, possivelmente para abrir o Microsoft Teams.

```
rem ==== Set local variables
set app_url="https://teams.microsoft.com/v2/"
```

## Escolha qual o navegador que deve ser executado

__Exemplo: Google Chrome__

### set chrome_path: 
Define o caminho completo para o executável do Chrome no sistema.

```
set chrome_path="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
```

## configuração 

### set chrome_flags: 
Define uma série de flags de inicialização para o Chrome. Essas flags foram explicadas anteriormente e configuram o Chrome para operar no modo quiosque (--kiosk), desativam recursos específicos de segurança e comportamento do navegador.

```
set chrome_flags= --kiosk --disable-pinch --disable-session-crashed-bubble --disable-infobars --overscroll-history-navigation=0 --disable-feature=OutdatedBuildDetector --check-for-update-interval=604800 --disable-web-security --user-data-dir
```

| Command | Description |
| --- | --- |
| --kiosk  | nicia o Chrome no modo quiosque, usado para exibir conteúdo em tela cheia sem a interface normal do navegador, adequado para aplicações públicas ou específicas.  |
| --disable-pinch  | Desativa a capacidade de "pinch to zoom" (zoom por gestos) em dispositivos touch.  |
| --disable-session-crashed-bubble  | Impede que o Chrome mostre uma bolha de aviso quando uma sessão do navegador falha.  |
| --disable-infobars  | Desativa as barras de informações que o Chrome mostra em certas situações, como quando o navegador é controlado automaticamente por um teste automatizado.  |
| --overscroll-history-navigation=0  | Desativa a navegação na história (avançar e voltar) ao usar o gesto de deslizar (scroll) além dos limites da página.  |
| --disable-feature=OutdatedBuildDetector  | Desativa o detector de versões desatualizadas do Chrome.  |
| --check-for-update-interval=604800  | Define o intervalo em segundos para verificar atualizações automáticas do Chrome. Nesse caso, 604800 segundos correspondem a uma semana.  |
| --disable-web-security  | Desativa a política de segurança de mesma origem do Chrome, permitindo que páginas web carreguem conteúdo de diferentes origens.  |
| --user-data-dir  | Especifica o diretório onde os dados do usuário do Chrome serão armazenados. Isso pode ser usado para separar dados de perfil do navegador.  |

## Execução do Script

Finalmente, este comando inicia o Google Chrome com as configurações e URL especificadas. Ele utiliza o caminho do executável do Chrome (%chrome_path%), abre o URL definido (%app_url%) e aplica as flags de inicialização (%chrome_flags%).

```
rem ==== Launch Chrome with app
%chrome_path% %app_url% %chrome_flags%
```
