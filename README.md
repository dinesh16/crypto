# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Prerequisites
- Using `Ruby 3.0 and Rails 6.0`
- Clone the git repository
- bundle install
- Install [Ruby](https://www.ruby-lang.org/en/downloads/) 3.0.0
- Update credentials: `rails credentials:edit --environment development`
- Run rails serer: rails s
- Go to graphql endpoint: [`localhost:3000`](http://localhost:3000/graphiql)
- View the Graphql Schema

### Running the tests: 
- Update credentials: `rails credentials:edit --environment test`
- run `bundle exec rspec`

### Graphql Queries

##### 1) Retrieve a list of cryptocurrencies given set of tickers

##### Query
```graphql
query cryptocurrenciesByTickers{
  cryptocurrenciesByIds(ids: ["BTC", "XRP"])
}

```
##### Results
```graphql
{
  "cryptocurrenciesByIds": [
    {
      "id": "BTC",
      "currency": "BTC",
      "symbol": "BTC",
      "name": "Bitcoin",
      "status": "active",
      "price": "55112.72367904",
      "price_date": "2021-10-10T00:00:00Z",
      "price_timestamp": "2021-10-10T00:56:00Z",
      "circulating_supply": "18839293",
      "max_supply": "21000000",
      .......
    }
  ]
}
```

##### 2) Retrieve a (list) specific crypto currency and specific values based on the ticker and any other dynamic params

##### Query
```graphql
query cryptocurrenciesByDynamicParams{
  cryptocurrenciesByDynamicParams(ids: ["KEEP", "BTC"], intervals: [THIRTY_DAYS]){
    id
    status
    circulatingSupply
    maxSupply
    name
    symbol
    price
  }
}

```
##### Results
```graphql
{
  "data": {
    "cryptocurrenciesByDynamicParams": [
      {
        "id": "BTC",
        "status": "active",
        "circulatingSupply": "18839293",
        "maxSupply": "21000000",
        "name": "Bitcoin",
        "symbol": "BTC",
        "price": "55098.59538814"
      },
      {
        "id": "KEEP",
        "status": "active",
        "circulatingSupply": "549716300",
        "maxSupply": "1000000000",
        "name": "Keep Network",
        "symbol": "KEEP",
        "price": "0.42422014"
      }
    ]
  }
}
```

##### 3) Retrieve a specific cryptocurrency to specific fiat. Ie: BTC in ZAR or ETH in USD

##### Query
```graphql
query currenciesByDynamicParamsFiat{
  cryptocurrenciesByDynamicParams(ids: ["BTC"], convert: "GBP"){
    id
    status
    circulatingSupply
    maxSupply
    name
    symbol
    price
  }
}

```
##### Results
```graphql
{
  "data": {
    "cryptocurrenciesByDynamicParams": [
      {
        "id": "BTC",
        "status": "active",
        "circulatingSupply": "18839293",
        "maxSupply": "21000000",
        "name": "Bitcoin",
        "symbol": "BTC",
        "price": "40425.26418477"
      }
    ]
  }
}
```

##### 4) Calculate the price of one cryptocurrency from another, in relation to their dollar value

##### Query
```graphql
query cryptocurrencyDifferenceByValue{
  cryptocurrencyDifferenceByValue(fromCrypto: "XRP", toCrypto: "DOGE"){
    fromCrypto
    toCrypto
    message
    value
  }
}

```
##### Results
```graphql
{
  "data": {
    "cryptocurrencyDifferenceByValue": {
      "fromCrypto": "XRP",
      "toCrypto": "DOGE",
      "message": "1 DOGE == 0.2141914495854032 XRP",
      "value": 0.2141914495854032
    }
  }
}
```
