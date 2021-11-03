FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c release -o /app

WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "mvcSample.dll"]