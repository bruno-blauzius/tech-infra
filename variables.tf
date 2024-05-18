variable "NOME_REPOSITORIO" {
  type = string
}

variable "NOME_REPOSITORIO_PAGAMENTO" {
  type = string
}

variable "NOME_REPOSITORIO_ENTREGA" {
  type = string
}

variable "NOME_REPOSITORIO_USER_AUTH" {
  type = string
}

variable "COGNITO_USER_POOL" {
  type = string
}

variable "LAMBDA_AUTH_NAME" {
  type = string
}


variable "CLUSTER_NAME" {
  type = string
}

variable "BUCKET" {
  type = string
}

variable "REGION" {
  type = string
  default = "us-east-1"
}

variable "MONGODB_USER" {
  type = string
}

variable "MONGO_PORT" {
  type = string
}

variable "MONGODB_PASSWORD" {
  type = string
}