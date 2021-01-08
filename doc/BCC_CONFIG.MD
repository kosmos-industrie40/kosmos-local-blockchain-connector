# Vorlage für die LKK-BCC Konfiguration

This is the draft for the BCC_CONFIG env Variable/JSON-File.

In this variable we define:
* Which MQTT-Topics to prozess in the BCC
* Map MQTT-Topic to BC-HTTP(S)-API endpoint
* Map incoming MQTT-Payload's data to outgoing BC-HTTP(S)-API data
* Mappings will be evaluated using eval() in JS. (See Security)

## Todo

* Handling MQTT-Payload data[n][m] (Currently should only support the first row (m) of a dataset.)
* Avoid eval() if possible
* Ins Deutsche übersetzen

```JSON
{
   "customerId": "ondics-8925-f7bfacb618a4",
   "9d82699b-373a-4b2a-8925-f7bfacb618a4-prodData":{
      "mqtt-topic":"kosmos/machine-data/9d82699b-373a-4b2a-8925-f7bfacb618a4/Sensor/tbd/Update",
      "blockchain":{
         "endpoint":"http://kosmos-2017317103.eu-central-1.elb.amazonaws.com/api/machine/9d82699b-373a-4b2a-8925-f7bfacb618a4/prodData",
         "data-mapping":[
            {
               "column":"msg.payload.columns[0]",
               "value":"msg.payload.data[0][0]"
            },
            {
               "column":"msg.payload.columns[1]",
               "value":"msg.payload.data[1][0]"
            },
            {
               "column":"msg.payload.columns[2]",
               "value":"msg.payload.data[2][0]"
            },
            {
               "column":"msg.payload.columns[3]",
               "value":"msg.payload.data[3][0]"
            },
            {
               "column":"msg.payload.columns[4]",
               "value":"msg.payload.data[4][0]"
            },
            {
               "column":"msg.payload.columns[5]",
               "value":"msg.payload.data[5][0]"
            }
         ]
      }
   }
}
```

# Changes

2020-12-10: 2. draft
* For use with Datarella HTTPS-API

2020-09-14: 1. draft
* For use with node-red-contrib-fabric