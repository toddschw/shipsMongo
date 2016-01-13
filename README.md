# Refactored ShipSticks Ruby Challenge
1. Use MongoDB/Mongoid
2. Refactor best match method

## API Documentation 

Show ONE product that best matches a given length/width/height/weight query

```
curl -i -H "Accept: application/JSON" -H "Content-type: application/JSON" -X GET -d '{"length":48,"width":14,"height":12,"weight":42}' localhost:3000/api/query
```
