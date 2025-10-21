# ===== build =====
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia TODO el proyecto (este Dockerfile está dentro de la carpeta del proyecto)
COPY . ./

# Restore + Publish
RUN dotnet restore
RUN dotnet publish -c Release -o /app/out

# ===== runtime =====
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out ./

# ASP.NET escucha en 8080 dentro del contenedor
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# Cambia el nombre del DLL si tu proyecto se llama distinto
ENTRYPOINT ["dotnet", "MiniCoreComisiones.dll"]
