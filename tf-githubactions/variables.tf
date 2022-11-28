variable "project_id" {
    type = string
    #default = var.PROJECT_ID
    default = "be-nishiyama-wataru"
}

variable "project_num" {
    type = number
    #default = var.PROJECT_NUM
    default = 275359409145
}

variable "repo_name" {
  description = "github repository name"
  default     = "runble1/nextjs-cloudrun-gha"
}