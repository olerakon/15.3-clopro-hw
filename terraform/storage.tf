resource "yandex_storage_bucket" "images" {
  access_key = var.storage_access_key
  secret_key = var.storage_secret_key

  bucket   = var.bucket_name
  max_size = 1073741824

  force_destroy = true

  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket_key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "homework_image" {
  access_key = var.storage_access_key
  secret_key = var.storage_secret_key

  bucket       = yandex_storage_bucket.images.bucket
  key          = var.image_object_key
  source       = var.image_source_path
  content_type = var.image_content_type
}