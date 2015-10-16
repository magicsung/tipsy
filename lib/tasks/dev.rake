namespace :dev do

  task :fetch_yelp => :environment do

    puts "fetching yelp"

    require 'yelp'

    yelp_config = Rails.application.config_for(:yelp)

    Yelp.client.configure do |config|
      config.consumer_key = yelp_config["Consumer_Key"]
      config.consumer_secret = yelp_config["Consumer_Secret"]
      config.token = yelp_config["Token"]
      config.token_secret = yelp_config["Token_Secret"]
    end

    # count data

    params = { term: 'pub', limit: 20 }
    locale = { lang: 'zh' }
    kk = Yelp.client.search('taipei', params, locale)
    round = kk.total / 20 + 1
    puts "Total round: #{round}"


    # business api

    # data = Yelp.client.business( URI.escape( 'relax-jazz-pub-台北市大安區' ) )
    # puts data.inspect


    # get data

    i = 0
    while i <= round
      puts "page #{i}"
      
      params = { term: 'pub', limit: 20, offset: ( i * 20 ) }
      locale = { lang: 'zh' }
      xx = Yelp.client.search('taipei', params, locale)

      xx.businesses.each do |b|
        if s = Store.find_by_name(b.name)
          puts "update #{b.name}"
          # update
          s.location_city = b.try(:location).try(:city)
          s.location_address = b.try(:location).try(:display_address).join(" ")
          s.phone = b.try(:display_phone)
          s.coordinate_lat = b.try(:location).try(:coordinate).try(:latitude)
          s.coordinate_lon = b.try(:location).try(:coordinate).try(:longitude)
          s.yelp_id = b.try(:id)
          s.yelp_image = b.try(:image_url)
          s.save
        else
          puts "create #{b.name}"
          # create
          s = Store.new
          s.name = b.name
          s.location_city = b.try(:location).try(:city)
          s.location_address = b.try(:location).try(:display_address).join(" ")
          s.phone = b.try(:display_phone)
          s.coordinate_lat = b.try(:location).try(:coordinate).try(:latitude)
          s.coordinate_lon = b.try(:location).try(:coordinate).try(:longitude)
          s.yelp_id = b.try(:id)
          s.yelp_image = b.try(:image_url)
          s.save!
        end
      end

    i += 1
    end


  end

end