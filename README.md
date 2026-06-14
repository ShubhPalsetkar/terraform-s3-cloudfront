# Terraform: AWS S3 + CloudFront Static Site
**Infrastructure as Code — Shubh Palsetkar**

This project provisions the exact same AWS infrastructure as the manually built
"AWS Secure Static Content Delivery Architecture" project — but fully automated with Terraform.

---

## Architecture

```
User (Browser)
     │
     │ HTTPS
     ▼
Amazon CloudFront (CDN)
     │
     │ Origin Access Control (OAC) — private, signed requests only
     ▼
Private Amazon S3 Bucket
  ├── index.html
  └── style.css
```

---

## Project Structure

```
terraform-s3-cloudfront/
├── main.tf         ← All AWS resources (S3, CloudFront, OAC, bucket policy)
├── variables.tf    ← Configurable settings (region, bucket name)
├── outputs.tf      ← Values printed after deployment (your live URL)
├── index.html      ← Your portfolio website
├── style.css       ← Your portfolio styles
└── README.md       ← This file
```

---

## Prerequisites

### 1. Install Terraform
- Download from: https://developer.hashicorp.com/terraform/install
- Verify: `terraform --version`

### 2. Install AWS CLI
- Download from: https://aws.amazon.com/cli/
- Verify: `aws --version`

### 3. Configure AWS Credentials
```bash
aws configure
```
Enter your:
- AWS Access Key ID
- AWS Secret Access Key
- Default region: `eu-west-2`
- Output format: `json`

> Get your keys from: AWS Console → IAM → Users → Your User → Security credentials

---

## Deployment Steps

### Step 1 — Initialise Terraform
```bash
terraform init
```
Downloads the AWS provider plugin. Only needed once.

### Step 2 — Preview what will be created
```bash
terraform plan
```
Shows you exactly what Terraform WILL create before touching anything.
You should see: **5 resources to add**.

### Step 3 — Deploy everything
```bash
terraform apply
```
Type `yes` when prompted. Terraform will:
1. Create private S3 bucket
2. Block all public access
3. Upload index.html and style.css
4. Create CloudFront OAC
5. Create CloudFront distribution
6. Apply S3 bucket policy

⏱️ CloudFront takes ~5–10 minutes to deploy globally.

### Step 4 — Get your live URL
After apply completes, Terraform prints:
```
cloudfront_url = "https://xxxxxxxxxx.cloudfront.net"
```
Open that URL in your browser — your site is live!

---

## Tearing Down (Important!)

To avoid AWS charges, destroy everything when done:
```bash
terraform destroy
```
Type `yes` — Terraform deletes ALL resources it created.

---

## Key Concepts Demonstrated

| Concept | How it's shown |
|---|---|
| Infrastructure as Code | All resources defined in .tf files |
| Secure design | Private S3, OAC, HTTPS redirect |
| Least-privilege IAM | Bucket policy only allows CloudFront |
| Cost-aware design | PriceClass_100, pay-per-request |
| Repeatable deployments | `terraform apply` recreates everything |
| Scalability | CloudFront CDN serves globally |

---

## Resume Bullet Points (suggested)

- Reprovisioned a secure S3 + CloudFront static site architecture using Terraform, automating resource creation, IAM bucket policies and OAC configuration as Infrastructure as Code
- Defined reusable, parameterised Terraform modules with variables and outputs, enabling repeatable and version-controlled deployments
- Applied cost-aware design using CloudFront PriceClass_100 and S3 standard storage, with full teardown via `terraform destroy`
