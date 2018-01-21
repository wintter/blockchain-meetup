# Blockchain
### How to run

```sh
$ cd blockchain-meetup
$ rackup config.ru
```

# API

------------

###### HTTP request

```javascript
POST /v1/add_data
```

###### Request Body

```javascript
{
  "data": string
}
```
#### Response

**HTTP/1.1 200 OK**

```javascript
{
    "previous_block_hash": string,
    "rows": [
        string,
        string,
        string,
        string,
        string
    ],
    "block_hash": string,
    "timestamp": integer
}
```

------------

###### HTTP request

```javascript
POST /v1/last_blocks/:blocks_count
```

###### Request Body

```javascript
{
  "blocks_count": integer
}
```
#### Response

**HTTP/1.1 200 OK**

```javascript
[
  {
    "previous_block_hash": string,
    "rows": [
        string,
        string,
        string,
        string,
        string
    ],
    "block_hash": string,
    "timestamp": integer
  },
  {
      "previous_block_hash": string,
      "rows": [
          string,
          string,
          string,
          string,
          string
      ],
      "block_hash": string,
      "timestamp": integer
    }
]
```
