# 📦 Terraform Backend Setup – S3 + DynamoDB

This Terraform module creates a backend for storing remote Terraform state in an **S3 bucket** and handling state locking using a **DynamoDB table**.

---

## 🚀 Purpose

In large or team-based infrastructure projects, it's best practice to store Terraform state remotely and lock it during changes. This project automates the setup of:

- 🪣 An S3 bucket for storing `.tfstate` files
- 🗃️ A DynamoDB table for state locking

---

## 📂 Folder Structure

```plaintext
S3&DynamoDB/
├── s3.tf            # Main resources (S3 + DynamoDB)
├── variables.tf     # Input variables
├── outputs.tf       # Output values
├── random.tf        # Random ID generator for unique bucket names
├── .gitignore       # Ignore state files and sensitive files
```

---

## ⚙️ How It Works

- A unique S3 bucket name is auto-generated using the `random_id` resource to avoid name collisions.
- DynamoDB table uses `LockID` as the partition key for safe concurrent state operations.

---

## ✅ Usage

### 1. Navigate to the folder

```bash
cd S3&DynamoDB
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Apply the configuration

```bash
terraform apply -auto-approve
```

---

### 📤 Output

```bash
Outputs:

s3_bucket_name       = "tf-backend-abc123"
dynamodb_table_name  = "tf-backend-locks"
```

---

### 🔗 Connect to Main Terraform Project

Use the output values in your actual Terraform project’s terraform block:

```bash
terraform {
  backend "s3" {
    bucket         = "tf-backend-abc123"   # Use your output bucket name
    key            = "main/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-backend-locks"    # Use your output table name
    encrypt        = true
  }
}
```

Then run in your main Terraform project:

```bash
terraform init
```

---

## 📸 Backend Initialization Screenshot

This image is in `assets/Images`:

![Backend Initialization](assets/Images/Initiating-Backend.jpg)
