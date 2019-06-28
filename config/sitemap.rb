require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = "https://www.lapenderiedelhomme.fr"

SitemapGenerator::Sitemap.create do
	add root_path :changefreq => 'daily'
  # add clients_products_path, :priority => 0.5, :changefreq => 'daily'
  Product.find_each do |prod|
    add clients_product_path(prod), :lastmod => prod.updated_at, :priority => 0.5
  end
end

SitemapGenerator::Sitemap.ping_search_engines