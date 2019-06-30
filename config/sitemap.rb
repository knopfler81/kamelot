# Set the host name for URL creation


require 'fog-aws'

SitemapGenerator::Sitemap.default_host = "https://www.lapenderiedelhomme.fr"

SitemapGenerator::Sitemap.create do
  add clients_products_path, :priority => 0.5, :changefreq => 'daily'

  Product.find_each do |prod|
    add clients_product_path(prod),:lastmod => prod.updated_at, :priority => 0.5
  end

end

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(fog_provider: 'AWS',
                                                                    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                                                    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'],
                                                                    fog_directory: ENV['S3_BUCKET_NAME'],
                                                                    fog_region: 'eu-west-3')

SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_host = "https://shopsuper.s3.eu-west-3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemap/'

SitemapGenerator::Sitemap.ping_search_engines('https://lapenderiedelhomme.fr/sitemap')