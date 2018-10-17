# Receber o salário de um funcionário e mostrar o mesmo com reajuste de 15%
.data
  msg1: .asciiz "\n\n Digite o valor do salario: "
  msg2: .asciiz "\n Salario com reajuste de 15%: R$ "
.text
main:

  # $f1 - salario
  # $f2 - aux
  # $f3 - 15
  # $f4 - 100

  li.s $f1, 0.0
  li.s $f2, 0.0
  li.s $f3, 15.0
  li.s $f4, 100.0

  # Escreva(msg1)
  li $v0, 4
  la $a0, msg1
  syscall

  # Leia(salario)
  li $v0, 6 # 6 leitura de numeros reais
  syscall
  mov.s $f1, $f0 # $f0 e reservado para leitura de pontos flutuantes

  # aux <- (salario * 15)
  mul.s $f2, $f1, $f3
  # aux <- (aux / 100)
  div.s $f2, $f2, $f4
  # salario <- salario + aux
  add.s $f1, $f1, $f2

  # Escreva(msg2 + salario)
  li $v0, 4
  la $a0, msg2
  syscall

  # escrita de numero real
  li $v0, 2
  mov.s $f12, $f1
  syscall
