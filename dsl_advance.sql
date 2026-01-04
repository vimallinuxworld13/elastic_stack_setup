GET /logs-system.auth-*/_search
{
    "query": {
        "match_all": {}
    }
}

GET /logs-system.auth-*/_search
{
    "query": {
        "term": {
          "event.outcome": "failure"
        }
    }
}

GET /logs-*/_search
{
    "query": {
        "bool": {
            "filter": [
              { "term": {"event.outcome": "failure"}},
              { "term": {"event.action": "ssh_login"}},
              {"range": {"@timestamp": {"gte": "now-15m"} }}
            ]
        }
    }
}



GET /logs-*/_search
{
    "query": {
        "bool": {
            "filter": [
              {"term": { "process.name": "sudo"}},
              { "exists": { "field": "system.auth.sudo.error"}}
            ]
        }
    }
}


GET /logs-*/_search
{
    "size": 0,
    "query": {
        "bool": {
            "filter": [
              { "term": {"event.outcome": "failure"}},
              { "term": {"event.action": "ssh_login"}},
              {"range": {"@timestamp": {"gte": "now-5m"} }}
            ]
        }
    },

    "aggs": {
      "myusers": {
        "terms": {
            "field": "user.name",
            "min_doc_count": 10
        }
      }
    }
}



GET /logs-*/_search
{
    "query": {
        "bool": {
            "filter": [
              {"terms": {"event.outcome": ["failure", "success"] }},
              {"range": {"@timestamp": {"gte": "now-60m"} }}
            ]
        }
    },

    "sort": [
      {
        "@timestamp": {
          "order": "asc"
        }
      }
    ]
}



GET /logs-*/_search
{

    "query": {
        "bool": {
            "filter": [
              
              {"wildcard": {"system.auth.sudo.command": "*shadow*"}},
              {"range": {"@timestamp": {"gte": "now-5m"} }}
            ]
        }
    }

    
}
