--FUNCOES DATA E HORA DO SISTEMA
SELECT Sysdatetime () exSysdatetime --horário atual sem fuso.
SELECT Sysdatetimeoffset () exSysdatetimeoffset--especifica a diferença do UTC
SELECT Sysutcdatetime () exSysutcdatetime
SELECT CURRENT_TIMESTAMP exCURRENT_TIMESTAMP
SELECT Getdate () exGetdate --horário atual sem fuso.
SELECT Getutcdate () exGetutcdate --já inclui o fusorário
