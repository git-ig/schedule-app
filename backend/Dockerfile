# Используем официальный образ Tomcat 9 с JDK 11, чтобы соответствовать окружению сборки
FROM tomcat:9-jdk11-temurin

# Удаляем стандартное веб-приложение ROOT, чтобы избежать конфликтов
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Копируем собранный .war файл из папки build в веб-приложения Tomcat
# Контекст сборки будет ./backend, поэтому путь до файла именно такой
COPY build/libs/ROOT.war /usr/local/tomcat/webapps/ROOT.war
