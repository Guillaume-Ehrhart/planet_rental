json.extract! product, :id, :galaxy, :system, :price_per_night, :name, :user_id, :description, :distance_from_sun, :created_at, :updated_at
json.url product_url(product, format: :json)
