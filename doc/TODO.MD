# Todo

## Technical
* Auf `docker run` umbauen (kein docker-compose mehr)

## Specification
* Wie soll mit mehreren Datensätzen umgegangen werden? (Siehe BCC_CONFIG-TODO -> data[n][m])

## Security

* Node-RED Editor Passwort schützen
* Der Ausdruck "msg.payload.columns[0]" in der BCC_CONFIG wird in Node-RED ausgeführt: 
    ```
        [...]
        eval(msg.payload.columns[0])
        [...]
    ```
    Damit wäre es unter umständen möglich, das ein Störer schadcode ausführt.

## Finished

* ~~API Response Log-Tables~~  
* ~~Assign Requests to Responses~~  
* ~~Test API connection~~
* ~~API URI docker-compose~~
* ~~Document BCC_CONFIG JSON~~