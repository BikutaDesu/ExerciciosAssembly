# Coletar o o valor do lado de um quadrado, calcular sua área e apresentar o resultado
.data
  msg1: .asciiz "\n\n Digite o valor do lado do quadrado: "
  msg2: .asciiz "\n Area: "
.text
main:

  # $t0 - area
  # $t1 - lado

  li $t0, 0
  li $t1, 0

  # Escreva (msg1)
  li $v0, 4
  la $a0, msg1
  syscall

  # leia($t1)
  li $v0, 5
  syscall
  add $t1, $v0, $zero # $t1 <- $v0 + 0

  # area <- lado * lado
  mul $t0, $t1, $t1

  # escreva (msg2 + area)
  li $v0, 4
  la$a0, msg2
  syscall

  li $v0, 1
  add $a0, $t0, $zero
  syscall
