# Usar una imagen base de Maven para construir la aplicación
FROM maven:3.9.4-eclipse-temurin-21 AS build

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo pom.xml y descargar las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiar el resto del código fuente del proyecto
COPY src ./src

# Compilar y empaquetar la aplicación
RUN mvn clean package -DskipTests

# Usar una imagen base más ligera para ejecutar la aplicación
FROM eclipse-temurin:21-jdk-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el JAR construido desde la etapa de construcción anterior
COPY --from=build /app/target/gs-0.0.1-SNAPSHOT.jar .

# Exponer el puerto que utiliza la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "gs-0.0.1-SNAPSHOT.jar"]