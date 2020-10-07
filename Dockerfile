FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

COPY *.sln .
COPY src/Sample/*.csproj ./Sample/
RUN dotnet restore

# copy everything else and build app
COPY src/Sample/. ./Sample/
WORKDIR /app/Sample
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/Sample/out ./
ENTRYPOINT ["dotnet", "Sample.dll"]