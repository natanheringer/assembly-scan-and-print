; ----------------------------------------
; Form Input Program (x86_64 Linux syscall)
; Prompts user for name and age, then prints back
; Author: Natan Heringer
; ----------------------------------------


section .data 

   ; Initialized (static) data section.
   ; Stores strings and constant values used by the program.


    prompt_name db "Enter your name: ", 0xA
    len_name equ $ - prompt_name
    
    prompt_age db "Enter your age: ", 0xA
    len_age equ $ - prompt_age 
    
    separator db 0xA, "----------------", 0xA
    len_sep equ $ - separator
    
    result_msg db "You entered: ", 0xA
    len_result equ $ - result_msg
   
    name_label db "Name: "
    len_name_label equ $ - name_label
    
    age_label db "Age: " 
    len_age_label equ $ - age_label 


    newline db 0xA        ; New line \n 



section .bss

   ; Reserves memory for variables that don't have an initial value.
   ; Typically used for input buffers and temporary storage.

    name resb 100
    age resb 10
        
        
section .text
    
    ; Executable code section.
    ; Holds the program's instructions.

    global _start  ; Entry point for the program 
	    
    
  
_start: 


    ; Program execution stack begins here
    ; System calls to print and read data go below

main_loop:


  ; Print newline 
   
  mov rax, 1 
  mov rdi, 1
  mov rsi, newline 
  mov rdx, 1 
  syscall 

  ; Separator 
  mov rax, 1 
  mov rdi, 1 
  mov rsi, separator 
  mov rdx, len_sep
  syscall 

  ; Print newline 
   
  mov rax, 1 
  mov rdi, 1
  mov rsi, newline 
  mov rdx, 1 
  syscall 

  ; Print "Enter your name"
  mov rax, 1           ; syscall: write
  mov rdi, 1           ; fd = stdout
  mov rsi, prompt_name ; pointer to string
  mov rdx, len_name    ; length
  syscall
  
  ; Read name into buffer
  
  mov rax, 0
  mov rdi, 0
  mov rsi, name
  mov rdx, 100 
  syscall
  mov r12, rax 
  dec r12            ; remove \n character from input 
  
  ; Print "Enter your age"
  
  mov rax, 1
  mov rdi, 1
  mov rsi, prompt_age
  mov rdx, len_age
  syscall
  
  ; Read age into buffer 
  mov rax, 0 
  mov rdi, 0 
  mov rsi, age
  mov rdx, 10 
  syscall 
  mov r13, rax 
  dec r13            ; remove \n character from input

  ; Separator 
  mov rax, 1 
  mov rdi, 1 
  mov rsi, separator 
  mov rdx, len_sep
  syscall 

  ; Print newline 
   
  mov rax, 1 
  mov rdi, 1
  mov rsi, newline 
  mov rdx, 1 
  syscall 
  
  ; Print "You entered: "
  
  mov rax, 1
  mov rdi, 1
  mov rsi, result_msg
  mov rdx, len_result
  syscall

  ; Print "Name: "
  
  mov rax, 1 
  mov rdi, 1 
  mov rsi, name_label
  mov rdx, len_name_label
  syscall

  ; Print name buffer
  
  mov rax, 1
  mov rdi, 1
  mov rsi, name
  mov rdx, r12
  syscall


  ; Print newline 
   
  mov rax, 1 
  mov rdi, 1
  mov rsi, newline 
  mov rdx, 1 
  syscall 

  ; Print "Age: "
  mov rax, 1 
  mov rdi, 1 
  mov rsi, age_label
  mov rdx, len_age_label
  syscall 

  ; Print age buffer
  
  mov rax, 1
  mov rdi, 1 
  mov rsi, age 
  mov rdx, r13
  syscall 

  ; Print newline 
   
  mov rax, 1 
  mov rdi, 1
  mov rsi, newline 
  mov rdx, 1 
  syscall 
  
  ; Final separator 
  
  mov rax, 1
  mov rdi, 1 
  mov rsi, separator 
  mov rdx, len_sep
  syscall 

  ; Print newline 
   
  mov rax, 1 
  mov rdi, 1
  mov rsi, newline 
  mov rdx, 1 
  syscall 



  ; exit 
  mov rax, 60 
  xor rdi, rdi 
  syscall 
  
  
  
  
  
  
  
  