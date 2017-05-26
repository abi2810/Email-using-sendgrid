json.extract! user_mail, :id, :name, :email, :login, :created_at, :updated_at
json.url user_mail_url(user_mail, format: :json)