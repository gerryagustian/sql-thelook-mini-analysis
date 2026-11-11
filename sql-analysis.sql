-- Analisis 
-- 1 Menampilkan karakteristik produk (nama, kategori, departemen, merk, dan harga retail)
SELECT
  name,
  category,
  department,
  brand,
  retail_price
FROM bigquery-public-data.thelook_ecommerce.products
ORDER BY name ASC
LIMIT 20;

-- Identifikasi produk premium
-- 2 Produk dengan retail_price di atas 100, tampilkan nama produk, kategori, merek, dan harga retail
SELECT
  name,
  category,
  brand,
  retail_price
FROM bigquery-public-data.thelook_ecommerce.products
WHERE retail_price > 100
ORDER BY retail_price DESC;

-- INSIGHT:
-- Produk dengan harga retail tertinggi adalah Alpha Industries Rip Stop Short dengan harga 999.0
-- Produk dengan harga retail terrendah adalah Canada Goose Women's Whistler Parka dengan harga 695.0

-- Evaluasi kategori produk
-- 3 Mengetahui kategori produk dengan jumlah produk paling banyak
SELECT
  category,
  COUNT(id) AS jumlah_produk
FROM bigquery-public-data.thelook_ecommerce.products
GROUP BY category
ORDER BY jumlah_produk DESC;

-- INSIGHT:
-- Kategori dengan jumlah produk paling banyak adalah 'Intimates' dengan 2,363 produk
-- Kategori dengan jumlah produk paling sedikit adalah 'Clothing Sets' dengan 37 produk


-- Mengenal pelanggan dan pesanan
-- 4 Melihat pelanggan yang melakukan pesanan
SELECT
  o.order_id,
  o.status,
  o.created_at,
  u.first_name,
  u.last_name
FROM bigquery-public-data.thelook_ecommerce.orders as o
JOIN bigquery-public-data.thelook_ecommerce.users as u
ON o.user_id = u.id;


-- Analisis penjualan per kategori
-- 5 Hitung total penjualan per kategori, diurutkan dari nilai terbesar
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
