# Terraform AWS Certificate
Terraform module which creates ACM certificates and automatically validates them with Route 53.

## Usage
```hcl
module "certificate" {
  source  = "stuartizon/certificate/aws"
  version = "~> 0.1.2"
  domain_name = "example.com"
  subject_alternative_names = ["www.example.com"]
  zone_id     = "ZAAAAAAAAAAAAA"
  ttl = 60
  tags = {
    Environment = "Staging"
  }
}
```

## Variables
| Name | Type | Description | Default |
|------|------|-------------|---------|
| domain_name | `string` | The main domain name for the certificate | |
| zone_id | `string` | The ID of the Route 53 hosted zone corresponding to the top level domain name | |
| subject_alternative_names | `list(string)` | A list of alternate domains to include in the certificate | `[]` |
| ttl | `number` | The TTL for the Route 53 validation records (in seconds) | `60` |
| tags | `map` | A map of tags to assign to the certificate | `{}` |

## Outputs
| Name | Description |
|------|-------------|
| arn | The ARN of the validated certificate |