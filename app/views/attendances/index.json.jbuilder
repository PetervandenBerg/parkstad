json.array!(@attendances) do |attendance|
  json.extract! attendance, :attending, :msg
  json.url attendance_url(attendance, format: :json)
end
