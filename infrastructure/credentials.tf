provider "google" {
  version     = "~> 3.5"
  credentials = file("~/.gcp/credentials/fastai-274000-6110a43bad1b.json")
  project     = "fastai-274000"
  region      = "us-east4"
}
