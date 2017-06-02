curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
    "bool": {
      "must": [
        { "match": { "log": "mongo" } }
      ]
    }
  }
}'

curl 'localhost:9200/logstash-*/_search?q=*&pretty'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.17/_search?pretty' -d '
{
  "query": { "match": { "type": "elasticsearch" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.21/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'


curl -XPOST 'localhost:9200/logstash-2016.08.17/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "message": "nininini" } }
}'


curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match_all": {} }
}'


curl 'localhost:9200/_cat/indices?v'
curl 'elasticsearch-logging.kube-system:9200/_mapping?pretty'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.data" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.*.log" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.*.log" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "message": "caonima" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "prefix": { "tag": "file" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "prefix": { "tag": "file" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file.synthetic-dates.log" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "log": "niurou" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "tag": "file." } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.19/_search?pretty' -d '
{
  "query": { "match": { "message": "world" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "message": "ubuntu" } }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "prefix": { "container_name": "mongo" } }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "log": "redis" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "p2" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "namespace_name": "p2" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "from": 0,
  "size": 200,
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "namespace_name": "p2"
              }
            },
            {
              "wildcard": {
                "pod_name": "logs-4051901663-vtjo1"
              }
            },
            {
              "wildcard": {
                "container_name": "conmongo"
              }
            },
            {
              "query_string": {
                "query": "coolest",
                "analyze_wildcard": true
              }
            }
          ]
        }
      },
      "filter": {
            "range": {
              "@timestamp": {
                "gte": "2016-08-20",
                "lte": "2016-08-20"
              }
            }
          }
        }
      },
      "sort": {
        "@timestamp": {
          "order": "desc"
        }
      },
      "highlight": {
        "pre_tags": [
          "<logHighlight>"
        ],
        "post_tags": [
          "</logHighlight>"
        ],
        "fields": {
          "log": {}
        }
      }
    }
  }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "size": 0,
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "kubernetes.namespace_name": "default"
              }
            },
            {
              "wildcard": {
                "kubernetes.pod_name": "cluster-admin-8m13t"
              }
            }
          ]
        }
      }
    }
  },
  "aggs": {
    "group_by_containername": {
      "terms": {
        "field": "kubernetes.container_name"
      }
    }
  },
  "sort": {
    "container_name": {
      "order": "asc"
    }
  }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "size": 0,
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "namespace_name": "default"
              }
            },
            {
              "wildcard": {
                "pod_name": "auth-mongo-fp9dk"
              }
            }
          ]
        }
      }
    }
  },
  "aggs": {
    "group_by_containername": {
      "terms": {
        "field": "container_name"
      }
    }
  },
  "sort": {
    "container_name": {
      "order": "asc"
    }
  }
}'


curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"message": "baidu" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"message": "woyou" } }
}'

curl -XPOST 'localhost:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"message": "loveyou" } }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "log2"} }
}'



curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": { "kubernetes.namespace_name": "kube-system"} }
}'

curl -XPOST 'elasticsearch-logging.kube-system:9200/logstash-2016.08.20/_search?pretty' -d '
{
  "query": { "match": {"kubernetes.namespace_name": "kube-system"} }
}'

 curl -XDELETE 'http://elasticsearch-logging.kube-system:9200/logstash-2016.08.20/' 


curl -XPOST 'localhost:9200/*/_search?pretty' -d '
{
  "query": {
    "filtered": {
      "query": {
        "bool": {
          "should": [],
          "must_not": [],
          "must": [
            {
              "wildcard": {
                "kubernetes.namespace_name": "clever"
              }
            },
            {
              "wildcard": {
                "kubernetes.pod_name": "console-web-mongo-3980009502-xcwcl"
              }
            }
          ]
        }
      }
    }
  }
}'


curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": { "term": {"kubernetes.namespace_name": "kube-system"} }
}'

curl -XPOST 'localhost:9200/website/_search?pretty' -d '
{
  "query": { "term": {"title": "My third blog entry"} }
}'

curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
    "bool": {
      "must_not": {
        "term": {
          "kubernetes.container_name": "POD"
        }
      },
      "must": [
        {
          "match": {
            "kubernetes.namespace_name": "clever"
          }
        },
        {
          "match": {
            "kubernetes.pod_name": "console-web-mongo-3980009502-xcwcl"
          }
        }
      ]
    }
  }
}
'

curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": { "match": {"kubernetes.pod_name": "console-web-mongo-3980009502-xcwcl"} },
  "aggs": {
    "group_by_containername": {
      "terms": {
        "field": "kubernetes.container_name"
      }
    }
  }
}'


curl -XPUT 'localhost:9200/_template/my_index' -d '
{
  "template": "my_index",
  "mappings": {
    "my_type": {
      "dynamic_templates": [
        {
          "integers": {
            "match_mapping_type": "long",
            "mapping": {
              "type": "integer"
            }
          }
        },
        {
          "strings": {
            "match_mapping_type": "string",
            "mapping": {
              "type": "text",
              "fields": {
                "raw": {
                  "type":  "keyword",
                  "ignore_above": 256
                }
              }
            }
          }
        }
      ]
    }
  }
}'
curl -XPUT 'localhost:9200/my_index/my_type/1' -d '
{
  "my_integer": 5, 
  "my_string": "Some string" 
}'
curl -XPUT 'localhost:9200/long_index/my_type/1' -d '
{
  "my_integer": 5, 
  "my_string": "Some string" 
}'

curl -XPUT 'localhost:9200/_template/logging' -d '
{
  "template":   "logs-*", 
  "settings": { "number_of_shards": 1 }, 
  "mappings": {
    "_default_": {
      "_all": { 
        "enabled": false
      },
      "dynamic_templates": [
        {
          "strings": { 
            "match_mapping_type": "string",
            "mapping": {
              "type": "string",
              "fields": {
                "raw": {
                  "type":  "string",
                  "index": "not_analyzed",
                  "ignore_above": 256
                }
              }
            }
          }
        }
      ]
    }
  }
}'

curl -XPUT 'localhost:9200/logs-2015.10.01/event/3' -d @/home/pao/coding/mylinuxrc/payload.json


curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
    "bool": {
      "should": [],
      "must_not": [],
      "must": [
        {
          "match": {
            "kubernetes.namespace_name": "caas"
          }
        },
        {
          "match": {
            "kubernetes.pod_name": "kubernetes-admin-2770990362-cp9bv"
          }
        },
        {
          "query_string": {
            "query": "admin",
            "analyze_wildcard": true
          }
        },
        {
          "range": {
            "timestamp": {
              "gte": "2017-05-18T18:00:00",
              "lte": "2017-05-18T18:32:34"
            }
          }
        }
      ]
    }
  },
          "sort": {
            "@timestamp": {
              "order": "desc"
            }
          },
          "highlight": {
            "pre_tags": [
              "<logHighlight>"
            ],
            "post_tags": [
              "</logHighlight>"
            ],
            "fields": {
              "log": {}
            }
          }
}'


curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
    "bool": {
      "should": [],
      "must_not": [],
      "must": [
        {
          "match": {
            "kubernetes.namespace_name": "caas"
          }
        },
                  {
            "query_string": {
              "query": "cluster*",
              "fields": [
                "log"
              ]
            }
          },
        {
          "match": {
            "kubernetes.pod_name": "redis-logger-1655605986-l8qg3"
          }
        }
      ]
    }
  },
  "sort": {
    "@timestamp": {
      "order": "desc"
    }
  },
  "highlight": {
    "pre_tags": [
      "<logHighlight>"
    ],
    "post_tags": [
      "</logHighlight>"
    ],
    "fields": {
      "log": {}
    }
  }
}'

curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
      "bool": {
        "should": [],
        "must_not": [],
        "must": [
          {
            "match": {
              "kubernetes.namespace_name": "caas"
            }
          },
          {
            "match": {
              "kubernetes.pod_name": "kubernetes-admin-2770990362-cp9bv"
            }
          },
          {
            "query_string": {
              "query": "adm*",
              "fields": [
                "log"
              ]
            }
          },
          {
            "range": {
              "@timestamp": {
                "gte": "2017-05-15",
                "lte": "2017-05-25"
              }
            }
          }
        ]
      }
    },
    "sort": {
      "@timestamp": {
        "order": "desc"
      }
    },
    "highlight": {
      "pre_tags": [
        "<logHighlight>"
      ],
      "post_tags": [
        "</logHighlight>"
      ],
      "fields": {
        "log": {}
      }
    }
}'