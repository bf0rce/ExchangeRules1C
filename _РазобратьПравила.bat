@rem ╨д╨░╨╣╨╗ ╨▓ ╨║╨╛╨┤╨╕╤А╨╛╨▓╨║╨╡ CP866
@echo off
oscript ИерархическийРазборXML.os

IF ERRORLEVEL 1 (
    call ColorText.bat 4e "При разборе правил обмена возникли ошибки (см. выше)"
	timeout /t -1
) ELSE (
	call ColorText.bat 0A "Разбор файла правил обмена успешно завершен"
	timeout /t 3
)
