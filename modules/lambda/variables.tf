
variable "policy_arn" {
  type        = list(string)
  description = "Policy A attacher au role à utiliser avec Lambda"
  default     = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AWSLambda_FullAccess"]
}