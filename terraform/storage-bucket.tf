provider "yandex" {
    token = "test"
    cloud_id = "test"
    folder_id = "test"
    zone = "ru-central1-a"
}

resource "yandex_storage_bucket" "test" {
    access_key = "test"
    secret_key = "test"
    bucket = "danoque"
}
