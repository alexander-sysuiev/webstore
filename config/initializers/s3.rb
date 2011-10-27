# AWS::S3::Base.establish_connection!(
#   :access_key_id     => ENV['S3_KEY'],
#   :secret_access_key => ENV['S3_SECRET']
# )

# AKIAJ7B33CX46N5YJJOQ
# c7EANSYaJZG+QjpO5TFzQndknBg8VNEIuifYwee0

# AWS::S3::Base
S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => "webstore-production"}