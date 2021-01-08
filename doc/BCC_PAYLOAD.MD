# MQTT Payload Data

## Samples as they can come from a machine

* With one data value:

```JSON
{
    "$$schema": "data-formal.json",
    "timestamp": "2020-12-10T12:50:56.026Z",
    "columns": [{
            "name": "prodMinutes",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "prodPieces",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "toolChanges",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "travelDistance",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "directionChange",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "materialType",
            "description": "TBD",
            "type": "string"
        }
    ],
    "data": [
        ["0"],
        ["0"],
        ["0"],
        ["0"],
        ["0"],
        ["alumnium"]
    ],
    "signature": "TBD"
}
```

* With more than one data value (TBD):

```JSON
{
    "$$schema": "data-formal.json",
    "timestamp": "2020-12-10T12:50:56.026Z",
    "columns": [{
            "name": "prodMinutes",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "prodPieces",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "toolChanges",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "travelDistance",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "directionChange",
            "description": "TBD",
            "type": "integer"
        },
        {
            "name": "materialType",
            "description": "TBD",
            "type": "string"
        }
    ],
    "data": [
        ["0","0"],
        ["0","0"],
        ["0","0"],
        ["0","0"],
        ["0","0"],
        ["alumnium","alumnium"]
    ],
    "signature": "TBD"
}
```