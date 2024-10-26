variable "service_account_key" {
  description = "Path to the service account key JSON file"
  type        = string
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Folder ID"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud availability zone"
  type        = string
  default     = "ru-central1-b"
}

variable "image_id" {
  description = "ID image for VM"
  type        = string
}
