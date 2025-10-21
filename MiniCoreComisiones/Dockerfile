# ===== build =====
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Este Dockerfile vive dentro de la carpeta del PROYECTO
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

# Si tu proyecto se llama distinto, cambia el nombre del DLL abajo
ENTRYPOINT ["dotnet", "MiniCoreComisiones.dll"]
