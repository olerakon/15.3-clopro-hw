resource "yandex_kms_symmetric_key" "bucket_key" {
  name                = "clopro-hw-kms-key"
  description         = "KMS key for Object Storage bucket encryption"
  default_algorithm   = "AES_256"
  rotation_period     = "8760h"
  deletion_protection = false

  labels = {
    project = "clopro-hw"
  }
}