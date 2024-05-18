resource "aws_ecr_repository" "repositorio" {
  name = var.NOME_REPOSITORIO
}


resource "aws_ecr_repository" "repositorio_pagamento" {
  name = var.NOME_REPOSITORIO_PAGAMENTO
}


resource "aws_ecr_repository" "repositorio_entrega" {
  name = var.NOME_REPOSITORIO_ENTREGA
}


resource "aws_ecr_repository" "repositorio_user_autentication" {
  name = var.NOME_REPOSITORIO_USER_AUTH
}