# Refactored ShipSticks Ruby Challenge
1. Use MongoDB/Mongoid
2. Refactor best match method

## API Documentation 

Show ONE product that best matches a given length/width/height/weight query.  For example, the query below will return "Golf - Small Package":

```
curl -i -H "Accept: application/JSON" -H "Content-type: application/JSON" -X GET -d '{"length":48,"width":14,"height":12,"weight":42}' localhost:3000/api/query
```

## Rake task to import products.json

```
task :importseeds => :environment do
    require 'json'

    file = File.read('products.json')
    data_hash = JSON.parse(file)

    data_hash.each do | key, value |
      record_count = value.count
      for i in 0..(record_count - 1)
         product = Product.new value[i]
         product.save
      end
    end
end
```

