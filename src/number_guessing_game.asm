# Dominick Ferro
# 11/06/2023
# C++ number game translated to MIPS Assembly
# Simple number guessing game

.data
    prompt1:      .asciiz "Player 1: Enter a number between 1 and 10: "
    prompt2:      .asciiz "Next player\n"
    prompt3:      .asciiz "Please enter your guess between 1 and 10: "
    wrong_guess:  .asciiz "Please guess again!\n"
    win_msg:      .asciiz "YOU WIN!"

.text
main:
    # Print prompt1
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read hiddenNumber
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 stores hiddenNumber

    # Print prompt2
    li $v0, 4
    la $a0, prompt2
    syscall

guess_loop:
    # Print prompt3
    li $v0, 4
    la $a0, prompt3
    syscall

    # Read guess
    li $v0, 5
    syscall
    move $t1, $v0  # $t1 stores guess

    # Compare guess with hiddenNumber
    beq $t1, $t0, win
    bne $t1, $t0, wrong

wrong:
    # Print wrong_guess
    li $v0, 4
    la $a0, wrong_guess
    syscall
    j guess_loop

win:
    # Print win_msg
    li $v0, 4
    la $a0, win_msg
    syscall

    # Exit
    li $v0, 10
    syscall
