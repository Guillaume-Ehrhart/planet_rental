json.extract! booking, :id, :date_in, :date_out, :product_id, :comment, :user_id, :total_price, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
