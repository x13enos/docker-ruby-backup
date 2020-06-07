Model.new(:my_backup, "Postgres backup with storing on S3") do
  database PostgreSQL do |db|
    db.name               = ENV["DB_NAME"]
    db.username           = ENV["DB_USER_NAME"]
    db.password           = ENV["DB_PASSWORD"]
    db.host               = ENV["DB_HOST"]
    # db.port               = ENV["DB_PORT"]
  end

  store_with S3 do |s3|
    s3.access_key_id      = ENV["S3_ID"]
    s3.secret_access_key  = ENV["S3_KEY"]
    s3.region             = ENV["S3_REGION"]
    s3.bucket             = ENV["S3_BUCKET"]
    s3.path               = ENV["S3_PATH"] || "/"
    s3.keep               = ENV["STORAGE_KEEP"]
  end

  compress_with Gzip do |compression|
    compression.level = 5
  end
end
