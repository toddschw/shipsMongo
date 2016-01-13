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
