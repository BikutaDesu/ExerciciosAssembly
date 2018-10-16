# Faça um algoritmo que receba um número octal (1 < número < 10000)
# e converta para decimal.
.data
  msgInicial: .asciiz "\n--------------------Conversor Octal para Decimal--------------------\n\n"
  msg1: .asciiz "Digite um numero em octal: "
  msg2: .asciiz "\nNumero em Decimal: "
  pulaLinha: .asciiz "\n"
.text
main:

  # $t0 - num
  # $t1 - vDec
  # $t2 - base
  # $t3 - aux
  # $t4 - resto
  # $t5 - aux2

  li $t0, 0
  li $t1, 0
  li $t2, 1
  li $t3, 0
  li $t4, 0
  li $t5, 0

  # Mensagem principal
  li $v0, 4
  la $a0, msgInicial
  syscall

  # Recebendo numero
  # mensagem
  li $v0, 4
  la $a0, msg1
  syscall

  # recebendo valor
  li $v0, 5
  syscall
  add $t0, $v0, $zero # $t1 <- $v0 + 0

  # aux <- num + 0
  add $t3, $t0, $zero

  enquanto:
    # resto <- aux % 10
    rem $t4, $t3, 10

    # aux <- aux / 10
    div $t3, $t3, 10

    # vDec <- vDec + (resto * base)
    mul $t5, $t4, $t2
    add $t1, $t1, $t5

    # base <- base * 8
    mul $t2, $t2, 8

    # (aux > 0)
    bgt $t3, 0, enquanto
  fimEnquanto:

  # Mensagem do resultado
  li $v0, 4
  la $a0, msg2
  syscall

  # Resultado
  li $v0, 1
  add $a0, $t1, 0
  syscall
