json.array!(@pins) do |pin|
  json.extract! pin, :id, :title, :description, :daily, :weekly, :monthly
  json.url pin_url(pin, format: :json)
end
