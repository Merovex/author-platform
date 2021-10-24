class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

# set to true for geocoding (and add the geocoder gem to your Gemfile)
# we recommend configuring local geocoding as well
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = false
Ahoy.mask_ips = true
Ahoy.cookies = false
Ahoy.geocode = true
Ahoy.job_queue = :low_priority
Ahoy.visit_duration = 4.hours
# def track_visit(data)
#   data[:country] = request.headers["<country-header>"]
#   data[:region] = request.headers["<region-header>"]
#   data[:city] = request.headers["<city-header>"]
#   super(data)
# end
ActsAsTaggableOn::Tagging.class_eval do
  clear_validators!
end
