SitemapGenerator::Sitemap.default_host = "localhost:3000"

SitemapGenerator::Sitemap.create do
  add clients_products_path, :priority => 0.5, :changefreq => 'daily'
  Product.find_each do |prod|
    add clients_product_path(prod), :lastmod => prod.updated_at, :priority => 0.5
  end
end