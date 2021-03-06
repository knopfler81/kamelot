require 'fog-aws'

SitemapGenerator::Sitemap.default_host = "http://lapenderiedelhomme.fr"
SitemapGenerator::Sitemap.sitemaps_host = "http://shopsuper.s3.eu-west-3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(fog_provider: 'AWS',
                                                                    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                                                    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                                                    fog_directory: ENV['S3_BUCKET_NAME'],

                                                                    fog_region: 'eu-west-3')
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.ping_search_engines('https://lapenderiedelhomme.fr/sitemaps')

SitemapGenerator::Sitemap.create do
  add clients_products_path, :priority => 0.5, :changefreq => 'daily'

  Product.find_each do |prod|
    add clients_product_path(prod),:lastmod => prod.updated_at, :priority => 0.5
  end

end
