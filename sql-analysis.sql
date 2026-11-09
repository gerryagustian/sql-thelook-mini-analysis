-- Analisis 
-- Menampilkan karakteristik produk (nama, kategori, departemen, merk, dan harga retail)
SELECT
  name,
  category,
  department,
  brand,
  retail_price
FROM bigquery-public-data.thelook_ecommerce.products
ORDER BY name ASC
LIMIT 20;

-- Evaluasi kategori produk
-- Mengetahui kategori produk dengan jumlah produk paling banyak
SELECT
  category,
  COUNT(id) AS jumlah_produk
FROM bigquery-public-data.thelook_ecommerce.products
GROUP BY category
ORDER BY jumlah_produk DESC;

-- INSIGHT:
-- Kategori dengan jumlah produk paling banyak adalah 'Intimates' dengan 2,363 produk
-- Kategori dengan jumlah produk paling sedikit adalah 'Clothing Sets' dengan 37 produk

-- Analisis penjualan per kategori
-- Hitung total penjualan per kategori, diurutkan dari nilai terbesar
SELECT
  p.category,
  SUM(oi.sale_price) AS total_penjualan
FROM bigquery-public-data.thelook_ecommerce.order_items AS oi
JOIN bigquery-public-data.thelook_ecommerce.products AS p
ON oi.product_id = p.id
WHERE oi.status = 'Complete'
GROUP BY p.category
ORDER BY total_penjualan DESC;

-- INSIGHT:
-- Kategori dengan jumlah pendapatan terbesar adalah 'Outerwear & Coats' dengan total 329,610.73
-- Kategori dengan jumlah pendapatan terkecil adalah 'Clothing Sets' dengan total 3,960.18
