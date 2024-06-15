rem ==== Killing any instances of chrome
taskkill /IM "chrome.exe">nul 2>&1

rem === Delete the cache
del /f /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache"

rem ==== Set local variables

set app_url="https://teams.microsoft.com/v2/"

set chrome_path="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

set chrome_flags= --kiosk --disable-pinch --disable-session-crashed-bubble --disable-infobars --overscroll-history-navigation=0 --disable-feature=OutdatedBuildDetector --check-for-update-interval=604800 --disable-web-security --user-data-dir

rem ==== Launch Chrome with app

%chrome_path% %app_url% %chrome_flags%
