# Refactored ShipSticks Ruby Challenge
1. Use MongoDB/Mongoid
2. Refactor best match method

## API Documentation 

#CRUD sample requests

SHOW

-- Show ONE product that best matches a given length/width/height/weight query.  For example, the query below will return "Golf - Small Package":

```
curl -i -H "Accept: application/JSON" -H "Content-type: application/JSON" -X GET -d '{"length":48,"width":14,"height":12,"weight":42}' localhost:3000/api/query
```

-- Show ALL products
```
curl -i -H "Accept: application/JSON" -X GET localhost:3000/api/products
```

CREATE

-- Create a product
```
curl -i -H "Accept: application/JSON" -H "Content-type: application/JSON" -X POST -d '{"name":"new product","type":"new type","length":10,"width":20,"height":30,"weight":40}' localhost:3000/api/products
```

UPDATE
-- Update a product, for example product with id 56969bb49b21b3e1fb000000
```
curl -i -H "Accept: application/JSON" -H "Content-type: application/JSON" -X PUT -d '{"length":10,"width":20,"height":30,"weight":5000}' localhost:3000/api/products/56969bb49b21b3e1fb000000
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

