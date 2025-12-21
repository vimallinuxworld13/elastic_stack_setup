GET /_cat/indices

GET /app-web-prod-other/_search
{
    "query": {
        "match": {
          "http.response.status_code": 200
        }
    }
}

GET /app-web-prod-other/_search
{
    "query": {
        "match_all": {}
    }
}



GET /app-web-prod-other/_search
{
    "query": {
        "match": {
          "message": "can you get this"
        }
    }
}

GET /app-web-prod-other/_search
{
    "query": {
        "term": {
          "http.response.status_code": 200
        }
    }
}


GET /app-web-prod-other/_search
{
    "query": {
        "range": {
          "http.response.body.bytes": {
            "gte": 100,
            "lte": 200
          }
        }
    }
}


GET /app-web-prod-other/_search
{

    "query": {
        "range": {
          "@timestamp": {
            "gte": "now-15m"
          }
        }
    }
}


GET /app-web-prod-other/_search
{
    "from": 15,
    "size": 10,
    "query": {
        "bool": {
            "filter": [
              {"range": {"@timestamp": {"gte": "now-500m"}}},
              {"term": {"http.response.status_code": 200}}
            ]
        }
    }
}


GET /app-web-prod-other/_search
{
    "size":1,

    "query": {
        "term": {
          "http.response.status_code": {
            "value": "404"
          }
        }
    },
    
    "sort": [
      {
        "@timestamp": {
          "order": "desc"
        }
      }
    ]
}

