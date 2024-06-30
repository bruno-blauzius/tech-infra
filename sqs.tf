resource "aws_kms_key" "fiap_sqs_key" {
  description             = "KMS key for SQS encryption"
  deletion_window_in_days = 10
}

#CONFIRMAÇÃO DE PAGAMENTO
resource "aws_sqs_queue" "confirmacao_pagamento_fifo" {
  name                      = "confirmacao-pagamento.fifo"
  receive_wait_time_seconds = 10
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.confirmacao_pagamento_dlq.arn
    maxReceiveCount     = 2
  })
  tags = {
    Environment = "FIAP-SQS"
  }
}
resource "aws_sqs_queue" "confirmacao_pagamento_dlq" {
  name = "confirmacao-pagamento-dlq.fifo"
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
}
resource "aws_sqs_queue_redrive_allow_policy" "confirmacao_pagamento_fifo_policy" {
  queue_url = aws_sqs_queue.confirmacao_pagamento_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.confirmacao_pagamento_fifo.arn]
  })
}

#PEDIDO ENTREGA CANCELAR
resource "aws_sqs_queue" "pedido_entrega_cancelar_fifo" {
  name                      = "pedido-entrega-cancelar.fifo"
  receive_wait_time_seconds = 10
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.pedido_entrega_cancelar_dlq.arn
    maxReceiveCount     = 2
  })
  tags = {
    Environment = "FIAP-SQS"
  }
}
resource "aws_sqs_queue" "pedido_entrega_cancelar_dlq" {
  name = "pedido-entrega-cancelar-dlq.fifo"
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
}
resource "aws_sqs_queue_redrive_allow_policy" "pedido_entrega_cancelar_fifo_policy" {
  queue_url = aws_sqs_queue.pedido_entrega_cancelar_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.pedido_entrega_cancelar_fifo.arn]
  })
}

#PEDIDO ENTREGA
resource "aws_sqs_queue" "pedido_entrega_fifo" {
  name                      = "pedido-entrega.fifo"
  receive_wait_time_seconds = 10
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.pedido_entrega_dlq.arn
    maxReceiveCount     = 2
  })
  tags = {
    Environment = "FIAP-SQS"
  }
}
resource "aws_sqs_queue" "pedido_entrega_dlq" {
  name = "pedido-entrega-dlq.fifo"
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
}
resource "aws_sqs_queue_redrive_allow_policy" "pedido_entrega_fifo_policy" {
  queue_url = aws_sqs_queue.pedido_entrega_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.pedido_entrega_fifo.arn]
  })
}

#CANCELAR PEDIDO
resource "aws_sqs_queue" "cancelar_pedido_fifo" {
  name                      = "cancelar-pedido.fifo"
  receive_wait_time_seconds = 10
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.cancelar_pedido_dlq.arn
    maxReceiveCount     = 2
  })
  tags = {
    Environment = "FIAP-SQS"
  }
}
resource "aws_sqs_queue" "cancelar_pedido_dlq" {
  name = "cancelar-pedido-dlq.fifo"
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
}
resource "aws_sqs_queue_redrive_allow_policy" "cancelar_pedido_fifo_policy" {
  queue_url = aws_sqs_queue.cancelar_pedido_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.cancelar_pedido_fifo.arn]
  })
}


#PEDIDO FINALIZADO
resource "aws_sqs_queue" "pedido_finalizado_fifo" {
  name                      = "pedido-finalizado.fifo"
  receive_wait_time_seconds = 10
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.pedido_finalizado_dlq.arn
    maxReceiveCount     = 2
  })
  tags = {
    Environment = "FIAP-SQS"
  }
}
resource "aws_sqs_queue" "pedido_finalizado_dlq" {
  name = "pedido-finalizado-dlq.fifo"
  fifo_queue                = true
  kms_master_key_id         = aws_kms_key.fiap_sqs_key.arn
}
resource "aws_sqs_queue_redrive_allow_policy" "pedido_finalizado_fifo_policy" {
  queue_url = aws_sqs_queue.pedido_finalizado_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.pedido_finalizado_fifo.arn]
  })
}