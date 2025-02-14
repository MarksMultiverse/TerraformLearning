locals {
  common_tags = {
    Project     = var.Project
    Responsible = var.Responsible
    Environment = var.environment
  }

  naming_prefix = "${var.naming_prefix}-${var.environment}"
}

