json.extract! post, :id, :title, :description, :image_data, :slug, :created_at, :updated_at
json.url post_url(post, format: :json)
